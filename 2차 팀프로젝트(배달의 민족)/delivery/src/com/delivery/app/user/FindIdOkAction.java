package com.delivery.app.user;

import com.delivery.action.Action;
import com.delivery.action.ActionTo;
import com.delivery.app.user.dao.UserDAO;
import com.delivery.app.user.dao.UserDTO;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FindIdOkAction implements Action {
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
	    resp.setCharacterEncoding("UTF-8");
	    resp.setContentType("text/html;charset=utf-8");
	    PrintWriter out = resp.getWriter();
	    
	    String username = req.getParameter("username");
	    String userphone = req.getParameter("userphone");
	    
	    UserDAO udao = new UserDAO();
	    
	    List<UserDTO> users = udao.findId(username, userphone);
	    if (users.size() == 0) {
	    	out.write("<script>");
	      	out.write("alert('가입된 회원이 없습니다.');");
	      	out.write("location.href='" + req.getContextPath() + "/user/UserLogin.us';");
		  	out.write("</script>");
	    } else {
	    	req.getSession().setAttribute("users", users);
	    	out.write("<script>");
	    	out.write("location.href='" + req.getContextPath() + "/user/FindIdPwResult.us?path=id';");
	    	out.write("</script>");
	    } 
	    return null;
	  }
}