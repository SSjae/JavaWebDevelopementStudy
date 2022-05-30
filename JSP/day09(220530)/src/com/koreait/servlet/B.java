package com.koreait.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class B extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int num1 = Integer.parseInt(request.getParameter("num1"));
		int num2 = Integer.parseInt(request.getParameter("num2"));
		
		////DB처리////
		
		////////////
		int result = num1 + num2;
		// 간단한 거는 그냥 out을 써서 여기서 출력해도 되지만
		// Cookie, request, Session(상태정보저장), Parameter, Application
		// 목적에 맞게 데이터를 전송해서 출력하면 됨
		// 간단한 데이터는 request로 보냄
		request.setAttribute("result", result);
		// response.sendRedirect("c.jsp");
		// sendRedirect로 보내면 request로 설정한 거 다 날라감
		
		// 이 방법이 forward 방법인데 데이터를 유지하면서 보냄
		request.getRequestDispatcher("c.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
