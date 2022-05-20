<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>setCookie</title>
</head>
<body>
	<%
		// 쿠기에는 name과 value로 이루어져 있다.
		Cookie cookie1 = new Cookie("cereal","good");
		Cookie cookie2 = new Cookie("crash_strawberry","werrrrrrrrr");
		
		// 클라이언트 컴에 저장해놓기 때문에 response로 저장해줘야 함
		response.addCookie(cookie1);
		response.addCookie(cookie2);
	%>
</body>
</html>