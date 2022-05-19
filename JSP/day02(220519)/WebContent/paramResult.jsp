<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>paramResult</title>
</head>
<body>
	<h2>이동된 페이지</h2>
	<p>
		아이디 : <%=request.getParameter("userid") %>
	</p>
	<p>
		비밀번호 : <%=request.getParameter("userpw") %>
	</p>
	<p>
		이름 : <%=request.getParameter("username") %>
	</p>
</body>
</html>