<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myErrorPage</title>
</head>
<body>
	<h2 style="background :black; color:yellow; font-size:2em">
		에러가 발생했습니다.
	</h2>
	<p>
		아주 심각한 오류가 발생하였습니다.<br>
		<a href="#">백신 프로그램 설치하기</a>
	</p>
	<%
		/* 
			exception 객체 : 예외를 담는 jsp 내장 객체
			isErrorPage="true" 속성을 설정해 주어야 사용 가능하다.
		*/
		// 어떤 예외인지 알려줌으로써 처리할 수 있게 해준다.
		out.println(exception);
	%>
</body>
</html>