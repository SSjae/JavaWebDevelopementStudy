<%@page import="com.koreait.dao.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>

<jsp:useBean id="newUser" class="com.koreait.dto.UserDTO"/>
<jsp:setProperty property="*" name="newUser"/>

<%
	//String[] hobbies = newUser.getUserhobby();

	//for(int i=0; i<hobbies.length; i++) {
	//	System.out.println(hobbies[i]);
	//}
	UserDAO udao = new UserDAO();
	
	if(udao.join(newUser)) {
		session.setAttribute("joinUser", newUser);
%>
		<script>
			alert("회원가입을 축하합니다.")
			location.href = "loginview.jsp"
			// 회원가입한 아이디는 보여도 상관없기 때문에 그냥 주소창에 데이터로 보낼 수 있다.
			// location.href = "loginview.jsp?userid="+newUser.getUserid();
		</script>		
<%	
	} else {
%>
		<script>
			alert("잠시 후에 다시 시도해주세요.")
			location.href = "joinview.jsp"
		</script>		
<%	
	}
%>