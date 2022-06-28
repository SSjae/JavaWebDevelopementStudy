package com.delivery.app.user;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.delivery.action.Action;
import com.delivery.action.ActionTo;
import com.delivery.app.user.dao.UserDAO;
import com.delivery.app.user.dao.UserDTO;

public class UserModifyOkAction implements Action {

	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out = resp.getWriter();
		UserDTO org = (UserDTO)req.getSession().getAttribute("loginUser");
		UserDAO udao = new UserDAO();
		
		String username = req.getParameter("username");
		String usernickname = req.getParameter("usernickname");
		String userpw = req.getParameter("userpw");
		String useremail = req.getParameter("useremail");
		String userphone = req.getParameter("userphone");
		String zipcode = req.getParameter("zipcode");
		String addr = req.getParameter("addr");
		String addrdetail = req.getParameter("addrdetail");
		String addretc = req.getParameter("addretc");
		
		boolean checkEmpty = false;
		
		if (!username.isEmpty()) {
			udao.modifyUsername(org.getUserid(), username);
			checkEmpty = true;
		}
		if (!usernickname.isEmpty()) {
			udao.modifyUsernickname(org.getUserid(), usernickname);
			checkEmpty = true;
		}
		if (!userpw.isEmpty()) {
			udao.modifyUserpw(org.getUserid(), userpw);
			checkEmpty = true;
		}
		if (!useremail.isEmpty()) {
			udao.modifyUseremail(org.getUserid(), useremail);
			checkEmpty = true;
		}
		if (!userphone.isEmpty()) {
			udao.modifyUserphone(org.getUserid(), userphone);
			checkEmpty = true;
		}
		if (!zipcode.isEmpty()) {
			udao.modifyZipcode(org.getUserid(), zipcode);
			udao.modifyAddr(org.getUserid(), addr);
			udao.modifyAddrdetail(org.getUserid(), addrdetail);
			udao.modifyAddretc(org.getUserid(), addretc);
			checkEmpty = true;
		}
		if(!checkEmpty) {
			out.write("<script>");
			out.write("alert('수정할 항목을 한 개 이상 입력해주세요!');");
			out.write("location.href='" + req.getContextPath() + "/user/UserModify.us';");
			out.write("</script>");
			return null;
		}
		out.write("<script>");
		out.write("alert('회원 정보 수정이 완료되었습니다.');");
		if (userpw.isEmpty())
			out.write("location.href='" + req.getContextPath() + "/';");
		else {
			req.getSession().removeAttribute("loginUser");
			out.write("location.href='" + req.getContextPath() + "/user/UserLogin.us?userid="+org.getUserid()+"';");
		}
		out.write("</script>");
		if (userpw.isEmpty()) {
			String userid = org.getUserid();
			userpw = org.getUserpw();
			UserDTO loginUser = udao.login(userid, userpw);
			req.getSession().setAttribute("loginUser", loginUser);
		}
		return null;
	}
}
