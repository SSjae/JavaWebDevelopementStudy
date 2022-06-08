package com.koreait.app.user;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.action.ActionTo;

// Servlet의 성격을 띄고 있어야 하므로 HttpServlet을 상속 해주면 됨
public class UserFrontController extends HttpServlet{
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		// GET, POST 방식 어떤 방식으로 와도 doGet으로 가게 해서 doGet 메소드에 길을 나누는 코드 작성
		doGet(req, resp);
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 길 나누는 코드
		String requestURI = req.getRequestURI();	// /board_mvc2/UserJoin.us
		String contextPath = req.getContextPath();	// /board_mvc2		위 아래 둘이 빼서 남은 것으로 길을 판별
		String command = requestURI.substring(contextPath.length());	// UserJoin.us
		
		ActionTo acto = null;
		switch (command) {
		case "/user/UserJoin.us" :
			acto = new ActionTo();
			acto.setRedirect(false);
			acto.setPath("/app/user/joinview.jsp");
			break;
		case "/user/UserLogin.us" :
			acto = new ActionTo();
			acto.setRedirect(false);
			acto.setPath("/app/user/loginview.jsp");
			break;
		case "/user/UserJoinOk.us" :
			try {
				// 처리를 위한 것은 따로 클래스 만들어서 따로 관리
				// 처리를 클래스에서 하기 위해 req, resp를 매개변수로 같이 보냄
				acto = new UserJoinOkAction().execute(req, resp);				
			} catch (Exception e) {
				System.out.println("/UserJoinOk : " + e);
			}
			break;
		case "/user/CheckIdOk.us" :
			try {
				new CheckIdOkAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("/CheckIdOk : " + e);
			}
			break;
		case "/user/UserLoginOk.us" :
			try {
				new UserLoginOkAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("/UserLoginOk : " + e);
			}
			break;
		case "/user/UserLogoutOk.us" :
			try {
				acto = new ActionTo();
				acto.setRedirect(false);
				acto.setPath("/");
				req.getSession().removeAttribute("loginUser");
			} catch (Exception e) {
				System.out.println("/UserLogoutOk : " + e);
			}
		}
		
		// 페이지 이동을 하는 것이니깐 case문에는 하면 case마다 다 써줘야 한다.
		// 그래서 스위치 문에서 어디로 가야할지 정해놓고
		// 스위치 문 끝나고 이동을 시킨다
		
		// 일괄 처리
		// 어디로 이동할지 / 어떤 방식일지(forward, redirect)
		// 그냥 페이지 이동이면 상관이 없지만 처리하는 페이지로 가서
		// 그 페이지에서 어디로 어떤 방식으로 보낼지를 반환 받을 때
		// 두개의 값을 받아는 방법이 없으므로 객체를 만들어 객체로 받음
		if(acto != null) {
			if(acto.isRedirect()) {
				resp.sendRedirect(acto.getPath());
			} else {
				// RequestDispatcher은 페이지를 이동시켜주는 것
				RequestDispatcher disp = req.getRequestDispatcher(acto.getPath());
				disp.forward(req, resp);
			}
		}
	}
}