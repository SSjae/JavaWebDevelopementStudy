<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<style>
	body{
		background-color:rgb(245,246,247);
	}
	#wrap{
		width:600px;
		margin:0 auto;
	}
	#wrap > tr, #wrap > td{
		padding:10px;
	}
	#wrap > tr{
		width:200px;
	}
	#wrap > td{
		width:350px;
	}
	input[type=text], input[type=password]{
		padding:10px;
		width:200px;
		margin-left:20px;
		border:1px solid #ccc;
		outline:none;
	}
	input[type=submit]{
		margin-top:30px;
		padding:10px 20px;
		width:100px;
		border:none;
		background-color:rgb(0,200,80);
		border-radius:5px;
		color:#fff;
		font-weight:bold;
		font-size:18px;
	}
</style>
<body>
	<!--
		${cp}/user/UserLoginOk.us -> 검색된 결과로 UserDTO 객체 만들어서 세션에 세팅
		req.getSession() : 세션 객체
	-->
	
	<c:set var="cp" value="${pageContext.request.contextPath}"></c:set>
	<div id="wrap">
		<form name="loginForm" action="${cp }/user/UserLoginOk.us" method="post" onsubmit="return sendit();">
			<table>
				<tr>
					<th>아이디</th>
					<td>
						<input type="text" name="userid" placeholder="아이디를 입력하세요"
						value="">
					</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td>
						<input type="password" name="userpw" placeholder="비밀번호를 입력하세요">
					</td>
				</tr>
				<tr>
					<th colspan="2"><input type="submit" value="로그인"></th>
				</tr>
			</table>
		</form>
	</div>
</body>
<script src="${cp }/app/user/user.js"></script>
</html>