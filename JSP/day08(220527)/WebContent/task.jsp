<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>task</title>
</head>
<body>
	<c:choose>
		<c:when test="${empty param.dan}">
			<hr>
			<form>
				단 <input type="text" name="dan"><br>
				<input type="submit" value="제출">
			</form>
		</c:when>
		<c:otherwise>
			<hr>
			<c:choose>
				 <c:when test="${param.dan>0 and param.dan<100}">
				 	<c:forEach var="i" begin="1" end="9" step="1">
				 		${param.dan} X ${i} = ${param.dan * i}<br>
				 	</c:forEach>
				 </c:when>
				 <c:when test="${param.dan<1 or param.dan>100}">
				 	1 이상 100 이하의 숫자를 입력하세요!!
				 </c:when>
				 <c:otherwise>
				 	<script>
				 		alert("숫자를 입력하세요");
				 		location.href="task.jsp";
				 	</script>
				 </c:otherwise>
			</c:choose>
			<hr>
			<button onclick="location.href='task.jsp'">홈으로 돌아가기</button>
		</c:otherwise>
	</c:choose>
</body>
</html>