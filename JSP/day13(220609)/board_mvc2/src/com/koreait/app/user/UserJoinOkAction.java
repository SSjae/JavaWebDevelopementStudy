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
		req.setCharacterEncoding("UTF-8");
		
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
		// Redirect는 요청 정보를 초기화하면서 다른 페이지로 이동한다.
		// 그렇기에 시스템의 변화가 있는 거라면 무조건 Redirect로 해야한다.(delete, update, insert)
		
		// 시스템 변화가 있으므로
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