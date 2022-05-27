<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jstl_test4</title>
</head>
<body>
	<h2>JSTL 제어문(반복문)</h2>
	<!-- 일반 for문 -->
	<!-- i를 1부터 10까지 1씩 올리면서 진행 -->
	<!-- pTag1 ~ pTag10 -->
	<c:forEach var="i" begin="1" end="10" step="1">
		<p id="pTag${i}">${i}</p>
	</c:forEach>
	<hr>
	<!-- 배열 세팅 -->
	<!-- 배열.length 사용 / fn:length은 EL문 안에서만 사용 가능 -->
	<c:set var="arData" value="<%=new int[]{10,20,30,40,50}%>"></c:set>
	<%-- <c:forEach var="i" begin="0" end="${arData.length - 1}" step="1"> 불가능 --%>
	<c:forEach var="i" begin="0" end="${fn:length(arData) - 1}" step="1">
		${arData[i]}
	</c:forEach>
	<hr>
	<!-- 빠른 for문 -->
	<c:forEach var="data" items="${arData}">
		${data}
	</c:forEach>
	<hr>
	<c:forEach var="i" begin="0" end="${fn:length(arData)-1}" step="1">
		<c:set var="data" value="${arData[i]}"/>
		${i}번방 : ${data}<br>
	</c:forEach>
	<hr>
	<c:set var="i" value="0"/>
	<c:forEach var="data" items="${arData}">
		${i}번방 : ${data}<br>
		<c:set var="i" value="${i+1}"></c:set>
	</c:forEach>
	<hr>
	<%
		HashMap<String, Integer> map = new HashMap();
		map.put("하나",1);
		map.put("둘",2);
		map.put("셋",3);
		pageContext.setAttribute("map", map);
	%>
	<c:forEach var="entry" items="${map}">
		${entry.key} : ${entry.value}<br>
	</c:forEach>
</body>
</html>