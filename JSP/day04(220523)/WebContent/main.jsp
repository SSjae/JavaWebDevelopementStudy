<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인</title>
</head>
<body>
	<!-- 저장된 세션 반환 -->
	저장된 세션 반환 : <%=session.getAttribute("loginUser")%><br>
	<!-- 저장된 세션 삭제 -->
	<%session.removeAttribute("loginUser");%>
	세션 삭제 후 : <%=session.getAttribute("loginUser")%>
</body>
</html>