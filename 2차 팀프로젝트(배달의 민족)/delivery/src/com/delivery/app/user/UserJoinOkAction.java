package com.delivery.app.user;

import com.delivery.action.Action;
import com.delivery.action.ActionTo;
import com.delivery.app.user.dao.UserDAO;
import com.delivery.app.user.dao.UserDTO;
import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UserJoinOkAction implements Action {
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=utf-8");
		
		String userid = req.getParameter("userid");
		String userpw = req.getParameter("userpw");
		String username = req.getParameter("username");
		String usernickname = req.getParameter("usernickname");
		String useremail = req.getParameter("useremail");
		String userphone = req.getParameter("userphone");
		String zipcode = req.getParameter("zipcode");
		String addr = req.getParameter("addr");
		String addrdetail = req.getParameter("addrdetail");
		String addretc = req.getParameter("addretc");
		
		UserDTO udto = new UserDTO();
		
		udto.setUserid(userid);
		udto.setUserpw(userpw);
		udto.setUsername(username);
		udto.setUsernickname(usernickname);
		udto.setUseremail(useremail);
		udto.setUserphone(userphone);
		udto.setZipcode(zipcode);
		udto.setAddr(addr);
		udto.setAddrdetail(addrdetail);
		udto.setAddretc(addretc);
		
		PrintWriter out = resp.getWriter();
		UserDAO udao = new UserDAO();
		if (udao.join(udto)) {
			out.write("<script>");
			out.write("alert('회원가입이 완료되었습니다. 로그인 페이지로 이동합니다.');");
			out.write("location.href='" + req.getContextPath() + "/user/UserLogin.us?userid=" + userid + "';");
			out.write("</script>");
		} else {
			out.write("<script>");
			out.write("alert('회원가입에 실패하였습니다. 다시 시도해주세요');");
			out.write("location.href='" + req.getContextPath() + "/user/UserJoin.us';");
			out.write("</script>");
		} 
		return null;
	}
}