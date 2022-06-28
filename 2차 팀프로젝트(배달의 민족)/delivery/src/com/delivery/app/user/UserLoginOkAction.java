package com.delivery.app.user;

import com.delivery.action.Action;
import com.delivery.action.ActionTo;
import com.delivery.app.user.dao.BasketDTO;
import com.delivery.app.user.dao.UserDAO;
import com.delivery.app.user.dao.UserDTO;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UserLoginOkAction implements Action {
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=utf-8");
		
		String userid = req.getParameter("userid");
		String userpw = req.getParameter("userpw");
		
		UserDAO udao = new UserDAO();
		PrintWriter out = resp.getWriter();
		
		UserDTO loginUser = udao.login(userid, userpw);
		List<BasketDTO> baskets = new ArrayList<BasketDTO>();
		
		if (loginUser != null) {
			req.getSession().setAttribute("loginUser", loginUser);
			req.getSession().setAttribute("baskets", baskets);
			out.write("<script>");
			out.write("alert('로그인이 완료되었습니다. " + loginUser.getUsernickname() + "님 환영합니다.');");
			out.write("location.href='" + req.getContextPath() + "/';");
			out.write("</script>");
		} else {
			out.write("<script>");
			out.write("alert('아이디 또는 비밀번호가 틀렸습니다. 다시 시도해 주세요.');");
			out.write("location.href='" + req.getContextPath() + "/user/UserLogin.us';");
			out.write("</script>");
		} 
		return null;
	}
}