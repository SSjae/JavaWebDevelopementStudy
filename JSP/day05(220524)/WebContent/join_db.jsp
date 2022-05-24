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
%>
		<script>
			alert("회원가입을 축하합니다.")
			location.href = "loginview.jsp"
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