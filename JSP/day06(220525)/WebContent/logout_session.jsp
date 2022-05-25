<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if(session.getAttribute("loginUser") != null) {
		// 세션에 있는 거 다 날림
		session.invalidate();
		// request.getContextPath() : 루트 경로
		// request.getContextPath() + "/loginview.jsp" : 로그인 화면으로 감
		response.sendRedirect("index.jsp");
	}
%>