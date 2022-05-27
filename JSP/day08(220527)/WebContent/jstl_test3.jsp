<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jstl_test3</title>
</head>
<body>
	<h2>JSTL 제어문(조건문) 예제</h2>
	<c:choose>
		<c:when test="${empty param.userid }">
			<form>
				아이디<input type="text" name="userid"><br>
				비밀번호<input type="password" name="userpw"><br>
				<input type="submit">
			</form>
		</c:when>
		<c:otherwise>
			<c:choose>
				<c:when test="${param.userid == 'apple' }">
					<b>김사과님 어서오세요~</b>
				</c:when>
				<c:when test="${param.userid == 'admin' }">
					<span style="color:red;">관리자 페이지</span>
				</c:when>
				<c:otherwise>
					<script>alert("비회원 입니다. 돌아가세요!"); history.go(-1);</script>
				</c:otherwise>
			</c:choose>
		</c:otherwise>
	</c:choose>
</body>
</html>