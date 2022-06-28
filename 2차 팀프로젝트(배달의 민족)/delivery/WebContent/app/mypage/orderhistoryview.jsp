<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>주문내역</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<link rel="stylesheet" href="${cp}/assets/css/main.css" />
<link rel="stylesheet" href="${cp}/assets/css/main2.css" />
<link rel="stylesheet" href="${cp}/assets/css/font.css" />
</head>
<body class="is-preload" style="margin: 0 auto;">
<c:set var="cp" value="${pageContext.request.contextPath}"></c:set>
<header id="header" class="alt">
	<a class="logo" href="${cp}/"><img src="${cp}/images/logo2.png"></a>
	<c:choose>
		<c:when test="${loginUser == null}">
			<script>
				alert("로그인 후 들어와주세요.")
				location.href="${cp}/user/UserLogin.us"
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
				<h2>주문내역</h2>
			</header>
			<c:choose>
				<c:when test="${orders.size() == 0 }">
					<div style="text-align: center; opacity: 0.7;">
						<p style="font-size: 4rem;">주문 내역이 없습니다</p>
						<img src="${cp}/images/오토바이 배민.jpg">
					</div>
				</c:when>
				<c:otherwise>
					<c:forEach var="i" begin="0" end="${orders.size() - 1}" step="1">
						<div style="width: 70%; margin: 0 auto; margin-top: 55px; font-family: 'BMHANNAAir';">
							<span>주문완료</span>
							<img src="${cp}/file/${storeFile.get(i).systemname}" style="float: left; width: 200px; height: 200px; margin-right: 50px; border-radius: 25%">
							<div style="margin-bottom: 34px;">
								<a class="question" id="que-${i}" style="text-decoration: none; ">
									<img src="${cp}/images/downarrow.png" style="float: right; height:2rem; cursor: pointer; margin-top: 16px;">
								</a>
								<a href="${cp}/store/DelMarketMenu.st?sn=${orders.get(i).storenum}" style="color:black; text-decoration: none; font-weight: bolder;"><span style="font-size: 2rem;">${orderStore.get(i).storename} ></span></a><br>
								주문일시 : ${orders.get(i).regdate}<br>
								${orders.get(i).foodhow}
								<div class="answer" id="ans-${i}" style="display:none;">
									<hr style="margin: 41px 0px 5px 0;">
									<c:forEach var="j" begin="0" end="${foods.get(i).size()-1}" step="1">
										<div style="margin-top: 12px; margin-bottom: 10px; position: relative;">
											<span style="font-size: 26px; color: black;">${foods.get(i).get(j).foodname}</span>
											<span style="position: absolute; right: 0; font-size: 23px; color: black;">${foodtotalprice.get(i)[j]}원</span>
											<p style="margin-bottom: 0;">기본: ${foods.get(i).get(j).foodprice}원</p>
											<c:choose>
												<c:when test="${foodOptions.get(i).size() == 0}">
												</c:when>
												<c:otherwise>
													<c:forEach var="k" begin="0" end="${foodOptions.get(i).size()-1}">
														<c:if test="${foods.get(i).get(j).foodnum == foodOptions.get(i).get(k).foodnum}">
															<p style="margin: 0 0 0rem 0;">${foodOptions.get(i).get(k).foodoption} : ${foodOptions.get(i).get(k).optionname} (${foodOptions.get(i).get(k).optionprice}원)</p>
														</c:if>
													</c:forEach>												
												</c:otherwise>
											</c:choose>
											<span>수량: ${foodamount.get(i)[j]}개</span>
										</div>
									</c:forEach>
									<hr style="margin:0; border:0; height: 3px; background-color: #EAEAEA">
									<hr style="margin:0; border:0; height: 20px; background-color: #F6F6F6; margin-bottom: 8px;">
									<div class="spotlight" style="position: relative; font-size: 27px; font-weight: bold;">
										<span>총 주문 금액</span><span style="position: absolute; right: 0;">${orders.get(i).totalprice - orderStore.get(i).deliverprice}원</span><br>
										<span>배달팁</span><span style="position: absolute; right: 0;">${orderStore.get(i).deliverprice}원</span>
										<hr style="margin: 8px;">
										<span>총 결제 금액</span><span style="position: absolute; right: 0;">${orders.get(i).totalprice}원</span>
									</div>
									<hr style="margin:0; border:0; height: 3px; background-color: #EAEAEA">
									<hr style="margin:0; border:0; height: 20px; background-color: #F6F6F6; margin-bottom: 8px;">
									<div>
										<p class="hishead">배달주소</p>
										<span>${orderStore.get(i).addr} ${orderStore.get(i).addrdetail} ${orderStore.get(i).addretc}</span>
										<hr style="margin: 5px 0px 5px 0;">
									</div>
									<div>
										<p class="hishead">전화번호</p>
										<span>${orderStore.get(i).storephone}</span>
										<hr style="margin: 5px 0px 5px 0;">
									</div>
									<div>
										<p class="hishead">가게 사장님께</p>
										<c:choose>
											<c:when test="${orders.get(i).ownercall == ''}">
												<span>요청사항 없음</span>
											</c:when>
											<c:otherwise>
												<span>${orders.get(i).ownercall}</span>
											</c:otherwise>
										</c:choose>
										<hr style="margin: 5px 0px 5px 0;">
									</div>
									<c:if test="${orders.get(i).foodhow == '배달'}">
										<div>
											<p class="hishead">라이더님께</p>
											<span>${orders.get(i).ridercall}</span>
										</div>
									</c:if>
									<hr style="margin:0; border:0; height: 3px; background-color: #EAEAEA">
									<hr style="margin:0; border:0; height: 20px; background-color: #F6F6F6; margin-bottom: 8px;">
									<div style="text-align: center;">
										<a href="${cp}/user/RemoveUserOrderhistory.us?on=${orders.get(i).ordernum}" style="color:red; text-decoration: none; cursor: pointer; text-align: center;">주문내역 삭제</a>
									</div>
								</div>
							</div>
							<hr style="margin: 5px 0px 5px 0;">
							<div style="text-align: center; margin-top: 42px; ">
								<input type="button" id="reviewButton${i}" value="리뷰쓰기" onclick="writeReview(${i})" style="width: 75%; font-family: 'BMHANNAAir' !important; "/>
								<form action="${cp}/user/ReviewWrite.us" method="get" style="display: none" id="reviewForm${i}" onsubmit="return review(${i});">
									<p style="float: left; font-size: 1.5rem; margin: 0; margin-right: 20px;">별점 : </p>
									<select name="starcnt" style="width: 180px;">
										<option value="5">★★★★★</option>
										<option value="4">★★★★☆</option>
										<option value="3">★★★☆☆</option>
										<option value="2">★★☆☆☆</option>
										<option value="1">★☆☆☆☆</option>
									</select>
									<input id="storenum${i}" type="hidden" name="sn" value="${orderStore.get(i).storenum}"/>
									<textarea id="reviewcontents${i}" name="reviewcontents" style="width: 100%;height: 25rem; resize: none;"></textarea>
									<input type="submit" value="리뷰 작성" style="margin-top: 25px; font-family: 'BMHANNAAir' !important;">
								</form>
							</div>
						</div>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</div>

