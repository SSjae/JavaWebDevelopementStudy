<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>scriptTag_test1</title>
</head>
<body>
	<h2>script tag 1</h2>
	<%!
		// 내부는 전부 자바의 문법
		
		// jsp는 서블릿 클래스로 변환되기 때문에 메소드 선언도 되고 변수도 전역변수로 된다.
		// 이 부분은 서블릿 클래스의 전역 부분이다.
		// count는 전역변수
		int count = 3;
	
		String sayHello(String data) {
			return "Hello" + data;
		}
		// 이곳은 서블릿 클래스의 영역이므로 소스코드를 작성할 수 없다.
		// System.out.println();
	%>
	<%
		// 1. Java Sever Pages<br>
		// 2. Java Sever Pages<br>
		// 3. Java Sever Pages<br>
		for(int i=1; i<=count; i++) {
			// html 화면에 쓰고 싶을 때
			out.print(i + ". Java Server Pages<br>");	
		}
	%>
	
	<!-- HTML 주석은 컴파일이 모두 되고 나서 페이지에서 감춰지는 행위이다. -->
	<%-- JSP 주석은 안에 작성된 모든 코드가 무시되므로 JSP 주석을 권장한다. --%>
	<%-- <%
		Integer.parseInt("hello");
	%> --%>
	
	<%--
		표현문은 서블릿의 out.print() 메소드의 매개변수로 전달되기 때문에 세미클론을 사용하면 안된다.
		<%=sayHello("JSP"); %> 세미클론을 쓰면 오류
	--%>
	sayHello("JSP")의 결과 : <%=sayHello("JSP")%>
				<%-- <%out.print(sayHello("JSP"));%> --%>
</body>
</html>