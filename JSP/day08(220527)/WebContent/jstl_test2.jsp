<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jstl_test2</title>
</head>
<body>
	<h2>JSTL 제어문(조건문)</h2>
	<c:set var="num" value="70"/>
	<p>c:if</p>
	<c:if test="${num>50}">
		이 수는 50보다 큽니다!<br>
	</c:if>
	<c:if test="${num>30}">
		이 수는 30보다 큽니다!<br>
	</c:if>
	
	<!-- when은 if else if문 -->
	<!-- otherwise는 else -->
	<p>c:choose(if ~ else if ~ else 문도 choose로 표현)</p>
	<c:choose>
		<c:when test="${num>50}">
			이 수는 50보다 큽니다!<br>
		</c:when>
		<c:when test="${num>30}">
			이 수는 30보다 큽니다!<br>
		</c:when>
		<c:when test="${num>10}">
			이 수는 10보다 큽니다!<br>
		</c:when>
		<c:otherwise>
			이 수는 그 외의 숫자입니다!<br>
		</c:otherwise>
	</c:choose>
</body>
</html>