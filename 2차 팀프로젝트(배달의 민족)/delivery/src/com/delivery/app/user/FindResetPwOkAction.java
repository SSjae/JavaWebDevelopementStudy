package com.delivery.app.user;

import com.delivery.action.Action;
import com.delivery.action.ActionTo;
import com.delivery.app.user.dao.UserDAO;
import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FindResetPwOkAction implements Action {
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		resp.setCharacterEncoding("UTF-8");
    	resp.setContentType("text/html;charset=utf-8");
    	PrintWriter out = resp.getWriter();
    	
    	String userid = req.getParameter("userid");
    	String userpw = req.getParameter("userpw");
    	
    	UserDAO udao = new UserDAO();
    	if (udao.findResetPw(userid, userpw)) {
    		out.write("<script>");
    		out.write("alert('비밀번호 재설정 되었습니다.');");
    		out.write("location.href='" + req.getContextPath() + "/user/UserLogin.us';");
    		out.write("</script>");
    	} else {
    		out.write("<script>");
    		out.write("alert('비밀번호 재설정 실패하였습니다. 다시 시도해주세요.');");
    		out.write("location.href='" + req.getContextPath() + "/user/FindIdPw.us';");
    		out.write("</script>");
    	} 
    	return null;
	}
}