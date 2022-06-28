<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
	input[type="button"]:hover {
		background-color: white ;
	}
</style>
<header id="header" class="alt">
	<a class="logo" href="${cp}/"><img src="${cp}/images/logo2.png"></a>
	<c:choose>
		<c:when test="${loginUser == null}">
			<ul class="actions" style="margin-right: 80px; margin-top:34px; font-family:'BMHANNAPro';">
				<li><a href="https://play.google.com/store/search?q=%EB%B0%B0%EB%8B%AC%EC%9D%98%EB%AF%BC%EC%A1%B1&c=apps&hl=ko&gl=KR" class="button icon solid fa-download">앱 다운로드</a></li>
				<li><a href="${cp}/user/UserLogin.us" class="button primary">로그인</a></li>
				<li><a href="${cp}/user/UserJoin.us" class="button">회원가입</a></li>
			</ul>
		</c:when>
		<c:otherwise>
			<ul class="actions" style="margin-right: 105px; margin-top: 52px; font-family:'BMHANNAPro'; position:absolute; right: 0">
				<li><a href="https://play.google.com/store/search?q=%EB%B0%B0%EB%8B%AC%EC%9D%98%EB%AF%BC%EC%A1%B1&c=apps&hl=ko&gl=KR" class="button icon solid fa-download">앱 다운로드</a></li>
				<li><a class="logo" href="${cp}/user/UserPage.us"><img src="${cp}/images/나의 배민.jpg"></a></li>
				<li>귀한 분, <span style="font-size: 31px; margin-left: 10px;">${loginUser.usernickname}</span></li>
			</ul>
			<nav style="position: absolute; right: 0; margin-bottom: 7px;">
				<div style="border: 1px solid white; border-radius: 50%; width: 23px; height: 23px; position: absolute; right: 38px; bottom: 40px; background: white; text-align: center;line-height: 10px;">
					<span style=" color: #2AC1BC; font-size: 16px; font-family: BMHANNAPro;">${baskets.size()}</span>
				</div>
    			<a href="#menu"><span class="label">Menu</span></a>
			</nav>
			<c:choose>
				<c:when test="${baskets.size() == 0}">
					<nav id="menu" style="font-family: 'BMHANNAAir'; width: 25%; background: rgb(246, 246, 246);">
						<h3>주문 정보가 없습니다</h3>
						<img src="${cp}/images/텅.png" style="opacity: 0.7; width: 100%; margin-top: 27%;">
					</nav>
				</c:when>
				<c:otherwise>
					<nav id="menu" style="font-family: 'BMHANNAAir'; width: 25%; background: rgb(246, 246, 246);">
						<form method="post" action="javascript:payview()" name="paymove">
							<h3 style="font-size: 43px;">${baskets.get(0).getStore().getStorename()}</h3><!-- 가게 이름 -->
							<hr>
							<c:set var="totalprice" value="0"></c:set>
							<c:forEach var="i" begin="0" end="${baskets.size() - 1}" step="1">
								<c:set var="deliveryprice" value="${baskets.get(i).getStore().getDeliverprice()}"></c:set>
								<c:set var="foodtotalprice" value="${baskets.get(i).getFoodtotalprice()}"></c:set>
								<c:set var="totalprice" value="${totalprice + foodtotalprice}"></c:set>
								<div style="margin-bottom: 18px; position: relative;">
									<a style="cursor: pointer;" onclick="removeBasket(${i})"><img src="${cp}/images/cancel.png" style="height: 3rem;position: absolute;right: 0;bottom: 143px;"></a>
									<h3 style="font-size: 27px;">${baskets.get(i).getFood().getFoodname()}</h3>
									<img src="${cp}/file/${baskets.get(i).getFoodfile().getSystemname()}" style=" width: 7rem; margin-bottom: -26px; margin-left: 15px;">
								</div>
								<ul class="links">
									<div style="font-size: 20px">
										<span>가격 : ${baskets.get(i).getFood().getFoodprice()}원</span><br>
										<c:choose>
											<c:when test="${baskets.get(i).getFoodoption().size() == 0}">
															
											</c:when>
											<c:otherwise>
												<c:forEach var="j" begin="0" end="${baskets.get(i).getFoodoption().size() - 1}"> 
													<span>${baskets.get(i).getFoodoption().get(j).getFoodoption()} : ${baskets.get(i).getFoodoption().get(j).getOptionname()} (${baskets.get(i).getFoodoption().get(j).getOptionprice()}원)</span><br>
												</c:forEach>
											</c:otherwise>
										</c:choose>
										<span>수량 : ${baskets.get(i).foodamount}개</span>
										<h4 style="margin-top: 10px;">가격 : ${foodtotalprice}원</h4>
									</div>
								</ul>
								<hr>
							</c:forEach>
							<a href="${cp}/store/DelMarketMenu.st?sn=${baskets.get(i).getStore().getStorenum()}" style="margin: 0 auto; text-align: center; text-decoration: none;">
								<p style="margin: -15px auto; text-align: center; font-size: 22px; margin: -30px 0 -30px 0; color: #2AC1BC">+ 더 담으러 가기</p>
							</a>
							<hr>
							<select style="width: 120px; margin:0; float: left; cursor: pointer;" onchange="changeOption(this);" id="foodhow">
								<option value="배달">배달</option>
								<option value="포장">포장</option>
								<option value="매장">매장</option>
							</select>
							<span style="font-size: 20px; margin-left: 10px;" id="howTo">로 받을게요</span>
							<hr>
							<div style="font-size: 23px">
								<p style="color: #9D9D9D; font-size: 19px;">최소주문금액 : ${baskets.get(0).getStore().getMinprice()}원</p>
								<p style="color: #9D9D9D;font-size: 15px; margin: -55px 0px -11px 0;">* 최소주문금액은 배달팁을 제외한 금액입니다.</p>
								<span>총 주문 금액</span><span style="position: absolute; right: 0; margin-right: 50px;">${totalprice}원</span>
								<br>
								<c:set var="totalprice" value="${totalprice + deliveryprice}"></c:set>
								<span>배달팁</span><span style="position: absolute; right: 0; margin-right: 50px;">${deliveryprice}원</span>
								<hr>
								<span>총 결제 금액</span><span style="position: fixed; right: 0; margin-right: 50px;">${totalprice}원</span>
							</div>
							<c:choose>
								<c:when test="${baskets.get(0).getStore().getMinprice() > (totalprice - deliveryprice)}">
									<div style="background-color: rgb(247, 247, 247); position: sticky; bottom: -51px; width: 100%; height: 5rem;">
										<input id="orderbutton" type="button" value="${baskets.get(0).getStore().getMinprice()}원 부터 주문할 수 있어요."  readonly
										style="background-color: rgb(228, 230, 232); color:white !important;box-shadow: inset 0 0 0 0px;position: sticky; bottom: 0; margin-top: 15px; width: 100%; cursor: unset;"/>
									</div>
								</c:when>
								<c:otherwise>
									<div style="background-color: rgb(247, 247, 247); position: sticky; bottom: -51px; width: 100%; height: 5rem;">
										<input type="button" value="${totalprice}원 결제하기" onclick="javascript:document.paymove.submit()"
										style="position: sticky; bottom: 0; margin-top: 15px; width: 100%;"/>
									</div>
								</c:otherwise>
							</c:choose>
							<input type="hidden" name="totalprice" value="${totalprice}">
							<input type="hidden" name="deliveryprice" value="${deliveryprice}">
						</form>
					</nav>
				</c:otherwise>
			</c:choose>
		</c:otherwise>
	</c:choose>
