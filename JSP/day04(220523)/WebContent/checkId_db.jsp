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
	
	String sql = "select * from test_user where userid=?";
	PreparedStatement ps = conn.prepareStatement(sql);
	
	// ?로 보낸 데이터를 받음
	String userid = request.getParameter("userid");
	ps.setString(1, userid);
	
	ResultSet rs = ps.executeQuery();
	
	// 응답을 HTML로 
	// 아이디 중복
	if(rs.next()) {
		out.print("X");
	}
	else {	
		out.print("O");
	}
%>