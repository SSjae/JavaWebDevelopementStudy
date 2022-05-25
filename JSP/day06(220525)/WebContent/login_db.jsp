<%@page import="com.koreait.dao.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	UserDAO udao = new UserDAO();	
	
	String userid = request.getParameter("userid");
	String userpw = request.getParameter("userpw");

	if(udao.login(userid, userpw)) {
		session.setAttribute("loginUser", userid);
		response.sendRedirect("mainview.jsp");
	} else {
		/*
		response.sendRedirect 가 항상 우선이기에 알림창이 안뜸
		같이 못씀
		out.print("<script>");
		out.print("alert('로그인 실패!')");
		out.print("</script>");		
		*/
		// 실패 정보를 같이 보냄
		response.sendRedirect("loginview.jsp?l=f");
	}
%>