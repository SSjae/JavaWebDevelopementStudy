<%@page import="test.TestDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>beanResult</title>
</head>
<body>
	<%-- <%
		TestDTO dto = new TestDTO();
		int num1 = Integer.parseInt(request.getParameter("num1"));
		dto.setIntdata(num1)
	%> --%>
	<!-- id="객체명" class="사용할 클래스" -->
	<jsp:useBean id="dto" class="test.TestDTO"/>
	<!-- property="클래스 안에 있는 필드" name="객체명" param="요청에서 받아오는 값"-->
	<!-- initdata에 할당 -->
	<!--
		실제 파라미터의 name과 dto의 필드명이 동일하다면 param, value 속성을 생략 가능
		생략시 알아서 같은 name을 가지고 있는 param의 값으로 세팅
	 -->
	<jsp:setProperty property="intdata" name="dto"/>
	<!-- 할당된 값 그 자리에 출력 -->
	<jsp:getProperty property="intdata" name="dto"/>
</body>
</html>