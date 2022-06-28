<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
		<title>결과</title>
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
			
			<c:choose>
				<c:when test="${param.path eq 'id'}">
					<div id="findIdResult">
						<h2>아이디 찾기 결과</h2>
						<div class="row gtr-uniform">
							<div class="col-6 col-12-xsmall" id="longinput">
								<h4>${users[0].username}님의 아이디</h4>
								<c:forEach var="user" items="${users}">
									${user.userid}<br>
								</c:forEach>
							</div>
						</div>
						<div class="col-12" style="max-width: fit-content; margin: 0 auto;">
							<ul class="actions" style="">
								<li style=""><input type="button" value="로그인 하러 가기" class="primary" onclick="location.href='${cp}/user/UserLogin.us'"/></li>
							</ul>
						</div>
					</div>
					<c:remove var="users" scope="session" />
				</c:when>
				<c:otherwise>
					<form method="post" action="${cp}/user/FindResetPwOk.us?userid=${param.userid}" name="findResetPwForm" id="findResetPwForm" onsubmit="return findResetPw();">
						<h2>비밀번호 재설정</h2>
						<div class="row gtr-uniform">
							<div class="col-6 col-12-xsmall" id="longinput">
								새 비밀번호
								<input type="password" name="userpw" id="userpw" value="" placeholder="새 비밀번호" autofocus/>
							</div>
							<div class="col-6 col-12-xsmall" id="longinput">
								새 비밀번호 확인
								<input type="password" name="userpw_re" id="userpw_re" value="" placeholder="새 비밀번호 확인" />
							</div>
							
							<!-- Break -->
							<div class="col-12" style="max-width: fit-content; margin: 0 auto;">
								<ul class="actions" style="">
									<li style=""><input type="submit" value="비밀번호 재설정" class="primary"/></li>
								</ul>
							</div>
						</div>
					</form>
				</c:otherwise>
			</c:choose>
			
			<hr style="width: 799.99px; margin: 5rem auto 0 auto;">
			
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