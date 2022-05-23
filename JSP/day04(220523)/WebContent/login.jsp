<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
	<%
		String check = request.getHeader("Cookie");
		String joinid = null;
	
		if(check != null) {
			Cookie[] cookies = request.getCookies();
			
			for(Cookie cookie : cookies) {
				if(cookie.getName().equals("joinid")) {
					joinid = cookie.getValue();
					
					// 쿠키를 다 사용했으니 사용자 컴퓨터에 있는 쿠키는 지워주기
					cookie.setMaxAge(0);
					response.addCookie(cookie);
				}
			}
		}
		
	%>
	<hr>
		<form name="loginForm" action="login_db.jsp" method="post">
			아이디 <input type="text" name="userid" placeholder="아이디를 입력하세요" autofocus value="<%=joinid==null?"":joinid%>">
			비밀번호 <input type="password" name="userpw" placeholder="비밀번호를 입력하세요">
			<input type="submit" value="로그인">
		</form>
	<hr>
</body>
<%
	if(joinid != null) {
%>
		<script>document.loginForm.userpw.focus();</script>
<%		
	}
%>
</html>