<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jstl_test1</title>
</head>
<body>
	<h2>JSTL 변수</h2>
	<%--<%
		pageContext.setAttribute("userid", "apple");
	%> --%>
	<!-- c:set은 세팅용 c:out은 출력용인데 EL문이 있으므로 출력용은 거의 안씀 -->
	<c:set var="userid" value="apple"/>
	회원 아이디 : <c:out value="${userid}"/><br>
	회원 아이디 : ${userid}<br>
	<hr>
	<c:set var="userid" scope="session">banana</c:set>
	세션 아이디 : ${sessionScope.userid}
	<!-- value 속성 대신 사이에 값을 적으면 그 값이 value가 된다. -->
</body>
</html>