<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- 웹파일에서만 DB를 사용하기 위해서는 jar 파일을 WEB-INF 안에 있는 lib에 넣어주면 된다. -->
    <!--
    	DB 연결을 이번 한번이 아니라 엄청 많이 있기 때문에 따로 빼서 클래스나 메소드로 만들 것이다.
    	따로 빼서 만들어도 DB 수행이 잘 됬는지 아닌지에 대한 반환값을 JSP에서 받아야 하기 때문에
    	JSP와 자바코드가 아예 분리되지 않는다. 그래서 MVC 1 모델이라고 하는 것이다.
    -->
<%
	request.setCharacterEncoding("UTF-8");
	Class.forName("com.mysql.cj.jdbc.Driver");
	
	String url = "jdbc:mysql://localhost:3306/jsp";
	String user = "root";
	String password = "1234";
	
	Connection conn = DriverManager.getConnection(url, user, password);
	
	String sql = "insert into test_user values (?, ? ,?)";
	PreparedStatement ps = conn.prepareStatement(sql);
	String userid = request.getParameter("userid");
	
	ps.setString(1, userid);
	ps.setString(2, request.getParameter("userpw"));
	ps.setString(3, request.getParameter("username"));
	
	int result = ps.executeUpdate();
	
	if(result == 1) {
		// 성공
		// 자바 코드로 페이지 이동
		response.addCookie(new Cookie("joinid", userid));
		response.sendRedirect("login.jsp");
	}
	else {
		// 실패
		response.sendRedirect("join_fail.jsp");
	}
%>