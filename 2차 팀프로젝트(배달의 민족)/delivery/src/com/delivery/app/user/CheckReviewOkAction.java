package com.delivery.app.user;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.delivery.action.Action;
import com.delivery.action.ActionTo;
import com.delivery.app.store.dao.ReviewDAO;
import com.delivery.app.user.dao.UserDTO;

public class CheckReviewOkAction implements Action{
	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		int storenum = Integer.parseInt(req.getParameter("sn"));
		UserDTO loginUser = (UserDTO) req.getSession().getAttribute("loginUser");
		
		ReviewDAO rdao = new ReviewDAO();
		
		PrintWriter out = resp.getWriter();
		
		if (rdao.checkReview(storenum, loginUser.getUserid())) {
			out.write("O");
	    } else {
	    	out.write("X");
	    } 
	    return null;
		
	}
}
