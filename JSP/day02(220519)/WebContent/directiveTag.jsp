<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="./myErrorPage.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>directiveTag</title>
</head>
<body>
	<h2>디렉티브 태그 연습</h2>
	<!-- import는 늘 하던거처럼 하면 되고 여러개가 될 수도 있다. -->
	Today is : <%=new Date() %>
	<%
		// NullPointerException 예외 발생
		// 다른 페이지를 보여줌으로 예외 처리를 한다.
		// errorPage="경로";를 써줌으로 에러가 발생하면 이 페이지로 가게 해준다.
		String str = null;
		str.length();
	%>
</body>
</html>