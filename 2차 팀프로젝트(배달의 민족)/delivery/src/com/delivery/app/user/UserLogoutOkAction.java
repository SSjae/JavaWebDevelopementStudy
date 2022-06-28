package com.delivery.app.user;

import com.delivery.action.Action;
import com.delivery.action.ActionTo;
import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UserLogoutOkAction implements Action {
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out = resp.getWriter();
		
		req.getSession().removeAttribute("loginUser");
		out.write("<script>");
		out.write("location.href='" + req.getContextPath() + "/';");
		out.write("</script>");
		return null;
	}
}