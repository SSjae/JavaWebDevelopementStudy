<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>회원탈퇴</title>
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
<header id="header" class="alt">
	<a class="logo" href="${cp}/"><img src="${cp}/images/logo2.png"></a>
	<c:choose>
		<c:when test="${loginUser == null}">
			<script>
				alert("로그인 후 들어와주세요.")
				location.href=${cp}/user/UserLogin.us
			</script>
		</c:when>
		<c:otherwise>
			<ul class="actions" style="margin-right: 105px; margin-top: 52px; font-family:'BMHANNAPro'; position:absolute; right: 0">
				<li><a href="https://play.google.com/store/search?q=%EB%B0%B0%EB%8B%AC%EC%9D%98%EB%AF%BC%EC%A1%B1&c=apps&hl=ko&gl=KR" class="button icon solid fa-download">앱 다운로드</a></li>
				<li><a class="logo" href="${cp}/user/UserPage.us"><img src="${cp}/images/나의 배민.jpg"></a></li>
				<li>귀한 분, <span style="font-size: 31px; margin-left: 10px;">${loginUser.usernickname}</span></li>
			</ul>
		</c:otherwise>
	</c:choose>
</header>
			
<form method="post" action="${cp}/user/UserRemoveOk.us" name="removeForm" id="removeForm" onsubmit="return removeUser();">
	<h2>회원탈퇴</h2>
	<div class="row gtr-uniform">
		<div class="col-6 col-12-xsmall" id="longinput">
			비밀번호를 입력 후, 회원탈퇴 버튼을 눌러주세요.
			<input type="password" name="userpw" id="userpw" value="" placeholder="비밀번호" autofocus/>
		</div>
		
		<!-- Break -->
		<div class="col-12" style="max-width: fit-content; margin: 0 auto;">
			<ul class="actions" style="">
				<li><input type="submit" value="회원탈퇴" class="primary"/></li>
			</ul>
		</div>
	</div>
</form>

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
</body>
</html>