<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>배달의 민족</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<link rel="stylesheet" href="assets/css/main.css" />
<link rel="stylesheet" href="assets/css/main2.css" />
<link rel="stylesheet" href="assets/css/font.css" />
</head>
<body class="is-preload">
<c:set var="cp" value="${pageContext.request.contextPath}"></c:set>

<c:import url="${cp}/header.jsp"/>

<div id="banner">
	<div class="wrapper style1" style="height: 52rem;">
		<form method="post" name="searchForm" action="${cp}/store/SearchMarket.st" class="combined" style="width: 38rem; height: 0rem; top: -6rem; margin-bottom: -63px;" onsubmit="se();">
			<input type="text" name="search" id="search" placeholder="먹고 싶은 가게 검색" class="invert" style="height: 3rem; font-family: 'BMHANNAAir'"/>
			<input type="submit" class="special" value="검색" style="height: 55px; line-height: 1px; color: #2AC1BC !important; font-family: 'BMHANNAAir'"/>
		</form>
		<div class="inner" style="font-family:'BMJUA';">
			<div style="float:left; width: 1580px; margin:-110px 50px 80px 10px;">
				<img src="${cp}/images/우리가 어떤 민족.png" style="height:17rem;">
				<img src="${cp}/images/밥.png" style="height: 31rem; margin:0px 45px;">
				<img src="${cp}/images/줄 서서 먹던.png" style="height: 17rem;">
			</div>
		</div>
	</div>
</div>

<div id="one" class="features-grid special">
    <div class="feature">
        <a href="${cp}/store/DelFoodTheme.st?th=1인분" class="themeAtag"><img src="${cp}/images/1인분.png" class="themeImg"></a>
    </div>
    <div class="feature">
        <a href="${cp}/store/DelFoodTheme.st?th=돈까스_회_일식" class="themeAtag"><img src="${cp}/images/돈까스_회_일식.png" class="themeImg"></a>
    </div>
    <div class="feature">
        <a href="${cp}/store/DelFoodTheme.st?th=중식" class="themeAtag"><img src="${cp}/images/중식.png" class="themeImg"></a>
    </div>
    <div class="feature">
        <a href="${cp}/store/DelFoodTheme.st?th=치킨" class="themeAtag"><img src="${cp}/images/치킨.png" class="themeImg"></a>
    </div>
    <div class="feature">
        <a href="${cp}/store/DelFoodTheme.st?th=백반_죽_국수" class="themeAtag"><img src="${cp}/images/백반_죽_국수.png" class="themeImg"></a>
    </div>
    <div class="feature">
        <a href="${cp}/store/DelFoodTheme.st?th=카페_디저트" class="themeAtag"><img src="${cp}/images/카페_디저트.png" class="themeImg"></a>
    </div>
    <div class="feature">
        <a href="${cp}/store/DelFoodTheme.st?th=분식" class="themeAtag"><img src="${cp}/images/분식.png" class="themeImg"></a>
    </div>
    <div class="feature">
        <a href="${cp}/store/DelFoodTheme.st?th=찜_탕_찌개" class="themeAtag"><img src="${cp}/images/찜_탕_찌개.png" class="themeImg"></a>
    </div>
    <div class="feature">
        <a href="${cp}/store/DelFoodTheme.st?th=피자" class="themeAtag"><img src="${cp}/images/피자.png" class="themeImg"></a>
    </div>
    <div class="feature">
        <a href="${cp}/store/DelFoodTheme.st?th=양식" class="themeAtag"><img src="${cp}/images/양식.png" class="themeImg"></a>
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

<script src="${cp}/assets/js/jquery.min.js"></script>
<script src="${cp}/assets/js/jquery.scrollex.min.js"></script>
<script src="${cp}/assets/js/jquery.scrolly.min.js"></script>
<script src="${cp}/assets/js/browser.min.js"></script>
<script src="${cp}/assets/js/breakpoints.min.js"></script>
<script src="${cp}/assets/js/util.js"></script>
<script src="${cp}/assets/js/main.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</body>
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
</html>