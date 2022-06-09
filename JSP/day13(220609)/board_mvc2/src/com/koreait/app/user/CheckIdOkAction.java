package com.koreait.app.user;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.action.Action;
import com.koreait.action.ActionTo;
import com.koreait.app.user.dao.UserDAO;

public class CheckIdOkAction implements Action{
	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String userid = req.getParameter("userid");
		
		UserDAO udao = new UserDAO();
		
		// 이동하는 게 아니라 Ajax로 그냥 응답만 해주면 되기 때문에 out.write 씀
		PrintWriter out = resp.getWriter();
		if(udao.checkId(userid)) {
			out.write("O");
		} else {
			out.write("X");
		}
		out.close();
		return null;
	}
}