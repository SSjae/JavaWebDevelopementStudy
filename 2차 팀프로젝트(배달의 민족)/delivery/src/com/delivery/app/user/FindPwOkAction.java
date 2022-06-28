package com.delivery.app.user;

import com.delivery.action.Action;
import com.delivery.action.ActionTo;
import com.delivery.app.user.dao.UserDAO;
import com.delivery.app.user.dao.UserDTO;
import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FindPwOkAction implements Action {
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out = resp.getWriter();
		
		UserDAO udao = new UserDAO();
		UserDTO udto = new UserDTO();
		
		String userid = req.getParameter("userid");
		String username = req.getParameter("username");
		String userphone = req.getParameter("userphone");
		
		udto.setUserid(userid);
		udto.setUsername(username);
		udto.setUserphone(userphone);
		UserDTO user = udao.findPw(udto);
		if (user == null) {
			out.write("<script>");
			out.write("alert('정보가 일치하지 않습니다.');");
			out.write("location.href='" + req.getContextPath() + "/user/FindIdPw.us';");
			out.write("</script>");
		} else {
			out.write("<script>");
			out.write("location.href='" + req.getContextPath() + "/user/FindIdPwResult.us?path=pw&userid=" + user.getUserid() + "';");
			out.write("</script>");
		} 
		return null;
	}
}