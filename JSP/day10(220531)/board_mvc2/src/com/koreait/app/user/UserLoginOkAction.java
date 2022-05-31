package com.koreait.app.user;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.koreait.action.Action;
import com.koreait.action.ActionTo;
import com.koreait.app.user.dao.UserDAO;
import com.koreait.app.user.dao.UserDTO;

public class UserLoginOkAction implements Action{
	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=utf-8");
		
		String userid = req.getParameter("userid");
		String userpw = req.getParameter("userpw");
		PrintWriter out = resp.getWriter();
		
		UserDAO udao = new UserDAO();
		UserDTO loginUser = udao.login(userid, userpw);
		
		if(loginUser != null) {
			HttpSession session = req.getSession();
			session.setAttribute("loginUser", loginUser);
			out.print("<script>");
			out.print("alert('" + loginUser.getUsername()+"님 어서오세요~!');");
			out.print("location.href = '"+req.getContextPath()+"/board/BoardList.do';</script>");
		} else {
			out.print("<script>");
			out.print("location.href = '"+req.getContextPath()+"/';");
			out.print("</script>");
		}
		return null;
	}
}