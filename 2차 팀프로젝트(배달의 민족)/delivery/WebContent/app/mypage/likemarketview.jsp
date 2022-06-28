<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>찜한 가게</title>
<link rel="stylesheet" href="${cp}/assets/css/main.css" />
<link rel="stylesheet" href="${cp}/assets/css/main2.css" />
<link rel="stylesheet" href="${cp}/assets/css/font.css" />
<style>
	 .themeBtn {
		width: 20%;
		font-size: 20px;
		color: black;
		
	} 
	.themeBtn > a {
		text-decoration: none;
	}
	.spotlights > a {
		text-decoration: none;
	}
</style>
</head>
<body class="is-preload">
<header id="header" class="alt">
	<a class="logo" href="${cp}/"><img src="../../images/logo2.png"></a>
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
			
<div id="four">
	<div class="wrapper style2" style="font-family: 'BMHANNAAir'; height: 100%; background: white;">
		<div class="inner" style="margin-top: -115px;">
			<header class="heading">
				<h2>찜</h2>
			</header>
			<div class="spotlights"><!-- 테마별 가게들 -->
				<c:choose>
					<c:when test="${likeStore.size() == 0}">
					<div style="text-align: center; opacity: 0.7;">
						<p style="font-size: 4rem;">찜한 가게가 없습니다</p>
						<img src="${cp}/images/오토바이 배민.jpg">
					</div>
					</c:when>
					<c:otherwise>
						<c:forEach var="i" begin="0" end="${likeStore.size()-1}" step="1">
						총 ${totalLikeCnt}개
							<a href="${cp}/user/RemoveLikeStore.us?sn=${likeStore.get(i).storenum}" style="cursor: pointer">
								<img src="${cp}/images/cancel.png" style="height: 4rem; position: absolute; right: 415px;">
							</a>
							<a href="${cp}/store/DelMarketMenu.st?sn=${likeStore.get(i).storenum}" class="themeMarket">
								<div class="spotlight" style="border-radius: 10px;">
									<div class="image fit">
										<img src="${cp}/file/${storeFile.get(i).systemname}" style="margin-top: 48px;"/><!-- 가게 썸네일 -->
									</div>
									<div class="content">
										<h3>${store.get(i).storename}</h3><!-- 가게 이름 -->
										<h5 style="color: #9D9D9D;font-size: 22px;margin-top: -15px;">${store.get(i).storedetail}</h5>
										<p class="tab" style="color: #F8C802; margin-top: -26px;; font-family: 'BMJUA'">&nbsp;★ <span style="color: #9D9D9D;">(${reviewCnt[i] > 100?'100+':reviewCnt[i]})</span></p>
										<p style="margin-top: -43px; color: #9D9D9D;">
											<c:if test="${foodsname.get(i).size() == 0}"></c:if>
											<c:if test="${foodsname.get(i).size() == 1}">${foodsname.get(i).get(0)} ...</c:if>
											<c:if test="${foodsname.get(i).size() == 2}">${foodsname.get(i).get(0)}, ${foodsname.get(i).get(1)} ...</c:if>
										</p><!-- 가게 메뉴 (가장 위에 몇 가지 글자수 제한두기) -->
									</div>
								</div>
							</a>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
</div>
</body>
</html>