</header>
<script>
	function removeBasket(i) {
		const xhr = new XMLHttpRequest();
		
		xhr.open("GET",cp+"/user/RemoveBasket.us?i="+i,true);
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4){
				if(xhr.status == 200){
					let txt = xhr.responseText;
					txt = txt.trim();
					
					history.go(0);
				}
			}	
		}
		xhr.send();
	}
	
	var childWindow;
	function payview() {
		if(${totalPrice != 0}) {
			const foodhowtag = document.getElementById("foodhow");
			const foodhow = foodhowtag.options[foodhowtag.selectedIndex].text;
			const url = "${cp}/store/Pay.st?totalprice=" + ${totalprice} + "&deliveryprice=" + ${deliveryprice} + "&foodhow=" + foodhow;
			const name = "결제창";
			const option = "width = 520, height = 740, top = 350, left = 1000, location = no"
			childWindow = window.open(url, name, option);
		} else {			
			alert("결제 금액을 확인해주세요.");
		}
	}

	const changeOption = (target)  => { 
	    const value = target.value;

	    if(value == "배달") {
	        $("#howTo").text("로 받을게요");
	    } else if(value == "포장") {
	        $("#howTo").text("으로 주문할게요");
	    } else {
	        $("#howTo").text("에서 먹고 갈게요");
	    }
	}
</script>
