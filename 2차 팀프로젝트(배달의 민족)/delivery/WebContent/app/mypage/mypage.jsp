<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>My 배민</title>
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
		
<div class="table-wrapper1">
	<table class="alt">
		<tbody>
			<caption>My 배민</caption>
			<tr class="mypage1">
				<td colspan="3" class="mypa1">
					<img style="height: 3rem; float: left; margin-top: 29px; margin-left: -19px;" src="${cp}/images/profile.png">
					귀한분, ${loginUser.usernickname}
					<a href="${cp}/user/UserModify.us">
						<img style="height: 2rem;float: right;margin-top: 36px;" src="${cp}/images/rightarrow.png">
					</a>
				</td>
			</tr>
			<tr class="mypage1">
				<td colspan="3" class="mypa1">
					<img id="ordercnt" style="height: 5.5rem; float: left; margin-top: 6px;">
					&ensp;주문 횟수 : ${loginUser.ordercnt}회
				</td>
			</tr>
			<tr class="mypage3">
				<td class="mypage2">
					<a href="${cp}/store/LikeMarket.st" style="text-decoration: none; font-size: 26px; color: black;">
						<img src="${cp}/images/heart_icon.png" style="margin-left: 3px;"><br><span>찜</span>
					</a>
				</td>
				<td class="mypage2">
					<a href="${cp}/user/UserOrderhistory.us" style="text-decoration: none; font-size: 26px; color: black;">
						<img src="${cp}/images/file_page_paper_icon.png" style="margin-left: 12px;"><br><span>주문내역</span>
					</a>
				</td>
				<td class="mypage2">
					<a href="${cp}/user/MyReview.us" style="text-decoration: none; font-size: 26px; color: black;">
						<img src="${cp}/images/rating.png" style="margin-left: 1px; margin-top: 17px;"><br><span>리뷰관리</span>
					</a>
				</td>
			</tr>
		</tbody>
	</table>
	<div style="float: right; margin-top: -36px;">
		<a href="${cp}/user/UserLogout.us" style="text-decoration: none; cursor: pointer; color: #9D9D9D">로그아웃</a> <a href="${cp}/user/UserRemove.us" style="text-decoration: none; cursor: pointer; color: #9D9D9D">회원탈퇴</a>
	</div>
</div>
	
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
<script>
	if (${loginUser.grade} == 1){
		document.getElementById("ordercnt").src = "${cp}/images/동.png";
	}
	else if (${loginUser.grade} == 2){
		document.getElementById("ordercnt").src = "${cp}/images/은.png";
	}
	else if (${loginUser.grade} == 3){
		document.getElementById("ordercnt").src = "${cp}/images/금.png";
	}
</script>
</body>
</html>