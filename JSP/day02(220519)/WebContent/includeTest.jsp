<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>includeTest</title>
</head>
<body>
	<%@ include file="./header.jsp" %>
	<h4>-----------현재 페이지 영역------------</h4>
	<p>
		반갑습니다 여러분 페라리 언제 사올거에요?<br>
		기다리다 지쳤어요 땡벌땡벌
	</p>
	<h4>------------------------------------------</h4>
	<%@ include file="./footer.jsp" %>
</body>
</html>