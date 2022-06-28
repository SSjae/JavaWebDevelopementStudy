<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<style>
input[type="checkbox"]:checked + label:before, input[type="radio"]:checked + label:before {
	background-color: #61c5e0;
    border-color: #61c5e0;
    color: #ffffff;
    border-radius: 5px;
}

input[type="checkbox"] + label:before, input[type="radio"] + label:before {
    border-radius: 5px;
    border: solid 1px;
    content: '';
    display: inline-block;
    font-size: 0.8rem;
    height: 1.95rem;
    left: 0;
    line-height: 1.86875rem;
    position: absolute;
    text-align: center;
    top: 0.24375rem;
    width: 1.95rem;
}

input[type="checkbox"] + label:before, input[type="radio"] + label:before {
    background: rgba(144, 144, 144, 0.075);
    border-color: rgba(144, 144, 144, 0.25);
    border-radius: 5px;
}

.payPrice {
	font-size: 1.5rem;
}

.payPrice_position {
	position: absolute; 
	right: 0; 
	margin-right: 20px;
}

</style>
<head>
<title>payview</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<link rel="stylesheet" href="${cp}/assets/css/main.css" />
<link rel="stylesheet" href="${cp}/assets/css/main2.css" />
<link rel="stylesheet" href="${cp}/assets/css/font.css" />
</head>
<body class="is-preload" style="margin: 0 15px; ">
	<form action="javascript:submit()" name="payend">
		<div>
			<h2 style="font-size: 30px">배달정보</h2>
			<h4 style="margin-bottom: 13px; font-size: 20px;">우리집</h4>
			<h3 style="margin-bottom: 0; font-size: 33px;">${loginUser.addr}</h3><!-- 주소지 -->
			<p style="font-weight: 600; margin-bottom: 8px; font-size: 17px;">${loginUser.addretc}</p>
			<input type="text" placeholder="상세주소를 입력해주세요. (건물명, 동/호수 등)" value="${loginUser.addrdetail}">
		</div>
		<hr>
		<div>
			<span style="font-size: 35px; font-weight: bold;">${loginUser.userphone.substring(0,3)}-${loginUser.userphone.substring(3,7)}-${loginUser.userphone.substring(7,11)}</span>
		</div>
		<hr>
		<p style="margin: -15px 0; font-size: 13px; opacity: 0.5">내 주문횟수를 가게에 제공합니다. (최근 6개월)</p>
		<hr>
		<div>
			<p style="
			margin: -15px 0 15px;
		    font-size: 20px;
		    font-weight: bold;
			">요청사항</p>
			
			<p style="margin: 10px 0; opacity: 0.9;">가게 사장님께</p>
			<input type="text" placeholder="예) 견과류 빼주세요, 덜 맵게 해주세요" id="ownercall">
			<input type="checkbox" id="checkbox-beta2" name="demo-checkbox" style="border-radius: 5px;">
			<hr>
			<c:choose>			
				<c:when test="${param.foodhow == '배달'}">
					<p style="margin: 10px 0; opacity: 0.9;">라이더님께</p>
					<select style="margin-bottom: 15px; width: 100%" id="ridercall" onclick="changeRcall()">
						<option>조심히 안전하게 와주세요 :)</option>
						<option>문앞에 두고 벨 눌러주세요</option>
						<option>벨 누르지 말고 노크해주세요</option>
						<option>도착하기 전에 전화해주세요</option>
						<option>요청사항 없음</option>
						<option>직접 입력</option>
					</select>
					<input type="text" placeholder="배달시 요청사항을 적어주세요." style="display: none;" id="ridercallText">
					<hr>
				</c:when>
				<c:otherwise>
					<select style="display:none; margin-bottom: 15px; width: 100%" id="ridercall" onclick="changeRcall()">
						<option>조심히 안전하게 와주세요 :)</option>
					</select>
				</c:otherwise>
			</c:choose>
		</div>
		<br>
		<div>
			<p style="font-size: 23px; font-weight: bold; margin-top: -45px; margin-bottom: 6px;">결제금액</p>
			<span class="payPrice">주문금액</span><span class="payPrice payPrice_position">${param.totalprice - param.deliveryprice}원</span><br>
			<span class="payPrice">배달팁</span><span class="payPrice payPrice_position">${param.deliveryprice}원</span>
			<hr>
			<span class="payPrice" style="font-weight: bold;">총 결제금액</span>
			<span class="payPrice payPrice_position"  style="font-weight: bold;">${param.totalprice}원</span>
			<div style="background-color: #fff; position: sticky; bottom: 0; width: 100%; margin-top: 18px;">
				<input type="button" onclick="javascript:document.payend.submit()" value="${param.totalprice}원 결제하기" 
				style="position: sticky; bottom: 0; margin-bottom: 15px; width: 100%;"/>
			</div>
		</div>
		<input type="hidden" name="foodhow" value="${param.foodhow}">
	</form>
</body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	function changeRcall() {
		const ridercalltag = document.getElementById("ridercall");
		const ridercall = ridercalltag.options[ridercalltag.selectedIndex].text;
		const riderText = document.getElementById("ridercallText");
		
		if(ridercall == '직접 입력') { 
			ridercallText.style.display = "";
		}
	}
	
	

	function submit() {
		const ownercall = document.getElementById("ownercall").value;
		console.log(ownercall);
		const ridercalltag = document.getElementById("ridercall");
		const ridercall = ridercalltag.options[ridercalltag.selectedIndex].text;
		const riderText = document.getElementById("ridercallText");
		
		if(ridercall == '직접 입력') { 
			location.href = "${cp}/store/PayEnd.st?totalprice=" + ${param.totalprice} + "&deliveryprice=" + ${param.deliveryprice} + "&foodhow=" + '${param.foodhow}' + "&ownercall=" + ownercall + "&ridercall=" + riderText.value;
		} else {
			location.href = "${cp}/store/PayEnd.st?totalprice=" + ${param.totalprice} + "&deliveryprice=" + ${param.deliveryprice} + "&foodhow=" + '${param.foodhow}' + "&ownercall=" + ownercall + "&ridercall=" + ridercall;
		}
		window.alert('주문해 주셔서 감사합니다');
		window.self.close();
		opener.location.href = "${cp}/"
	}
</script>
</html>