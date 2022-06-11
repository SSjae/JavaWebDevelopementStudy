package com.koreait.app.board;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.action.Action;
import com.koreait.action.ActionTo;
import com.koreait.app.board.dao.BoardDAO;
import com.koreait.app.board.dao.FileDAO;
import com.koreait.app.board.dao.FileDTO;

public class BoardRemoveOkAction implements Action{
	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		BoardDAO bdao = new BoardDAO();
		FileDAO fdao = new FileDAO();
		int boardnum = Integer.parseInt(req.getParameter("boardnum"));
		List<FileDTO> files = fdao.getFiles(boardnum);
		String saveFolder = req.getServletContext().getRealPath("file");
		ActionTo acto = new ActionTo();
		acto.setRedirect(true);
		if(bdao.removeBoard(boardnum)) {
			for (int i = 0; i < files.size(); i++) {
				File file = new File(saveFolder,files.get(i).getSystemname());
				if(file.exists()) {
					file.delete();
					fdao.deleteByName(files.get(i).getSystemname());
				}
			}
			acto.setPath(req.getContextPath()+"/board/BoardList.bo");
		}
		else {
			acto.setPath(req.getContextPath()+"/board/BoardView.bo?boardnum="+boardnum);
		}
		return acto;
	}
}