<script>let cp = "${pageContext.request.contextPath}";</script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	function writeReview(i) {
		const xhr = new XMLHttpRequest();
		
		xhr.open("GET",cp+"/user/CheckReview.us?sn="+$('#storenum'+i).val(),true);
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4){
				if(xhr.status == 200){
					let txt = xhr.responseText;
					txt = txt.trim();
					
					if(txt == "O") {
						$("#reviewButton"+i).css("display","none");
						$("#reviewForm"+i).css("display","contents");
					} else {
						alert("이미 리뷰를 작성하였습니다. 리뷰 관리로 돌아갑니다.");
						location.href = "${cp}/user/MyReview.us";
					}
				}
			}	
		}
		xhr.send();
	}
	
	function review(i) {
		if($("#reviewcontents"+i).val() == "") {
			alert("리뷰를 작성해주세요!");
			$("#reviewcontents"+i).focus();
			return false;
		}
	}

  const items = document.querySelectorAll('.question');

  function openCloseAnswer() {
    const answerId = this.id.replace('que', 'ans');

    if(document.getElementById(answerId).style.display === 'block') {
      document.getElementById(answerId).style.display = 'none';
    } else {
      document.getElementById(answerId).style.display = 'block';
    }
  }

  items.forEach(item => item.addEventListener('click', openCloseAnswer));
  
  function handleOnChange(e) {
	  // 선택된 데이터 가져오기
	  const target = document.getElementById(e)
	  const value = target.options[target.selectedIndex].text
	  if(value == "별점 선택"){
		  alert("별점을 선택해주세요!")
	  }
	}
</script>
</body>
</html>