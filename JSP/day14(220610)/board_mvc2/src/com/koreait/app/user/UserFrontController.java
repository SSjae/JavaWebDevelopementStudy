package com.koreait.app.user;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.action.ActionTo;

public class UserFrontController extends HttpServlet{
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		doGet(req, resp);
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//길나누는 코드
		String requestURI = req.getRequestURI();	//	/board_mvc2/UserJoin.us
		String contextPath = req.getContextPath();	//	/board_mvc2
		String command = requestURI.substring(contextPath.length());
		ActionTo acto = null;
		switch(command) {
		case "/user/UserJoin.us":
			acto = new ActionTo();
			acto.setRedirect(false);
			acto.setPath("/app/user/joinview.jsp");
			break;
		case "/user/UserLogin.us":
			acto = new ActionTo();
			acto.setRedirect(false);
			acto.setPath("/app/user/loginview.jsp");
			break;
		case "/user/UserJoinOk.us":
			try {
				acto = new UserJoinOkAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("/UserJoinOk : "+e);
			}
			break;
		case "/user/CheckIdOk.us":
			try {
				new CheckIdOkAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("/CheckIdOk : "+e);
			}
			break;
		case "/user/UserLoginOk.us":
			try {
				new UserLoginOkAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("/UserLoginOk : "+e);
			}
			break;
		case "/user/UserLogoutOk.us":
			try {
				acto = new ActionTo();
				acto.setRedirect(false);
				acto.setPath("/");
				req.getSession().removeAttribute("loginUser");
			} catch (Exception e) {
				System.out.println("/UserLogoutOk : "+e);
			}
		}
		
		//일괄 처리
		//어디로 이동할지 / 어떤 방식일지(forward, redirect)
		if(acto != null) {
			if(acto.isRedirect()) {
				resp.sendRedirect(acto.getPath());
			}
			else {
				RequestDispatcher disp = req.getRequestDispatcher(acto.getPath());
				disp.forward(req, resp);
			}
		}
	}
}












