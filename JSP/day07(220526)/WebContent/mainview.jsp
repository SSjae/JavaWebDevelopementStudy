<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mainview</title>
</head>
<body>
	<%
		// 웹은 진입 경로가 많기 때문에 무조건적으로 검사를 해줘야 한다.
		String loginUser = null;
		loginUser = (String) session.getAttribute("loginUser");
		if(loginUser == null) {
	%>
			<script>
				alert("로그인 후 이용하세요!");
				location.href = "loginview.jsp";
			</script>
	<%	
		}
		else {
	%>
	<table>
		<tr>
			<td><%=loginUser%>님 방문을 환영합니다~!</td>
			<td><a href="logout_session.jsp">로그아웃</a></td>
		</tr>
	</table>
	<%
		}
	%>
</body>
</html>