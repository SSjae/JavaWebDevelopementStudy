<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오류 페이지</title>
</head>
<body>
	<h2 style="background: black; color:yellow">치명적인 오류 발생</h2>
	<a href="#">백신 프로그램 다운 받기</a>
	<ul style="color:red">
		<c:forEach var="stack" items="${exception.stackTrace}">
			<li>${stack}</li>
		</c:forEach>
	</ul>
	계좌 입금시 원격으로 오류를 해결해 드립니다.<br>
	국민은행 111111-11-111111
</body>
</html>