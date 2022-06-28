<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>회원정보수정</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<link rel="stylesheet" href="${cp}/assets/css/main.css" />
<link rel="stylesheet" href="${cp}/assets/css/main2.css" />
<link rel="stylesheet" href="${cp}/assets/css/font.css" />
</head>
<body class="is-preload"  style="padding-bottom: 8rem;">
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
	
<form method="post" action="${cp}/user/UserModifyOk.us" name="modifyForm" id="modifyForm" onsubmit="return modify();" >

	<h2 style="text-align:center;">회원 정보 수정</h2>
	
	<div class="row gtr-uniform">
		<div style="display: inline-flex; margin-top: 0px;">
			<div class="col-6 col-12-xsmall" id="shortinput">
				이름
				<input type="text" name="username" id="username" value="" placeholder="이름" />
			</div>
			<div class="col-6 col-12-xsmall" id="shortinput" style="margin-left:30px;">
				닉네임
				<input type="text" name="usernickname" id="usernickname" value="" placeholder="닉네임" />
			</div>
		</div>

		<div class="col-6 col-12-xsmall" id="longinput" style="margin-top: -26px;">
			 새 비밀번호
			<input type="password" name="userpw" id="userpw" value="" placeholder=" 새 비밀번호" />
			<input type="password" name="userpw_re" id="userpw_re" value="" placeholder=" 새 비밀번호 재확인" />
		</div>
		
		<div class="col-6 col-12-xsmall" id="longinput">
			이메일
			<input type="email" name="useremail" id="useremail" value="" placeholder="이메일" />
		</div>
		
		<div class="col-6 col-12-xsmall" id="midinput">
			휴대폰
			<div style="display: inline-flex;">
				<input type="text" name="userphone" id="userphone" value="" placeholder="휴대폰 번호" />
				<input type="button" id="authbuttonjoin" value="인증하기" onclick="authmodify();" style="margin-left: 25px; font-family:'BMHANNAPro';"/>
			</div>
			<div id="authjoin" style="display: none; margin-top: 17px;">
				<input type="text" name="authnum" id="authnum" value="" placeholder="인증번호" style="width: 218px;"/>
				<input type="button" id="abutton" onclick="modifyauth()" value="인증" style="margin-left: 25px; font-family:'BMHANNAPro';"/>
				<input type="button" id="tbutton" onclick="addtime('join');" value="시간 연장" style="margin-left: 25px; font-family:'BMHANNAPro';"/>
				<input type="text" id="time" class="timejoin" readonly style="width: 85px; font-family: 'BMHANNAPro'; margin-left: 41px; background: white; border: white; font-size:20px;"/>
			</div>
		</div>	
		
		<div class="col-6 col-12-xsmall">
			우편번호
			<div style="display: inline-flex;">
				<input type="text" name="zipcode" id="sample6_postcode" readonly placeholder="우편번호">
				<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" style="margin-left: 25px; font-family:'BMHANNAPro';">
			</div>
			주소
			<input type="text" name="addr" id="sample6_address" readonly placeholder="주소">
			<div style="display: inline-flex; margin-top: 0px;">
				<div class="col-6 col-12-xsmall" id="shortinput">
					상세주소
					<input type="text" name="addrdetail" id="sample6_detailAddress" placeholder="상세주소">
				</div>
				<div class="col-6 col-12-xsmall" id="shortinput" style="margin-left:30px;">
					참고항목
					<input type="text" name="addretc" id="sample6_extraAddress" readonly placeholder="참고항목">
				</div>
			</div>
		</div>
		
		<!-- Break -->
		<div class="col-12">
			<ul class="actions">
				<li><input type="submit" value="변경하기" class="primary" style="font-family:'BMHANNAPro'; margin-top: 19px;" /></li>
			</ul>
		</div>
	</div>
</form>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>let cp = "${pageContext.request.contextPath}";</script>
<script src="${cp}/assets/js/user.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</body>
</html>