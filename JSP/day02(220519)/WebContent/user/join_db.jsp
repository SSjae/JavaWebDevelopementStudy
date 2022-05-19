<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <!-- 처리만 담당하기 때문에 다 지워도 상관 없다. -->
<jsp:useBean id="udto" class="test.UserDTO"/>
<%--
<jsp:setProperty property="userid" name="udto"/>
<jsp:setProperty property="userpw" name="udto"/>
<jsp:setProperty property="username" name="udto"/>
<jsp:setProperty property="userphone" name="udto"/>
--%>
<!--
DTO 객체의 필드명과 파라미터의 name을 동일하게 맞춰주는 것이 사용하기에 편하다.
property="*" 로 하면 모든 것을 넘긴다.
-->
<jsp:setProperty property="*" name="udto"/>