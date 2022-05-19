<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>beanTest</title>
</head>
<body>
	<!-- action : 데이터를 보낼 목적지, method : 전송방식 -->
	<form method="get" action="beanResult.jsp">
		정수 데이터 <input name="initdata"><br>
		실수 데이터 <input name="doubledata"><br>
		문자열 데이터 <input name="strdata"><br>
		<input type="submit">
	</form>
</body>
</html>