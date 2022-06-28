<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>리뷰관리</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<link rel="stylesheet" href="${cp}/assets/css/main.css" />
<link rel="stylesheet" href="${cp}/assets/css/main2.css" />
<link rel="stylesheet" href="${cp}/assets/css/font.css" />
<style>
	#moveStore {
		text-decoration: none;
		color: #666666;
	}
	.menu a{cursor:pointer;}    
	.menu .hide{display:none;}
	
	.fa-star {
		color:#F8C802;
	}
	.rating .star-wrap{width: 20px; display: inline-block;}
	.rating .star {
		width: 0;
		overflow: hidden;
	}
</style>
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
<div id="four">
	<div class="wrapper style2" style="font-family: 'BMHANNAAir'; height: 100%; background: white;">
		<div class="inner" style="margin-top: -115px; width: 60%;">
			<header class="heading">
				<h2>리뷰관리</h2>
			</header>
			<c:choose>
				<c:when test="${review.size() == 0}">
					<div style="text-align: center; opacity: 0.7;">
						<p style="font-size: 4rem;">리뷰가 없습니다</p>
						<img src="${cp}/images/오토바이 배민.jpg">
					</div>
				</c:when>
				<c:otherwise>
					<p style="margin: 0; font-size: 2rem;">내가 쓴 총 리뷰 수 ${review.size()}개</p>
					<c:forEach var="i" begin="0" end="${review.size() - 1}" step="1" >
						<form method="post" action="${cp}/user/ModifyReview.us">
							<div style="margin: 0 auto; position: relative;">
								<a href="${cp}/store/DelMarketMenu.st?sn=${store[i].storenum}" id="moveStore">
									<span style="margin: 0; font-size:33px;">${store[i].storename} </span>
									<img style="height: 20px; margin-top: 16px; margin-right: 3px;"src="../../images/rightarrow.png">
								</a>
								<p class="tab" style="color: #F8C802; margin:0; font-family: 'BMJUA'">
									<div class="review">
										<div class="rating" data-rate="${review[i].starcnt}">
											<div class="star-wrap"><div class="star"><i class="fas fa-star"></i></div></div>
											<div class="star-wrap"><div class="star"><i class="fas fa-star"></i></div></div>
											<div class="star-wrap"><div class="star"><i class="fas fa-star"></i></div></div>
											<div class="star-wrap"><div class="star"><i class="fas fa-star"></i></div></div>
											<div class="star-wrap"><div class="star"><i class="fas fa-star"></i></div></div>
										</div>
									</div>
								 <div style="margin-top: -26px;">
			                         <span id="oldStr${i}">${review[i].starcnt}</span>점 <span style="color: #9D9D9D;"> ${review[i].regdate.substring(0,10)}</span>
			                     </div>
								<p style="font-size: 20px;" id="review1${i}">${review[i].reviewcontents}</p>
								<span style="position: absolute; right: 0; bottom: 2px;"><a style="color: #9D9D9D; cursor: pointer;" onclick="modify(${review[i].reviewnum}, ${store[i].storenum}, '${review[i].reviewcontents}', ${review[i].starcnt}, ${i})" id="change${i}">수정</a>&ensp;<a onclick="remove(${review[i].reviewnum}, ${i})" style="color: #9D9D9D;  cursor: pointer;">삭제</a></span>
								<div id="modify${i}" style="display: none;">
									<p style="float: left; font-size: 1.5rem; margin: 0; margin-right: 20px;">별점 : </p>
									<select id="modifyStr${i}" style="width: 180px;">
										<option value="5" id="${i}str5">★★★★★</option>
										<option value="4" id="${i}str4">★★★★☆</option>
										<option value="3" id="${i}str3">★★★☆☆</option>
										<option value="2" id="${i}str2">★★☆☆☆</option>
										<option value="1" id="${i}str1">★☆☆☆☆</option>
									</select>
									<input type="text"style="width: 100%; height: 120px; margin-bottom: 60px;" id="modifyText${i}" value="${review[i].reviewcontents }">
								</div>
								<hr>
							</div>
						</form>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</div>
</body>
<script>let cp = "${pageContext.request.contextPath}";</script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
	function modify(reviewnum, storenum, reviewcontents, starcnt, i) {
			const change = document.getElementById("change" + i);
			const review1 = document.getElementById("review1" + i);
			const modifyText = document.getElementById("modifyText" + i);
			const modify = document.getElementById("modify" + i);
			const modifyStr = document.getElementById("modifyStr" + i);
			const oldStr = document.getElementById("oldStr" + i).innerHTML;
			const oldStrid = document.getElementById(i + "str" + oldStr);

			
			if (change.innerHTML == "수정") {
				change.innerHTML = "수정완료";
				modify.style.display = "";
				oldStrid.selected="selected";
			
			} else if (change.innerHTML == "수정완료") {
				location.href = "${cp}/user/ModifyReview.us?reviewnum=" + reviewnum + "&storenum=" + storenum + "&reviewcontents=" + modifyText.value + "&starcnt=" + modifyStr.value;
			}
	}
	
	function remove(reviewnum, i) {
		if(window.confirm('정말 삭제하시겠습니까?')) {
			location.href = "${cp}/user/DelReview.us?reviewnum=" + reviewnum;
		}
	}
	
	var rating = $('.rating');
		
		rating.each(function() {
			var $this = $(this);
			var targetScore = $this.attr('data-rate');
			var firstdigit = targetScore.split('.');
			
			if(firstdigit.length > 1) {
				for(var i = 0; i < targetScore[0]; i++) {
					$this.find('.star').eq(i).css({width:'100%'});
				}
				$this.find('.star').eq(firstdigit[0]).css({width:firstdigit[1]+'0%'});
			} else {
				for(var i = 0; i < targetScore; i++) {
					$this.find('.star').eq(i).css({width:'100%'});
				}
			}
		})
	
</script>
</html>