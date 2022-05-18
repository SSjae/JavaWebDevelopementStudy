<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>첫번째 JSP 파일</title>
</head>
<body>
	<!-- MyServlet에 매핑되어 있는 서블릿으로 감 -->
	<form method="get" action="MyServlet">
		첫번째 정수 <input name="num1"><br>
		두번째 정수 <input name="num2"><br>
		<input type="submit" value="연산하기">
	</form>
</body>
</html>