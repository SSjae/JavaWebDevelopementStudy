<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>joinview</title>
</head>
<body>
	<!--
		1. 아이디, 비밀번호, 이름, 핸드폰번호 입력받아서 "가입하기" 버튼 클릭
		join_db.jsp 로 제출
		2. join_db.jsp는 제출된 데이터들을 하나의 객체로 포장
	-->
	<form method="post" action="join_db.jsp">
	<p>
		<label>아이디 <input type="text" name="userid"></label>
	</p>
	<p>
		<label>비밀번호 <input type="text" name="userpw"></label>
	</p>
	<p>
		<label>이름 <input type="text" name="username"></label>
	</p>
	<p>
		<label>핸드폰번호 <input type="text" name="userphone"></label>
	</p>
	<input type="submit">
	</form>
</body>
</html>