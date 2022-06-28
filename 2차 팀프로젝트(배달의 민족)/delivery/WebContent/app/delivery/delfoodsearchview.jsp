<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배달의 민족</title>
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

<c:import url="${cp}/header.jsp"/>
			
<div id="four">
	<div class="wrapper style2" style="font-family: 'BMHANNAAir'; height: 26rem;">
		<div class="inner">
			<form method="post" name="searchForm" action="${cp}/store/SearchMarket.st" class="combined" style="width: 38rem; height: 0rem; top: -6rem; margin-bottom: -21px;" onsubmit="se();">
				<input type="text" name="search" id="search" placeholder="먹고 싶은 가게 검색" class="invert" style="border-color: white; height: 3rem; font-family: 'BMHANNAAir';"/>
				<input type="submit" class="special" value="검색" style="height: 55px; line-height: 1px; color: #2AC1BC !important; font-family: 'BMHANNAAir'"/>
			</form>
			<header class="heading">
				<h2>검색 결과</h2> <!-- 현재 가게 테마 -->
				<table style="background-color: #fff; border-radius: 10px;" class="">
				<tr> <!-- 가게 테마 이동 버튼 -->
					<td class="themeBtn"><a href="${cp}/store/DelFoodTheme.st?th=1인분" class="themeAtag">1인분</a></td>
					<td class="themeBtn"><a href="${cp}/store/DelFoodTheme.st?th=돈까스_회_일식" class="themeAtag">돈까스 회 일식</a></td>
					<td class="themeBtn"><a href="${cp}/store/DelFoodTheme.st?th=중식" class="themeAtag">중식</a></td>
					<td class="themeBtn"><a href="${cp}/store/DelFoodTheme.st?th=치킨" class="themeAtag">치킨</a></td>
					<td class="themeBtn"><a href="${cp}/store/DelFoodTheme.st?th=백반_죽_국수" class="themeAtag">백반 죽 국수</a></td>
				</tr>
				<tr>
					<td class="themeBtn"><a href="${cp}/store/DelFoodTheme.st?th=카페_디저트" class="themeAtag">카페 디저트</a></td>
					<td class="themeBtn"><a href="${cp}/store/DelFoodTheme.st?th=분식" class="themeAtag">분식</a></td>
					<td class="themeBtn"><a href="${cp}/store/DelFoodTheme.st?th=찜_탕_찌개" class="themeAtag">찜 탕 찌개</a></td>
					<td class="themeBtn"><a href="${cp}/store/DelFoodTheme.st?th=피자" class="themeAtag">피자</a></td>
					<td class="themeBtn"><a href="${cp}/store/DelFoodTheme.st?th=양식" class="themeAtag">양식</a></td>
				</tr>
				</table>
			</header>
			<div class="spotlights"><!-- 테마별 가게들 -->
				<c:choose>
					<c:when test="${stores.size() == 0}">
						<script>
							alert("검색 결과가 없습니다.");
							location.href = "${cp}/"
						</script>
					</c:when>
					<c:otherwise>
						<c:forEach var="i" begin="0" end="${stores.size()-1}" step="1">
							<a href="${cp}/store/DelMarketMenu.st?sn=${stores.get(i).storenum}" class="themeMarket">
								<div class="spotlight" style="border-radius: 10px;">
									<div class="image fit">
										<img src="${cp}/file/${storeFile.get(i).systemname}" style="margin-top: 48px;"/><!-- 가게 썸네일 -->
									</div>
									<div class="content">
										<h3>${stores.get(i).storename}</h3><!-- 가게 이름 -->
										<h5 style="color: #9D9D9D;font-size: 22px;margin-top: -15px;">${stores.get(i).storedetail}</h5>
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
			
		</div>
	</div>
</div>
	
<script src="${cp}/assets/js/jquery.min.js"></script>
<script src="${cp}/assets/js/jquery.scrollex.min.js"></script>
<script src="${cp}/assets/js/jquery.scrolly.min.js"></script>
<script src="${cp}/assets/js/browser.min.js"></script>
<script src="${cp}/assets/js/breakpoints.min.js"></script>
<script src="${cp}/assets/js/util.js"></script>
<script src="${cp}/assets/js/main.js"></script>

<script>
	function se() {
		const searchForm = document.searchForm;
		
		if(searchForm.search.value == "") {
			alert("검색어를 입력해주세요.");
			return false;
		}
		return true;
	}
</script>
</body>
</html>