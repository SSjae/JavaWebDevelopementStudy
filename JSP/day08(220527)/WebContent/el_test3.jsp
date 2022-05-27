<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>el_test3</title>
</head>
<body>
	<!-- Attribute로 하면 그냥 키 값 적으면 된다 -->
	<!-- parameter로 날아오면 EL문에서 param.name으로 받으면 된다. -->
	아이디 : ${param.id}<br>
	비밀번호 : ${param.pw}<br>
	<!-- 여러 개의 파라미터가 날아오면 paramValues.name하면 된다. -->
	취미 : ${paramValues.hobby[0]},${paramValues.hobby[1]}<br>
	<%-- 취미 : ${paramValues["hobby"][0],${paramValues["hobby"][1]}<br> --%>
	이름 : ${param.name != null? param.name : "이름없음" }<br>
	<!-- cookie.friday 까지 객체 -->
	쿠키값 : ${cookie.friday.value }
	<!--
		EL문에서는 필드를 불러오는게 아니라 getter를 불러서 쓰는 것이다.
		그래서 우리가 만든 객체에 getter setter가 있어야 사용 가능하다.
	-->
</body>
</html>