<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
		<title>아이디 비밀번호 찾기</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<meta name="description" content="" />
		<meta name="keywords" content="" />
		<link rel="stylesheet" href="${cp}/assets/css/main.css" />
		<link rel="stylesheet" href="${cp}/assets/css/main2.css" />
		<link rel="stylesheet" href="${cp}/assets/css/font.css" />
	</head>
	<body class="is-preload">

		<!-- Header -->
			<header id="header" class="alt">
				<a class="logo" href="${cp}/"><img src="${cp}/images/logo2.png"></a>
				<c:choose>
					<c:when test="${loginUser == null }">
						<ul class="actions" style="margin-right: 80px; margin-top:34px; font-family:'BMHANNAPro';">
							<li><a href="https://play.google.com/store/search?q=%EB%B0%B0%EB%8B%AC%EC%9D%98%EB%AF%BC%EC%A1%B1&c=apps&hl=ko&gl=KR" class="button icon solid fa-download">앱 다운로드</a></li>
						</ul>
					</c:when>
					<c:otherwise>
						<script>
							alert("로그아웃 후 사용해주세요");
						</script>
					</c:otherwise>
				</c:choose>
			</header>
			
			<form method="post" action="${cp}/user/FindIdOk.us" name="findIdForm" id="findIdForm" onsubmit="return findId();">
				<h3>아이디 찾기</h3>
				<div class="row gtr-uniform">
					<div class="col-6 col-12-xsmall" id="longinput">
						이름
						<input type="text" name="username" id="username" value="" placeholder="이름" autofocus/>
					</div>
					<div class="col-6 col-12-xsmall" id="midinput">
						휴대폰
						<div style="display: inline-flex;">
							<input type="text" name="userphone" id="userphone" value="" placeholder="휴대폰 번호" />
							<input type="button" id="authbuttonid" value="인증하기" onclick="authid();" style="margin-left: 25px; font-family:'BMHANNAPro';"/>
						</div>
						
						<div id="authid" style="display: none; margin-top: 17px;">
							<input type="text" name="authnum" id="authnum1" value="" placeholder="인증번호" style="width: 218px;"/>
							<input type="button" id="abutton1" onclick="idauth()" value="인증" style="margin-left: 25px; font-family:'BMHANNAPro';"/>
							<input type="button" id="tbutton1" onclick="addtime('id');" value="시간 연장" style="margin-left: 25px; font-family:'BMHANNAPro';"/>
							<input type="text" id="time1" class="timeid" readonly style="width: 85px; font-family: 'BMHANNAPro'; margin-left: 41px; background: white; border: white; font-size:20px;"/>
						</div>
					</div>
					
					<!-- Break -->
					<div class="col-12" style="max-width: fit-content; margin: 0 auto;">
						<ul class="actions" style="">
							<li style=""><input type="submit" value="아이디 찾기" class="primary"/></li>
						</ul>
					</div>
				</div>
			</form>
			
			<hr style="width: 799.99px; margin: 5rem auto 0 auto;">
			
			<form method="post" action="${cp}/user/FindPwOk.us" name="findPwForm" id="findPwForm" onsubmit="return findPw();">
				<h3>비밀번호 찾기</h3>
				<div class="row gtr-uniform">
					<div class="col-6 col-12-xsmall" id="longinput">
						아이디
						<input type="text" name="userid" id="userid" value="" placeholder="아이디" />
					</div>
					<div class="col-6 col-12-xsmall" id="longinput">
						이름
						<input type="text" name="username" id="username" value="" placeholder="이름"/>
					</div>
					<div class="col-6 col-12-xsmall" id="midinput">
						휴대폰
						<div style="display: inline-flex;">
							<input type="text" name="userphone" id="userphone" value="" placeholder="휴대폰 번호" />
							<input type="button" id="authbuttonpw" value="인증하기" onclick="authpw();" style="margin-left: 25px; font-family:'BMHANNAPro';"/>
						</div>
						
						<div id="authpw" style="display: none; margin-top: 17px;">
							<input type="text" name="authnum" id="authnum2" placeholder="인증번호" style="width: 218px;"/>
							<input type="button" id="abutton2" onclick="pwauth()" value="인증" style="margin-left: 25px; font-family:'BMHANNAPro';"/>
							<input type="button" id="tbutton2" onclick="addtime('pw');" value="시간 연장" style="margin-left: 25px; font-family:'BMHANNAPro';"/>
							<input type="text" id="time2" class="timepw" readonly style="width: 85px; font-family: 'BMHANNAPro'; margin-left: 41px; background: white; border: white; font-size:20px;"/>
						</div>
					</div>
					
					<!-- Break -->
					<div class="col-12" style="max-width: fit-content; margin: 0 auto;">
						<ul class="actions" style="">
							<li style=""><input type="submit" value="비밀번호 찾기" class="primary"/></li>
						</ul>
					</div>
				</div>
			</form>

		<!-- Footer -->
			<div id="footer">
				<div class="wrapper">
					<div class="inner">
						<ul class="icons">
							<li><a href="https://www.facebook.com/smartbaedal"><img src="${cp}/images/icon-facebook@2x.png" style="height: 2.5rem;"></a></li>
							<li><a href="https://www.instagram.com/baemin_official/"><img src="${cp}/images/icon-instagram@2x.png" style="height: 2.5rem;"></a></li>
							<li><a href="https://blog.naver.com/smartbaedal"><img src="${cp}/images/icon-blog@2x.png" style="height: 2.5rem;"></a></li>
							<li><a href="https://www.youtube.com/user/smartbaedal2"><img src="${cp}/images/icon-youtube@2x.png" style="height: 2.5rem;"></a></li>
						</ul>
						<div class="copyright">
							&copy; ibeon-en jinjja iljo
						</div>
					</div>
				</div>
			</div>
			
			<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
			<script>let cp = "${pageContext.request.contextPath}";</script>
			<script src="${cp}/assets/js/user.js"></script>
			<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	</body>
</html>