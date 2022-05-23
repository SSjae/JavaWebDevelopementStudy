<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	Class.forName("com.mysql.cj.jdbc.Driver");
	
	String url = "jdbc:mysql://localhost:3306/jsp";
	String user = "root";
	String password = "1234";
	
	Connection conn = DriverManager.getConnection(url, user, password);
	
	String sql = "select * from test_user where userid=? and userpw=?";
	PreparedStatement ps = conn.prepareStatement(sql);
	
	String userid = request.getParameter("userid");
	ps.setString(1, userid);
	ps.setString(2, request.getParameter("userpw"));
	
	ResultSet rs = ps.executeQuery();
	
	if(rs.next()) {
		session.setAttribute("loginUser", userid);
		response.sendRedirect("main.jsp");
	}
	else {
		out.print("<script>");
		out.print("alert('로그인을 실패했습니다.');");
		out.print("location.href = 'login.jsp';");
		out.print("</script>");
	}
%>