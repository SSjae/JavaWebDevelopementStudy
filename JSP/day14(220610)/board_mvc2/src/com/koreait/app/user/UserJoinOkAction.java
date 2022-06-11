package com.koreait.app.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.action.Action;
import com.koreait.action.ActionTo;
import com.koreait.app.user.dao.UserDAO;
import com.koreait.app.user.dao.UserDTO;

public class UserJoinOkAction implements Action{
	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception{
		String userid = req.getParameter("userid");
		String userpw = req.getParameter("userpw");
		String username = req.getParameter("username");
		String usergender = req.getParameter("usergender");
		String zipcode = req.getParameter("zipcode");
		String addr = req.getParameter("addr");
		String addrdetail = req.getParameter("addrdetail");
		String addretc = req.getParameter("addretc");
		String[] userhobbies = req.getParameterValues("userhobby");
			
		UserDTO newUser = new UserDTO();
		newUser.setUserid(userid);
		newUser.setUserpw(userpw);
		newUser.setUsername(username);
		newUser.setUsergender(usergender);
		newUser.setZipcode(zipcode);
		newUser.setAddr(addr);
		newUser.setAddrdetail(addrdetail);
		newUser.setAddretc(addretc);
		newUser.setUserhobby(userhobbies);
		
		UserDAO udao = new UserDAO();
		ActionTo acto = new ActionTo();
		//시스템에 변화가 있으므로
		acto.setRedirect(true);
		if(udao.join(newUser)) {
			acto.setPath(req.getContextPath()+"/user/UserLogin.us?userid="+userid);
		}
		else {
			acto.setPath(req.getContextPath());
		}
		return acto;
	}
}











