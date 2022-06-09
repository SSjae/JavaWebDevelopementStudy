package com.koreait.app.board;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.action.Action;
import com.koreait.action.ActionTo;
import com.koreait.app.board.dao.BoardDAO;
import com.koreait.app.board.dao.BoardDTO;
import com.koreait.app.board.dao.FileDAO;
import com.koreait.app.board.dao.FileDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class BoardWriteOkAction implements Action{
	// 디비에 업로드를 하게 되면 파일의 이름을 컴럼으로 만들어 지는데
	// 그 이름들이 중복이 될 수 있으므로 따로 systemname이 만들어지는데
	// cos 라이브러리가 파일의 이름이 중복되면 자동으로 수정해줘서 systemname에 넣어준다.

	// 파일 업로드 폴더를 지정해주고 파일을 올리게 되면 똑같은 프로젝트가 서버에 만들어지고
	// 그 서버에 있는 폴더에 우리들이 지정한 파일이 서버에 있는 폴더에 저장되게 된다.
	// 그래서 우리가 가지고 있는 폴더에 파일이 나타나지는 않는다.
	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		// cos 라이브러리 사용(아주아주 옛날 라이브러리) - 직접 알고리즘 짜서 사용해도 됨
		// http://www.servlets.com/
		// 파일 디비(업로드)에 저장
		
		// 파일이 저장될 경로
		// 서버에 올라간 폴더 경로를 찾기 위해 사용('file'이라는 폴더를 찾는 경로)
		String saveFolder = req.getServletContext().getRealPath("file");
		
		// 저장될 파일의 크기(5MB)
		int size = 1024*1024*5;
		
		// cos 라이브러리 이용
		MultipartRequest multi = new MultipartRequest(req, saveFolder, size, "UTF-8",
							new DefaultFileRenamePolicy()); // 기본파일이름변경정책

		boolean fcheck1 = false;
		boolean fcheck2 = false;
		
		// input[type=file] 태그의 name을 써주면 시스템상 이름을 받아올 수 있음
		String systemname1 = multi.getFilesystemName("file1");
		if(systemname1 == null) {
			fcheck1 = true;
		}
		// input[type=file] 태그의 name을 써주면 사용자가 업로드할 당시의 이름을 받아올 수 있음
		String orgname1 = multi.getOriginalFileName("file1");
		
		
		// input[type=file] 태그의 name을 써주면 시스템상 이름을 받아올 수 있음
		String systemname2 = multi.getFilesystemName("file2");
		if(systemname2 == null) {
			fcheck2 = true;
		}
		// input[type=file] 태그의 name을 써주면 사용자가 업로드할 당시의 이름을 받아올 수 있음
		String orgname2 = multi.getOriginalFileName("file2");
		
		String boardtitle = multi.getParameter("boardtitle");
		String boardcontents = multi.getParameter("boardcontents");
		String userid = multi.getParameter("userid");
		
		BoardDTO board = new BoardDTO();
		board.setBoardtitle(boardtitle);
		board.setBoardcontents(boardcontents);
		board.setUserid(userid);
		
		BoardDAO bdao = new BoardDAO();
		ActionTo acto = new ActionTo();
		int boardnum = 0;
		if(bdao.insertBoard(board)) {
			// 성공했으면 파일 업로드한 것을 디비에 저장해줘야 함
			FileDAO fdao = new FileDAO();
			boardnum = bdao.getLastNum(userid);
			if(!fcheck1) {
				FileDTO file = new FileDTO();
				file.setSystemname(systemname1);
				file.setOrgname(orgname1);
				file.setBoardnum(boardnum);
				
				fcheck1 = fdao.insertFile(file);
			}
			if(!fcheck2) {
				FileDTO file = new FileDTO();
				file.setSystemname(systemname2);
				file.setOrgname(orgname2);
				file.setBoardnum(boardnum);
				
				fcheck2 = fdao.insertFile(file);
			}
			
			// fcheck1, fcheck2가 true라는 뜻
			// 1. 원래 파일이 존재하지 않았음
			// 2. 파일이 존재했고, 위의 DB처리까지 완벽하게 성공했음
			if(fcheck1 && fcheck2) {
				acto.setRedirect(true);
				acto.setPath(req.getContextPath()+"/board/BoardView.bo?boardnum="+boardnum);
			}
		}
		else {
			acto.setRedirect(true);
			acto.setPath(req.getContextPath()+"/board/BoardList.bo");
			Cookie cookie = new Cookie("w", "f");
			resp.addCookie(cookie);
		}
		return null;
	}
}
