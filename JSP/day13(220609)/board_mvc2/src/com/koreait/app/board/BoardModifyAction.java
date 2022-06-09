package com.koreait.app.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.action.Action;
import com.koreait.action.ActionTo;
import com.koreait.app.board.dao.BoardDAO;
import com.koreait.app.board.dao.FileDAO;

public class BoardModifyAction implements Action{
	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		BoardDAO bdao = new BoardDAO();
		FileDAO fdao = new FileDAO();
		
		int boardnum = Integer.parseInt(req.getParameter("boardnum"));
		req.setAttribute("board", bdao.getDetail(boardnum));
		req.setAttribute("files", fdao.getFiles(boardnum));
		
		ActionTo acto = new ActionTo();
		acto.setRedirect(false);
		acto.setPath("/app/board/boardmodify.jsp");
		return acto;
	}
}
