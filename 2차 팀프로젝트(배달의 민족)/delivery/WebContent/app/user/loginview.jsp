<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
		<title>로그인</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<meta name="description" content="" />
		<meta name="keywords" content="" />
		<link rel="stylesheet" href="${cp}/assets/css/main.css" />
		<link rel="stylesheet" href="${cp}/assets/css/main2.css" />
		<link rel="stylesheet" href="${cp}/assets/css/font.css" />
	</head>
	<body class="is-preload">

	<c:set var="cp" value="${pageContext.request.contextPath}"></c:set>
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
			
			<form method="post" action="${cp}/user/UserLoginOk.us" name="loginForm" id="loginForm" onsubmit="return login();">
				<h2>로그인</h2>
				<div class="row gtr-uniform">
					<div class="col-6 col-12-xsmall" id="longinput">
						아이디
						<input type="text" name="userid" id="userid" value="${param.userid == null?'':param.userid}" placeholder="아이디" autofocus/>
					</div>
					<div class="col-6 col-12-xsmall" id="longinput">
						비밀번호
						<input type="password" name="userpw" id="userpw" value="" placeholder="비밀번호" />
					</div>
					
					<!-- Break -->
					<div class="col-12" style="max-width: fit-content; margin: 0 auto;">
						<ul class="actions" style="">
							<li><input type="submit" value="로그인" class="primary"/></li>
						</ul>
						<div style="margin-top: 13px; text-align: center;"><a href="${cp}/user/FindIdPw.us" class="logina">아이디 / 비밀번호 찾기</a></div>
						<span>혹시, 배달의민족이 처음이신가요? <a href="${cp}/user/UserJoin.us" style="color: #2AC1BC">회원가입</a></span>
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