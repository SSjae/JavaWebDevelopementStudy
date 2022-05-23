<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>update_check</title>
</head>
<body>
	<%
		// 사용자가 보내는 요청에 쿠키 내용이 있는지 없는지 체크
		// 쿠키가 하나도 없으면 꺼내는 과정에서 에러가 나기 때문에 체크를 해줘야 한다.
		String check = request.getHeader("Cookie");
		
		if(check != null) {			
			// 사용자가 요청할 때마다 쿠키들도 같이 보내기 때문에 request에서 찾아야 됨
			Cookie[] cookies = request.getCookies();
		
			// name과 value를 꺼내올 수 있다.
			for(Cookie cookie : cookies) {
				out.print(cookie.getName() + " : ");
				out.print(cookie.getValue() + "<br>");
				
				if(cookie.getName().equals("crash_strawberry")) {
					// 초단위로 지정하고 음수를 입력하면 브라우저 종료시 쿠키 삭제(default)
					// 생명주기를 0초로 해서 즉시삭제 해준다.
					cookie.setMaxAge(0);
					// 생명주기가 다 된 쿠키를 다시 사용자 컴에 저장해 주어야 진짜 삭제가 된다.
					response.addCookie(cookie);
					// 1년동안 쿠키가 살아있음
					// cookie.setMaxAge(60*60*24*30*12);
				}
			}
		}
	%>
	<a href="getCookie.jsp">쿠키 삭제 확인하기~</a>
</body>
</html>