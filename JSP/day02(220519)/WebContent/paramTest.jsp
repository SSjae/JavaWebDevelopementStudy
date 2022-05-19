<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 요청하는 값이 한국어라면 UTF-8로 인코딩을 맞춰줘야 한다. -->
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>paramTrst</title>
</head>
<body>
	<h2>아이 예뻐</h2>
	<!-- 페이지로 이동할 때 jsp:param을 이용해 데이터도 보낼 수 있다. -->
	<jsp:forward page="./paramResult.jsp">
		<jsp:param value="apple" name="userid"/>
		<jsp:param value="abcd1234" name="userpw"/>
		<jsp:param value="김사과" name="username"/>
	</jsp:forward>
</body>
</html>