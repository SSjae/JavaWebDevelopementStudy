<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>el_test1</title>
</head>
<body>
	<!-- ${10+20} : 30 -->
	\${10+20} : ${10+20}<br>
	\${10>3 } : ${10>3}<br>
	<%
		// 자바 변수를 JSP에서 쓸려면 표현식밖에 없다.
		String data = "Hello";
		// pageContext : 현재 페이지
		// 현재 페이지에서 data 키를 사용할 수 있다.
		pageContext.setAttribute("data", "Hello");
		// request
		request.setAttribute("fruit", "apple");
		session.setAttribute("fruit", "banana");
	%>
	<%=data %>
	<!--
		data는 변수명을 의미하는 것이 아니라 setAttribute()를 할 때의 
		key값을 찾는다.
		EL문은 변수를 찾지 않는다.
		EL문은 setAttribute로 한 키값을 찾으러 간다.
		우리가 EL문을 변수로 사용할려면 pageContext.setAttribute("키","값")을 사용해야 한다.
		
		아래는 세팅되어 있는 attribute를 찾는 순서
		pageContext -> request -> session -> application(전체)
		키 값이 중복이 되면 위 순서대로 먼저 찾는다.
		우리가 원하는 곳에서 찾기 위해서는 ~~~Scope.키값 으로 하면 된다.
	-->
	<%-- <%=pageContext.getAttribute("data")%> == ${data} --%>
	\${data} : ${data}<br>
	\${requestScope.fruit} : ${requestScope.fruit}<br>
	\${sessionScope.fruit} : ${sessionScope.fruit}
</body>
</html>