<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>최종 예제 게시판</title>
</head>
<body>
	<h2>최종 예제 계시판</h2>
	<!-- 앞에 어떤 대상인지 붙여서 사용(user) -->
	<!-- 절대 경로로 루트부터 차례대로 써야 한다. -->
	<c:set var="cp" value="${pageContext.request.contextPath}"/>
	<a href="${cp }/user/UserJoin.us">회원가입</a>
	<a href="${cp }/user/UserLogin.us">로그인</a>
</body>
</html>