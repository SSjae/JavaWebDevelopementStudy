<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>getCookie</title>
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
					// 쿠기 값 변경
					// 이것만 쓰면 실제 사용자 컴의 쿠키가 바뀌는 것이 아니라 서버에서 가져온 cookie 객체를 바꾼것이다.
					cookie.setValue("dont_eat");
					// 사용자 컴에 것을 수정하기 위해서는 다시 쿠키 객체를 같은 키의 이름으로 저장해주면 된다.
					response.addCookie(cookie);
				}
			}
		}
	%>
	<a href="update_check.jsp">수정된 쿠키 확인하기~</a>
</body>
</html>