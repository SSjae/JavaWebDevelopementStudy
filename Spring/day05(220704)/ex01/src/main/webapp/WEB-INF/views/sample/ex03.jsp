<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex03</title>
</head>
<body>
	<h1>ex03</h1>
	<p>
		<c:forEach items="${datas}" var="data">
			${data}<br>
		</c:forEach>
	</p>
</body>
</html>