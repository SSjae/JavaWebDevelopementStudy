package com.delivery.app.user;

import com.delivery.action.Action;
import com.delivery.action.ActionTo;
import com.delivery.app.user.dao.UserDAO;
import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CheckIdOkAction implements Action {
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String userid = req.getParameter("userid");
		UserDAO udao = new UserDAO();
		PrintWriter out = resp.getWriter();
		
		if (udao.checkId(userid)) {
			out.write("O");
	    } else {
	    	out.write("X");
	    } 
	    	return null;
	}
}