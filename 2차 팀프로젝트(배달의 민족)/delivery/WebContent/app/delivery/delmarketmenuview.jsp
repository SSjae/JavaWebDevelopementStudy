<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>${store.storename}</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<link rel="stylesheet" href="${cp}/assets/css/main.css" />
<link rel="stylesheet" href="${cp}/assets/css/main2.css" />
<link rel="stylesheet" href="${cp}/assets/css/font.css" />
<style>
	.title{
		margin: 0;
	}
	.desc{
		margin : 0;
		font-size: 20px;
		color: #ACACAC;
	}
	.price{
		font-size: 30px;
		color : #2AC1BC;
	}
	.tab { white-space: pre;
	}
	progress{
		color: #F8C802
		-webkit-appearance: none;
		appearance: none;
		border-radius: 10px;
	}
	progress::-webkit-progress-bar{
		width: 200px;
		height: 5px;
		background-color:#E6E6E6;
		border-radius: 10px;
	}
	progress::-webkit-progress-value{
		background-color:#F8C802;
		border-radius: 10px;
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

<c:import url="${cp}/header.jsp"/>

<div id="marketmenu">
	<div class="wrapper style2" style="font-family: 'BMHANNAAir'; background: none; height: 24rem;">
		<div class="inner" style="margin-top: -74px;">
			<header class="heading" style="box-shadow: 0px 25px 75px 0px rgb(0 0 0 / 10%); border-radius: 20px; height: 20rem;">
				<h1 style="padding: 25px;">${store.storename}</h1>
				<div style="margin-top: -70px;">
					<div class="rating" data-rate="${store.starcnt}">
						<div class="star-wrap"><div class="star"><i class="fas fa-star"></i></div></div>
						<div class="star-wrap"><div class="star"><i class="fas fa-star"></i></div></div>
						<div class="star-wrap"><div class="star"><i class="fas fa-star"></i></div></div>
						<div class="star-wrap"><div class="star"><i class="fas fa-star"></i></div></div>
						<div class="star-wrap"><div class="star"><i class="fas fa-star"></i></div></div>
						<span style="font-size: 2rem; position: relative; top: -12px;">&ensp;${store.starcnt}</span>
					</div>
					<p style="font-size: 1.5rem; color: #9D9D9D;margin-top: -31px; margin-bottom: -11px;">최근리뷰 ${reviewcnt} | 배달팁 ${store.deliverprice}원</p>
					<p style="font-size: 1.2rem; color: #9D9D9D; margin-top: -16px; margin-bottom: -15px;">최소주문금액 : ${store.minprice}원</p>
					<a class="callheart" onclick="clickcall();" style="margin-left: -23px; text-decoration: none; color:black; cursor: pointer;">
						<img src="${cp}/images/전화.png" style="height: 1rem;">&ensp;
						<span style="font-size: 1.5rem;">전화</span>
					</a>
					&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;
					<a class="callheart" onclick="clickheart();" style="text-decoration: none; color: black; cursor: pointer;">
						<img class="heart" src="${cp}${like == 0?'/images/blackheart.png':'/images/redheart.png'}" style="height: 1.3rem; margin-right: 6px;">
						<span class="likecnt" style="font-size: 1.5rem;">찜 ${store.likecnt}</span>
					</a>
				</div>
			</header>
			
			<div class="table-wrapper1" style="width: 1400px;">
				<table class="alt">
					<tbody>
						<tr style="height: 5rem; line-height: 5rem; position: sticky; top: 0px; z-index: 1; background-color: #F6F6F6;">
							<td class="clickmenu1" onclick="clickmenu1()" style="border-top-color: black; border-bottom-width: 0;">메뉴</td>
							<td class="clickinfo" onclick="clickinfo()">정보</td>
							<td class="clickreview" onclick="clickreview()">리뷰</td>
						</tr>
						<tr>
							<td colspan="3">
							<!-- 메뉴 -->
								<div id="menu1" style="display: contents;">
									<!-- 테마별 가게들 -->
									<div class="spotlights">
										<h2 style="text-align: center; color: #C6A57A; background-color: white; margin-top: 15px;">── ··· 대표메뉴 ··· ──</h2>
										<c:forEach var="i" begin="0" end="${foods.size() < 3?foods.size() - 1:2}" step="1">
											<form action="${cp}/user/Basket.us" id="topMenu${i}" style="margin: 0px 0 0rem 0;">
												<div style="position: relative;">
													<a class="question" id="que${i}" style="text-decoration: none;  cursor: pointer;">
														<img src="${cp}/images/downarrow.png" style="height:2rem; cursor: pointer;position: absolute; right: 0; margin-top: 13px;">
														<div class="spotlight">
															<div class="image fit">
																<img src="${cp}/file/${foodFile.get(i).systemname}" style="margin-top: 44px;">
															</div>
															<div class="content">
																<h3 class="title">${foods.get(i).foodname}</h3>
																<p class="desc">${foods.get(i).foodtheme} / ${foods.get(i).foodname}</p>
																<p class="price"><span id="price${i}">${foods.get(i).foodprice}</span>원</p>
															</div>
														</div>
													</a>
													<div class="answer" id="ans${i}" style="display:none; height: 100%; background-color: rgb(234, 234, 234);">
														<div style="padding-left: 3rem; padding-bottom: 45px;">
															<div>
																<span style="font-size: 2.5rem;">가격</span><span style="font-size: 2.5rem; position: absolute; right: 0; margin-right: 44px;margin-top: 17px;"><span id="totalprice${i}">${foods.get(i).foodprice}</span>원</span><br>
															</div>
															<c:choose>
																<c:when test="${foodOptions.get(i).size() == 0}">
																	<hr style="width: 69rem;">
																	<input type="hidden" name="demo-radio${i}">
																	<input type="hidden" name="demo-checkbox${i}">
																</c:when>
																<c:otherwise>
																	<c:set var="option" value="${foodOptions.get(i).get(0).foodoption}"/>
																	<span style="font-size: 2rem;">${option}</span><br>
																	<div style="width: 50%">
																		<c:forEach var="j" begin="0" end="${foodOptions.get(i).size()-1}" step="1">
																			<c:if test="${option != foodOptions.get(i).get(j).foodoption}">
																				<c:set var="option" value="${foodOptions.get(i).get(j).foodoption}"/>
																				<span style="font-size: 2rem;">${option}</span><br>
																			</c:if>
																			<c:choose>
																				<c:when test="${foodOptions.get(i).get(j).isoverlap == false}">
																					<c:choose>
																						<c:when test="${j == 0}">
																							<input type="radio" id="radio-alpha${i}${j}" value="${foodOptions.get(i).get(j).optionnum}" name="demo-radio${i}" checked style="border-radius: 5px;" onclick="clickradio1(${i}, ${j})">
																							<label for="radio-alpha${i}${j}">${foodOptions.get(i).get(j).optionname} (<span id="optionprice1${i}${j}">${foodOptions.get(i).get(j).optionprice}</span>원)</label><br>
																							<input type="hidden" name="demo-checkbox${i}">
																						</c:when>
																						<c:otherwise>
																							<input type="radio" id="radio-alpha${i}${j}" value="${foodOptions.get(i).get(j).optionnum}" name="demo-radio${i}" style="border-radius: 5px;" onclick="clickradio1(${i}, ${j})">
																							<label for="radio-alpha${i}${j}">${foodOptions.get(i).get(j).optionname} (<span id="optionprice1${i}${j}">${foodOptions.get(i).get(j).optionprice}</span>원)</label><br>
																							<input type="hidden" name="demo-checkbox${i}">
																						</c:otherwise>
																					</c:choose>
																				</c:when>
																				<c:otherwise>
																					<input type="checkbox" id="checkbox-beta${i}${j}" value="${foodOptions.get(i).get(j).optionnum}" name="demo-checkbox${i}" style="border-radius: 5px;" onclick="clickcheckbox1(${i}, ${j})">
																					<label for="checkbox-beta${i}${j}" style="margin: 10px 0;">${foodOptions.get(i).get(j).optionname} (+<span id="optionprice2${i}${j}">${foodOptions.get(i).get(j).optionprice}</span>원)</label><br>
																					<input type="hidden" name="demo-radio${i}">
																					<input type="hidden" name="demo-checkbox${i}">
																				</c:otherwise>
																			</c:choose>
																		</c:forEach>
																	</div>
																</c:otherwise>
															</c:choose>
															<div style="width: 156px; text-align: center; border-radius: 30px; position: absolute; right: 0; margin: -16px 146px 0 0; background-color: white; box-shadow: inset 0 0 0 2px #2ac1bc; color: #2AC1BC !important; height: 3rem; font-size: 20px; line-height: 3.25rem; padding: 0 1.75rem; font-weight: 600;">
																<a style="cursor: pointer" onclick="minus(${i})"><img src="${cp}/images/minus.png" style="position: absolute; height: 2rem; left: 0px; margin: 9px 0 0 14px;"></a>
																	<span id="num${i}">1</span>개
																<a style="cursor: pointer" onclick="plus(${i})"><img src="${cp}/images/plus.png" style="position: absolute; height: 2rem; right: 0px; margin: 9px 14px 0 0;"></a>
															</div>
															<a class="button" onclick="basketIn(${i})" style="position:absolute; right: 0; margin: -16px 39px 0 0;">담기</a>
															<input type="hidden" name="storenum" value="${store.storenum}">
															<input type="hidden" name="foodnum" value="${foods.get(i).foodnum}">
															<input type="hidden" id="foodamount${i}" name="foodamount" value="">
															<input type="hidden" id="foodtotalprice${i}" name="foodtotalprice" value="">
															<input type="hidden" name="i" value="${i}">
															<input type="hidden" name="path" value="top">
														</div>
													</div>
												</div>
											</form>
										</c:forEach>
										
										
										<!-- 슬라이드 숫자 바꿔줘야 함 -->
										<div class="faq-content" style="width: 1399.99px; background-color: #F6F6F6; border-bottom: 4px solid #EAEAEA;">
											<span style="color: black; font-size: 1.5rem;">&ensp;&ensp;전체</span>
											<a class="question" id="que-0" style="text-decoration: none; ">
												<img src="${cp}/images/downarrow.png" style="float: right; height:2rem; cursor: pointer; margin-top: 16px;">
											</a>
											<div class="answer" id="ans-0" style="display:none;">
												<c:forEach var="i" begin="0" end="${foods.size()-1}" step="1">
													<form action="${cp}/user/Basket.us" id="topMenu-${i}" style="margin: 0px 0 0rem 0;">
														<div style="position: relative;">
															<a class="question" id="que-0-${i}" style="text-decoration: none;  cursor: pointer;">
																<img src="${cp}/images/downarrow.png" style="height:2rem; cursor: pointer;position: absolute; right: 0; margin-top: 13px;">
																<div class="spotlight">
																	<div class="image fit">
																		<img src="${cp}/file/${foodFile.get(i).systemname}" style="margin-top: 44px;">
																	</div>
																	<div class="content">
																		<h3 class="title">${foods.get(i).foodname}</h3>
																		<p class="desc">${foods.get(i).foodtheme} / ${foods.get(i).foodname}</p>
																		<p class="price"><span id="price-${i}">${foods.get(i).foodprice}</span>원</p>
																	</div>
																</div>
															</a>
															<div class="answer" id="ans-0-${i}" style="display:none; height: 100%; background-color: rgb(234, 234, 234);">
																<div style="padding-left: 3rem; padding-bottom: 45px;">
																	<div>
																		<span style="font-size: 2.5rem;">가격</span><span style="font-size: 2.5rem; position: absolute; right: 0; margin-right: 44px;margin-top: 17px;"><span id="totalprice-${i}">${foods.get(i).foodprice}</span>원</span><br>
																	</div>
																	<c:choose>
																		<c:when test="${foodOptions.get(i).size() == 0}">
																			<hr style="width: 69rem;">
																			<input type="hidden" name="demo-radio-${i}">
																			<input type="hidden" name="demo-checkbox-${i}">
																		</c:when>
																		<c:otherwise>
																			<c:set var="option" value="${foodOptions.get(i).get(0).foodoption}"/>
																			<span style="font-size: 2rem;">${option}</span><br>
																			<div style="width: 50%">
																				<c:forEach var="j" begin="0" end="${foodOptions.get(i).size()-1}" step="1">
																					<c:if test="${option != foodOptions.get(i).get(j).foodoption}">
																						<c:set var="option" value="${foodOptions.get(i).get(j).foodoption}"/>
																						<span style="font-size: 2rem;">${option}</span><br>
																					</c:if>
																					<c:choose>
																						<c:when test="${foodOptions.get(i).get(j).isoverlap == false}">
																							<c:choose>
																								<c:when test="${j == 0}">
																									<input type="radio" id="radio-alpha-${i}${j}" value="${foodOptions.get(i).get(j).optionnum}" name="demo-radio-${i}" checked style="border-radius: 5px;" onclick="clickradio2(${i}, ${j})">
																									<label for="radio-alpha-${i}${j}">${foodOptions.get(i).get(j).optionname} (<span id="optionprice1-${i}${j}">${foodOptions.get(i).get(j).optionprice}</span>원)</label><br>
																									<input type="hidden" name="demo-checkbox-${i}">
																								</c:when>
																								<c:otherwise>
																									<input type="radio" id="radio-alpha-${i}${j}" value="${foodOptions.get(i).get(j).optionnum}" name="demo-radio-${i}" style="border-radius: 5px;" onclick="clickradio2(${i}, ${j})">
																									<label for="radio-alpha-${i}${j}">${foodOptions.get(i).get(j).optionname} (<span id="optionprice1-${i}${j}">${foodOptions.get(i).get(j).optionprice}</span>원)</label><br>
																									<input type="hidden" name="demo-radio-${i}">
																									<input type="hidden" name="demo-checkbox-${i}">
																								</c:otherwise>
																							</c:choose>																					
																						</c:when>
																						<c:otherwise>
																							<input type="checkbox" id="checkbox-beta-${i}${j}" value="${foodOptions.get(i).get(j).optionnum}" name="demo-checkbox-${i}" style="border-radius: 5px;" onclick="clickcheckbox2(${i}, ${j})">
																							<label for="checkbox-beta-${i}${j}" style="margin: 10px 0;">${foodOptions.get(i).get(j).optionname} (+<span id="optionprice2-${i}${j}">${foodOptions.get(i).get(j).optionprice}</span>원)</label><br>
																						</c:otherwise>
																					</c:choose>
																				</c:forEach>
																			</div>
																		</c:otherwise>
																	</c:choose>
																	<div style="width: 156px; text-align: center; border-radius: 30px; position: absolute; right: 0; margin: -16px 146px 0 0; background-color: white; box-shadow: inset 0 0 0 2px #2ac1bc; color: #2AC1BC !important; height: 3rem; font-size: 20px; line-height: 3.25rem; padding: 0 1.75rem; font-weight: 600;">
																		<a style="cursor: pointer" onclick="minuss(${i})"><img src="${cp}/images/minus.png" style="position: absolute; height: 2rem; left: 0px; margin: 9px 0 0 14px;"></a>
																			<span id="num-${i}">1</span>개
																		<a style="cursor: pointer" onclick="pluss(${i})"><img src="${cp}/images/plus.png" style="position: absolute; height: 2rem; right: 0px; margin: 9px 14px 0 0;"></a>
																	</div>
																	<a class="button" onclick="basketInn(${i})" style="position:absolute; right: 0; margin: -16px 39px 0 0;">담기</a>
																	<input type="hidden" name="storenum" value="${store.storenum}">
																	<input type="hidden" name="foodnum" value="${foods.get(i).foodnum}">
																	<input type="hidden" id="foodamount-${i}" name="foodamount" value="">
																	<input type="hidden" id="foodtotalprice-${i}" name="foodtotalprice" value="">
																	<input type="hidden" name="i" value="${i}">
																	<input type="hidden" name="path" value="all">
																</div>
															</div>
														</div>
													</form>
												</c:forEach>
											</div>
										</div>
										
										<c:forEach var="i" begin="0" end="${foodtheme.size()-1}" step="1">
											<div class="faq-content" style="width: 1399.99px; background-color: #F6F6F6; border-bottom: 4px solid #EAEAEA;">
												<span style="color: black; font-size: 1.5rem;">&ensp;&ensp;${foodtheme.get(i)}</span>
												<a class="question" id="que-${i+1}" style="text-decoration: none; ">
													<img src="${cp}/images/downarrow.png" style="float: right; height:2rem; cursor: pointer; margin-top: 16px;">
												</a>
												<div class="answer" id="ans-${i+1}" style="display:none;">
													<c:forEach var="j" begin="0" end="${foods.size()-1}" step="1">
														<c:if test="${foods.get(j).foodtheme == foodtheme.get(i)}">
															<form action="${cp}/user/Basket.us" id="topMenu--${j}" style="margin: 0px 0 0rem 0;">
																<div style="position: relative;">
																	<a class="question" id="que-${i+1}-${j}" style="text-decoration: none;  cursor: pointer;">
																		<img src="${cp}/images/downarrow.png" style="height:2rem; cursor: pointer;position: absolute; right: 0; margin-top: 13px;">
																		<div class="spotlight">
																			<div class="image fit">
																				<img src="${cp}/file/${foodFile.get(j).systemname}" style="margin-top: 44px;">
																			</div>
																			<div class="content">
																				<h3 class="title">${foods.get(j).foodname}</h3>
																				<p class="desc">${foods.get(j).foodtheme} / ${foods.get(j).foodname}</p>
																				<p class="price"><span id="price--${j}">${foods.get(j).foodprice}</span>원</p>
																			</div>
																		</div>
																	</a>
																	<div class="answer" id="ans-${i+1}-${j}" style="display:none; height: 100%; background-color: rgb(234, 234, 234);">
																		<div style="padding-left: 3rem; padding-bottom: 45px;">
																			<div>
																				<span style="font-size: 2.5rem;">가격</span><span style="font-size: 2.5rem; position: absolute; right: 0; margin-right: 44px;margin-top: 17px;"><span id="totalprice--${j}">${foods.get(j).foodprice}</span>원</span><br>
																			</div>
																			<c:choose>
																				<c:when test="${foodOptions.get(j).size() == 0}">
																					<hr style="width: 69rem;">
																					<input type="hidden" name="demo-radio--${j}">
																					<input type="hidden" name="demo-checkbox--${j}">
																				</c:when>
																				<c:otherwise>
																					<c:set var="option" value="${foodOptions.get(j).get(0).foodoption}"/>
																					<span style="font-size: 2rem;">${option}</span><br>
																					<div style="width: 50%">
																						<c:forEach var="k" begin="0" end="${foodOptions.get(j).size()-1}" step="1">
																							<c:if test="${option != foodOptions.get(j).get(k).foodoption}">
																								<c:set var="option" value="${foodOptions.get(j).get(k).foodoption}"/>
																								<span style="font-size: 2rem;">${option}</span><br>
																							</c:if>																						
																							<c:choose>
																								<c:when test="${foodOptions.get(j).get(k).isoverlap == false}">
																									<c:choose>
																										<c:when test="${k == 0}">
																											<input type="radio" id="radio-alpha-${i}${j}${k}" value="${foodOptions.get(j).get(k).optionnum}" name="demo-radio--${j}" checked style="border-radius: 5px;" onclick="clickradio3(${i}, ${j}, ${k})">
																											<label for="radio-alpha-${i}${j}${k}">${foodOptions.get(j).get(k).optionname} (<span id="optionprice1--${j}${k}">${foodOptions.get(j).get(k).optionprice}</span>원)</label><br>
																											<input type="hidden" name="demo-checkbox--${j}">
																										</c:when>
																										<c:otherwise>
																											<input type="radio" id="radio-alpha-${i}${j}${k}" value="${foodOptions.get(j).get(k).optionnum}" name="demo-radio--${j}" style="border-radius: 5px;" onclick="clickradio3(${i}, ${j}, ${k})">
																											<label for="radio-alpha-${i}${j}${k}">${foodOptions.get(j).get(k).optionname} (<span id="optionprice1--${j}${k}">${foodOptions.get(j).get(k).optionprice}</span>원)</label><br>
																											<input type="hidden" name="demo-checkbox--${j}">
																											<input type="hidden" name="demo-checkbox--${j}">
																										</c:otherwise>
																									</c:choose>
																								</c:when>
																								<c:otherwise>
																									<input type="checkbox" id="checkbox-beta-${i}${j}${k}" value="${foodOptions.get(j).get(k).optionnum}" name="demo-checkbox--${j}" style="border-radius: 5px;" onclick="clickcheckbox3(${i}, ${j}, ${k})">
																									<label for="checkbox-beta-${i}${j}${k}" style="margin: 10px 0;">${foodOptions.get(j).get(k).optionname} (+<span id="optionprice2--${j}${k}">${foodOptions.get(j).get(k).optionprice}</span>원)</label><br>
																									<input type="hidden" name="demo-radio--${j}">
																								</c:otherwise>
																							</c:choose>
																						</c:forEach>
																					</div>
																				</c:otherwise>
																			</c:choose>
																			<div style="width: 156px; text-align: center; border-radius: 30px; position: absolute; right: 0; margin: -16px 146px 0 0; background-color: white; box-shadow: inset 0 0 0 2px #2ac1bc; color: #2AC1BC !important; height: 3rem; font-size: 20px; line-height: 3.25rem; padding: 0 1.75rem; font-weight: 600;">
																				<a style="cursor: pointer" onclick="minusss(${i},${j})"><img src="${cp}/images/minus.png" style="position: absolute; height: 2rem; left: 0px; margin: 9px 0 0 14px;"></a>
																					<span id="num--${i}${j}">1</span>개
																				<a style="cursor: pointer" onclick="plusss(${i},${j})"><img src="${cp}/images/plus.png" style="position: absolute; height: 2rem; right: 0px; margin: 9px 14px 0 0;"></a>
																			</div>
																			<a class="button" onclick="basketInnn(${i},${j})" style="position:absolute; right: 0; margin: -16px 39px 0 0;">담기</a>
																			<input type="hidden" name="storenum" value="${store.storenum}">
																			<input type="hidden" name="foodnum" value="${foods.get(j).foodnum}">
																			<input type="hidden" id="foodamount--${j}" name="foodamount" value="">
																			<input type="hidden" id="foodtotalprice--${j}" name="foodtotalprice" value="">
																			<input type="hidden" name="i" value="${j}">
																			<input type="hidden" name="path" value="aa">
																		</div>
																	</div>
																</div>
															</form>
														</c:if>
													</c:forEach>
												</div>
											</div>
										</c:forEach>
										
										
										<div style="font-family: fantasy; font-size: smaller; padding: 20px;">
											<span style="font-weight: bolder;">유의사항</span>
											<ul>
												<li>메뉴 사진은 연출한 이미지로 실제 조리된 음식과 다를 수 있습니다.</li>
												<li>상단 메뉴 및 가격은 업소에서 제공한 정보를 기준으로 작성되었으며 변동될 수 있습니다.</li>
											</ul>
										</div>
									</div>
								</div>
								
								<!-- 정보 -->
								<div id="info" style="display: none;">
									<!-- 가게 정보 -->
									<div id="info" style="margin: 0;">
										<div class="wrapper style2" style="font-family: 'BMHANNAAir'; background-color: white; padding-top: 30px;">
											<header style="margin-left: 5%; margin-bottom: 4%;">
													<h3 style="font-weight: bolder;">가게 소개</h3>
													<h4 style="font-weight: lighter;">
														${store.storedetail}
													</h4>
											</header>
											<hr style="margin:0; border:0; height: 3px; background-color: #EAEAEA">
											<hr style="margin:0; border:0; height: 20px; background-color: #F6F6F6;">
											<header style="margin-left: 5%; margin-bottom: 4%; margin-top: 3%;">
													<h3 style="font-weight: bolder;">영업 정보</h3>
													<h4 style="font-weight: lighter;" class="tab">상호명&#9;&#9;&#9;${store.storename}</h4>
													<h4 style="font-weight: lighter;" class="tab">운영시간&#9;&#9;&#9;${store.storetime}</h4>
													<h4 style="font-weight: lighter;" class="tab">전화번호&#9;&#9;&#9;${store.storephone}<br></h4>
													<h4 style="font-weight: lighter;" class="tab">배달지역&#9;&#9;&#9;${store.deliverok}</h4>
											</header>
											<hr style="margin:0; border:0; height: 3px; background-color: #EAEAEA">
											<hr style="margin:0; border:0; height: 20px; background-color: #F6F6F6;">
											<header style="margin-left: 5%; margin-bottom: 4%; margin-top: 3%">
													<h3 style="font-weight: bolder;">가게 통계</h3>
													<h4 style="font-weight: lighter;" class="tab">최근 주문수&#9;&#9;${ordercnt}</h4>
													<h4 style="font-weight: lighter;" class="tab">전체 리뷰수&#9;&#9;${reviewcnt}</h4>
													<h4 style="font-weight: lighter;" class="tab">찜&#9;&#9;&#9;${store.likecnt}</h4>
											</header>
											<hr style="margin:0; border:0; height: 3px; background-color: #EAEAEA">
											<hr style="margin:0; border:0; height: 20px; background-color: #F6F6F6;">
											<header style="margin-left: 5%; margin-bottom: -7%; margin-top: 3%">
												<h3 style="font-weight: bolder;">사업자 정보</h3>
												<h4 style="font-weight: lighter;" class="tab">대표자명&#9;&#9;&#9;${store.ownername}</h4>
												<h4 style="font-weight: lighter;" class="tab">상호명&#9;&#9;&#9;<span id="name">${store.storename}</span></h4>
												<h4 style="font-weight: lighter;" class="tab">사업자주소&#9;&#9;&#9;<span id="addr">${store.addr} ${store.addrdetail} ${store.addretc}</span></h4>
												<h4 style="font-weight: lighter;" class="tab">사업자번호&#9;&#9;&#9;${store.storenum}<br></h4>
												<div id="map" style="width:830px;height:450px; font-family: none;"></div>
											</header>
										</div>
									</div>
								</div>
								
								<!-- 리뷰메뉴 -->
								<div id="review" style="display: none;">
									<div id="info" style="margin: 0;">
										<div class="wrapper style2" style="font-family: 'BMHANNAAir'; background-color: white; padding-top: 4%;">
											<div style="display: inline-flex; position: relative; width: 1400px; margin-bottom: -20%;">
												<header style="margin-left: 5%; margin-bottom: 2%;">
													<div style="margin-left: 19%; margin-top: 19px;">
														<h1 style="font-weight: lighter;">${store.starcnt}</h1>
														<p class="tab" style="color: #F8C802; margin:0; font-family: 'BMJUA'">
															<div class="review" style="margin-top: -28%; margin-left: -4%;">
																<div class="rating" data-rate="${store.starcnt}">
																	<div class="star-wrap"><div class="star"><i class="fas fa-star"></i></div></div>
																	<div class="star-wrap"><div class="star"><i class="fas fa-star"></i></div></div>
																	<div class="star-wrap"><div class="star"><i class="fas fa-star"></i></div></div>
																	<div class="star-wrap"><div class="star"><i class="fas fa-star"></i></div></div>
																	<div class="star-wrap"><div class="star"><i class="fas fa-star"></i></div></div>
																</div>
															</div>
														</p>
													</div>
													<div style="position: relative; bottom: 216px; left: 276px; padding-left: 38px;">
														<p class="tab" style="font-size: 20px; font-weight: bolder; margin:0;">5점&#9;<progress value="${starcnts[4]}" max="${reviewcnt}" style="position: relative; top: 7px; margin:-5"></progress> <span style="font-weight: lighter; color: #9D9D9D;"> ${starcnts[4]}</span></p>
														<p class="tab" style="font-size: 20px; font-weight: bolder; margin:0;">4점&#9;<progress value="${starcnts[3]}" max="${reviewcnt}" style="position: relative; top: 7px;"></progress> <span style="font-weight: lighter; color: #9D9D9D;"> ${starcnts[3]}</span></p>
														<p class="tab" style="font-size: 20px; font-weight: bolder; margin:0;">3점&#9;<progress value="${starcnts[2]}" max="${reviewcnt}" style="position: relative; top: 7px;"></progress> <span style="font-weight: lighter; color: #9D9D9D;"> ${starcnts[2]}</span></p>
														<p class="tab" style="font-size: 20px; font-weight: bolder; margin:0;">2점&#9;<progress value="${starcnts[1]}" max="${reviewcnt}" style="position: relative; top: 7px;"></progress> <span style="font-weight: lighter; color: #9D9D9D;"> ${starcnts[1]}</span></p>
														<p class="tab" style="font-size: 20px; font-weight: bolder; margin:0;">1점&#9;<progress value="${starcnts[0]}" max="${reviewcnt}" style="position: relative; top: 7px;"></progress> <span style="font-weight: lighter; color: #9D9D9D;"> ${starcnts[0]}</span></p>
													</div>
												</header>
												<header style="position: absolute; right: 182px; top: 35px;">
													<h2 style="font-weight: bolder;">최근 리뷰 ${reviewcnt}개</h2>
													<a class="new" onclick="clicknew('${loginUser.userid}');">최신순</a>
													<a class="starhigh" onclick="clickhigh('${loginUser.userid}');">별점높은순</a>
													<a class="starlow" onclick="clicklow('${loginUser.userid}');">별점낮은순</a>
												</header>
											</div>
											
											<br>
											<br>
											<br>	
											<hr>
											<c:choose>
												<c:when test="${storereview.size() == 0}">
													<div style="width: 25%; margin: 0 auto;">
														<img src="${cp}/images/오토바이 배민.jpg" style="margin-top: 130px;">
														<div style="text-align: center; font-size: 2em;color: #9D9D9D;">리뷰가 없어요</div>
													</div>
												</c:when>
												<c:otherwise>
													<div style="margin-bottom: -6%;">
														<c:forEach var="i" begin="0" end="${storereview.size()-1}" step="1">
															<div style="width:1025px; margin: 0 auto; position: relative;">
																<h3 class="nickname${i}" style="margin: 0;">${reviewuser.get(i).usernickname}</h3>
																<p class="tab" style="color: #F8C802;margin-top: -6rem;; font-family: 'BMJUA'">&nbsp;
																	<div class="review">
																		<div class="rating" id="rating${i}" data-rate="${storereview.get(i).starcnt}">
																			<div class="star-wrap"><div class="star"><i class="fas fa-star"></i></div></div>
																			<div class="star-wrap"><div class="star"><i class="fas fa-star"></i></div></div>
																			<div class="star-wrap"><div class="star"><i class="fas fa-star"></i></div></div>
																			<div class="star-wrap"><div class="star"><i class="fas fa-star"></i></div></div>
																			<div class="star-wrap"><div class="star"><i class="fas fa-star"></i></div></div>
																		</div>
																	</div>
																	<div style="margin-top: -26px;">
																		<span class="starcnt${i}">${storereview.get(i).starcnt}점</span> <span class="regdate${i}" style="color: #9D9D9D;"> ${storereview.get(i).regdate.substring(0,10)}</span>
																	</div>
																</p>
																<p class="contents${i}" style="font-size: 20px; margin-top: -34px;">${storereview.get(i).reviewcontents}</p>
																<span style="position: absolute; right: 0; bottom: 2px;">
																	<a class="aaa${i}" href="${cp}/user/MyReview.us" style="color: #9D9D9D; cursor: pointer;">
																		${storereview.get(i).userid == loginUser.userid?'내 리뷰 관리':''}
																	</a>
																</span>
																<hr>
															</div>
														</c:forEach>
													</div>
												</c:otherwise>
											</c:choose>
											
										</div>
									</div>
								</div>
								
							</td>
						</tr>
					</tbody>
				</table>
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
			
<!-- Scripts -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>let cp = "${pageContext.request.contextPath}";</script>
<script src="${cp}/assets/js/jquery.min.js"></script>
<script src="${cp}/assets/js/jquery.scrollex.min.js"></script>
<script src="${cp}/assets/js/jquery.scrolly.min.js"></script>
<script src="${cp}/assets/js/browser.min.js"></script>
<script src="${cp}/assets/js/breakpoints.min.js"></script>
<script src="${cp}/assets/js/util.js"></script>
<script src="${cp}/assets/js/main.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=25f71cd0e07d290e2811d39ddb7dd18e&libraries=services"></script>
<script>
	function clickmenu1() {
		$("#menu1").css("display","contents");
		$(".clickmenu1").css("border-top-color","black");
		$(".clickmenu1").css("border-bottom-width","0");
		$(".clickmenu1").css("font-weight","bolder");
		$("#info").css("display","none");
		$(".clickinfo").css("border-top-color","rgba(144, 144, 144, 0.25)");
		$(".clickinfo").css("border-bottom-width","1px");
		$(".clickinfo").css("font-weight","normal");
		$("#review").css("display","none");
		$(".clickreview").css("border-top-color","rgba(144, 144, 144, 0.25)");
		$(".clickreview").css("border-bottom-width","1px");
		$(".clickreview").css("font-weight","normal");
	}
	function clickinfo() {
		$("#menu1").css("display","none");
		$(".clickmenu1").css("border-top-color","rgba(144, 144, 144, 0.25)");
		$(".clickmenu1").css("border-bottom-width","1px");
		$(".clickmenu1").css("font-weight","normal");
		$("#info").css("display","contents");
		$(".clickinfo").css("border-top-color","black");
		$(".clickinfo").css("border-bottom-width","0");
		$(".clickinfo").css("font-weight","bolder");
		$("#review").css("display","none");
		$(".clickreview").css("border-top-color","rgba(144, 144, 144, 0.25)");
		$(".clickreview").css("border-bottom-width","1px");
		$(".clickreview").css("font-weight","normal");
	
		
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };  
	
		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption); 
	
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();
	
		// 주소로 좌표를 검색합니다
		geocoder.addressSearch($("#addr").text(), function(result, status) {
	
		    // 정상적으로 검색이 완료됐으면 
		     if (status === kakao.maps.services.Status.OK) {
	
		        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	
		        // 결과값으로 받은 위치를 마커로 표시합니다
		        var marker = new kakao.maps.Marker({
		            map: map,
		            position: coords
		        });
		        
		        kakao.maps.event.addListener(marker, 'click', function() {
		        	window.open('https://map.kakao.com/link/search/'+$("#addr").text());
			    });
	
		        // 인포윈도우로 장소에 대한 설명을 표시합니다
		        var infowindow = new kakao.maps.InfoWindow({
		            content: '<div style="width:150px;text-align:center;padding:6px 0;">'+$("#name").text()+'</div>'
		        });
		        infowindow.open(map, marker);
	
		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
		    } 
		});
		
		map.relayout();
		
	}
	function clickreview() {
		$("#menu1").css("display","none");
		$(".clickmenu1").css("border-top-color","rgba(144, 144, 144, 0.25)");
		$(".clickmenu1").css("border-bottom-width","1px");
		$(".clickmenu1").css("font-weight","normal");
		$("#info").css("display","none");
		$(".clickinfo").css("border-top-color","rgba(144, 144, 144, 0.25)");
		$(".clickinfo").css("border-bottom-width","1px");
		$(".clickinfo").css("font-weight","normal");
		$("#review").css("display","contents");
		$(".clickreview").css("border-top-color","black");
		$(".clickreview").css("border-bottom-width","0");
		$(".clickreview").css("font-weight","bolder");
	}
	
	function clicknew(userid) {
		$(".new").css("color","black");
		$(".starhigh").css("color","#9D9D9D");
		$(".starlow").css("color","#9D9D9D");
		$(".new").css("font-weight","bolder");
		$(".starhigh").css("font-weight","lighter");
		$(".starlow").css("font-weight","lighter");
		
		$.ajax({
	        url : cp+"/store/ShowReview.st?pa=new&sn="+${store.storenum}, // test.jsp 에서 받아옴
	        type : "GET",
	        dataType : "json",
	        success : function(data) {
	        	for(var i = 0; i < data.length; i++) {
	        		$('.nickname'+i).text(data[i].usernickname);
	        		$('#rating'+i).attr("data-rate",data[i].starcnt);
	        		$('.starcnt'+i).text(data[i].starcnt+"점");
	        		$('.regdate'+i).text(data[i].regdate.substring(0,10));
	        		$('.contents'+i).text(data[i].reviewcontents);
	        		if(data[i].userid == userid) {
	        			$('.aaa'+i).text("내 리뷰 관리");
	        		} else {
	        			$('.aaa'+i).text("");
	        		}
	        		
	        	}
	        	
				var rating = $('.rating');
	        	
	        	rating.each(function() {
	        		var $this = $(this);
	        		for (var i = 0; i < 5; i++) {
						$this.find('.star').eq(i).css({width:"0%"});
					}
	        		var targetScore = $this.attr('data-rate');
	        		var firstdigit = targetScore.split('.');
	        		if(firstdigit.length > 1) {
	        			for(var i = 0; i < targetScore[0]; i++) {
	        				$this.find('.star').eq(i).css({width:'100%'});
	        			}
	        			$this.find('.star').eq(firstdigit[0]).css({width:firstdigit[1]+'0%'});
	        		} else {
	        			console.log(targetScore);
	        			for(var i = 0; i < targetScore; i++) {
	        				$this.find('.star').eq(i).css({width:'100%'});
	        			}
	        		}
	        	})
	        },
	        error : function(e) {
	            console.log(e.responseText);
	        }
	    });
		
		
	}
	function clickhigh(userid) {
		$(".new").css("color","#9D9D9D");
		$(".starhigh").css("color","black");
		$(".starlow").css("color","#9D9D9D");
		$(".new").css("font-weight","lighter");
		$(".starhigh").css("font-weight","bolder");
		$(".starlow").css("font-weight","lighter");
		
		$.ajax({
	        url : cp+"/store/ShowReview.st?pa=high&sn="+${store.storenum}, // test.jsp 에서 받아옴
	        type : "GET",
	        dataType : "json",
	        success : function(data) {
	        	console.log(userid);
	        	for(var i = 0; i < data.length; i++) {
	        		$('.nickname'+i).text(data[i].usernickname);
	        		$('#rating'+i).attr("data-rate",data[i].starcnt);
	        		$('.starcnt'+i).text(data[i].starcnt+"점");
	        		$('.regdate'+i).text(data[i].regdate.substring(0,10));
	        		$('.contents'+i).text(data[i].reviewcontents);
	        		if(data[i].userid == userid) {
	        			$('.aaa'+i).text("내 리뷰 관리");
	        		} else {
	        			$('.aaa'+i).text("");
	        		}
	        	}
	        	
	        	var rating = $('.rating');
	        	
	        	rating.each(function() {
	        		var $this = $(this);
	        		for (var i = 0; i < 5; i++) {
						$this.find('.star').eq(i).css({width:"0%"});
					}
	        		var targetScore = $this.attr('data-rate');
	        		var firstdigit = targetScore.split('.');
	        		if(firstdigit.length > 1) {
	        			for(var i = 0; i < targetScore[0]; i++) {
	        				$this.find('.star').eq(i).css({width:'100%'});
	        			}
	        			$this.find('.star').eq(firstdigit[0]).css({width:firstdigit[1]+'0%'});
	        		} else {
	        			console.log(targetScore);
	        			for(var i = 0; i < targetScore; i++) {
	        				$this.find('.star').eq(i).css({width:'100%'});
	        			}
	        		}
	        	})
	        },
	        error : function(e) {
	            console.log(e.responseText);
	        }
	    });
		
		
	}
	function clicklow(userid) {
		$(".new").css("color","#9D9D9D");
		$(".starhigh").css("color","#9D9D9D");
		$(".starlow").css("color","black");
		$(".new").css("font-weight","lighter");
		$(".starhigh").css("font-weight","lighter");
		$(".starlow").css("font-weight","bolder");
		
		$.ajax({
	        url : cp+"/store/ShowReview.st?pa=low&sn="+${store.storenum}, // test.jsp 에서 받아옴
	        type : "GET",
	        dataType : "json",
	        success : function(data) {
	        	console.log(userid);
	        	for(var i = 0; i < data.length; i++) {
	        		$('.nickname'+i).text(data[i].usernickname);
	        		$('#rating'+i).attr("data-rate",data[i].starcnt);
	        		$('.starcnt'+i).text(data[i].starcnt+"점");
	        		$('.regdate'+i).text(data[i].regdate.substring(0,10));
	        		$('.contents'+i).text(data[i].reviewcontents);
	        		if(data[i].userid == userid) {
	        			$('.aaa'+i).text("내 리뷰 관리");
	        		} else {
	        			$('.aaa'+i).text("");
	        		}
	        	}
	        		
	       		var rating = $('.rating');
	           	
	           	rating.each(function() {
	           		var $this = $(this);
	           		for (var i = 0; i < 5; i++) {
							$this.find('.star').eq(i).css({width:"0%"});
						}
	           		var targetScore = $this.attr('data-rate');
	           		var firstdigit = targetScore.split('.');
	           		if(firstdigit.length > 1) {
	           			for(var i = 0; i < targetScore[0]; i++) {
	           				$this.find('.star').eq(i).css({width:'100%'});
	           			}
	           			$this.find('.star').eq(firstdigit[0]).css({width:firstdigit[1]+'0%'});
	           		} else {
	           			console.log(targetScore);
	           			for(var i = 0; i < targetScore; i++) {
	           				$this.find('.star').eq(i).css({width:'100%'});
	           			}
	           		}
	           	})
	      	},
	        error : function(e) {
	            console.log(e.responseText);
	        }
	    });
		
		
	}
	
	function clickheart() {
		if(${loginUser == null}) {
			alert("로그인 후 찜하기를 할 수 있습니다.");
		} else {
			if($(".heart").attr("src") == "${cp}/images/redheart.png") {
				$(".heart").attr("src","${cp}/images/blackheart.png");
				// 찜 취소
				const xhr = new XMLHttpRequest();
				
				xhr.open("GET",cp+"/store/StoreLike.st?li=cancel&sn="+${store.storenum},true);
				xhr.onreadystatechange = function(){
					if(xhr.readyState == 4){
						if(xhr.status == 200){
							let txt = xhr.responseText;
							txt = txt.trim();
							
							$(".likecnt").text("찜 "+txt);
						}
					}	
				}
				xhr.send();
			} else {
				$(".heart").attr("src","${cp}/images/redheart.png");
				// 찜 성공
				const xhr = new XMLHttpRequest();
				
				xhr.open("GET",cp+"/store/StoreLike.st?li=do&sn="+${store.storenum},true);
				xhr.onreadystatechange = function(){
					if(xhr.readyState == 4){
						if(xhr.status == 200){
							let txt = xhr.responseText;
							txt = txt.trim();
							
							$(".likecnt").text("찜 "+txt);
						}
					}	
				}
				xhr.send();
			}
		}
	}
	
	function clickradio1(i, j) {
		if($("#optionprice1"+i+j).text() != 0) {
			$("#totalprice"+i).text($("#optionprice1"+i+j).text());
			$("#num"+i).text(1);
			$("#price"+i).text($("#optionprice1"+i+j).text());
			$('#checkbox-beta'+i+j).attr("checked", false);
		}
	}
	
	function clickcheckbox1(i, j) {
		let totalprice = parseInt($("#totalprice"+i).text());
		let optionprice = parseInt($("#optionprice2"+i+j).text());
		let price = parseInt(parseInt($("#price"+i).text()))
		let num = parseInt($("#num"+i).text());
		
		if($('#checkbox-beta'+i+j).is(':checked')) {
			if($("#optionprice2"+i+j).text() != 0) {
				$("#totalprice"+i).text(totalprice + (optionprice * num));
				$("#price"+i).text(price + (optionprice));
			}
		} else {
			if($("#optionprice2"+i+j).text() != 0) {
				$("#totalprice"+i).text(totalprice - (optionprice * num));
				$("#price"+i).text(price - (optionprice));
			}
		}
	}
	
	function clickradio2(i, j) {
		if($("#optionprice1-"+i+j).text() != 0) {
			$("#totalprice-"+i).text($("#optionprice1-"+i+j).text());
			$("#num-"+i).text(1);
			$("#price-"+i).text($("#optionprice1-"+i+j).text());
			$('#checkbox-beta-'+i+j).attr("checked", false);
		}
	}
	
	function clickcheckbox2(i, j) {
		let totalprice = parseInt($("#totalprice-"+i).text());
		let optionprice = parseInt($("#optionprice2-"+i+j).text());
		let price = parseInt(parseInt($("#price-"+i).text()))
		let num = parseInt($("#num-"+i).text());
		
		if($('#checkbox-beta-'+i+j).is(':checked')) {
			if($("#optionprice2-"+i+j).text() != 0) {
				$("#totalprice-"+i).text(totalprice + (optionprice * num));
				$("#price-"+i).text(price + (optionprice));
			}
		} else {
			if($("#optionprice2-"+i+j).text() != 0) {
				$("#totalprice-"+i).text(totalprice - (optionprice * num));
				$("#price-"+i).text(price - (optionprice));
			}
		}
	}
	
	function clickradio3(i, j, k) {
		if($("#optionprice1--"+j+k).text() != 0) {
			$("#totalprice--"+j).text($("#optionprice1--"+j+k).text());
			$("#num--"+i+j).text(1);
			$("#price--"+j).text($("#optionprice1--"+j+k).text());
			$('#checkbox-beta-'+i+j+k).attr("checked", false);
		}
	}
	
	function clickcheckbox3(i, j, k) {
		let totalprice = parseInt($("#totalprice--"+j).text());
		let optionprice = parseInt($("#optionprice2--"+j+k).text());
		let price = parseInt(parseInt($("#price--"+j).text()))
		let num = parseInt($("#num--"+i+j).text());
		
		if($('#checkbox-beta-'+i+j+k).is(':checked')) {
			if($("#optionprice2--"+j+k).text() != 0) {
				$("#totalprice--"+j).text(totalprice + (optionprice * num));
				$("#price--"+j).text(price + (optionprice));
			}
		} else {
			if($("#optionprice2--"+j+k).text() != 0) {
				$("#totalprice--"+j).text(totalprice - (optionprice * num));
				$("#price--"+j).text(price - (optionprice));
			}
		}
	}
	
	function minus(i) {
		if($("#num"+i).text() == 1) {
			
		} else {
			$("#num"+i).text(parseInt($("#num"+i).text()) - 1);
			$("#totalprice"+i).text(parseInt($("#totalprice"+i).text()) - parseInt($("#price"+i).text()));
		}
	}
	
	function plus(i) {
		if($("#num"+i).text() > 9) {
			
		} else {
			$("#num"+i).text(parseInt($("#num"+i).text()) + 1);
			$("#totalprice"+i).text(parseInt($("#totalprice"+i).text()) + parseInt($("#price"+i).text()));
		}
	}
	
	function minuss(i) {
		if($("#num-"+i).text() == 1) {
			
		} else {
			$("#num-"+i).text(parseInt($("#num-"+i).text()) - 1);
			$("#totalprice-"+i).text(parseInt($("#totalprice-"+i).text()) - parseInt($("#price-"+i).text()));
		}
	}
	
	function pluss(i) {
		if($("#num-"+i).text() > 9) {
			
		} else {
			$("#num-"+i).text(parseInt($("#num-"+i).text()) + 1);
			$("#totalprice-"+i).text(parseInt($("#totalprice-"+i).text()) + parseInt($("#price-"+i).text()));
		}
	}
	
	function minusss(i, j) {
		if($("#num--"+i+j).text() == 1) {
			
		} else {
			$("#num--"+i+j).text(parseInt($("#num--"+i+j).text()) - 1);
			$("#totalprice--"+j).text(parseInt($("#totalprice--"+j).text()) - parseInt($("#price--"+j).text()));
		}
	}
	
	function plusss(i, j) {
		if($("#num--"+i+j).text() > 9) {
			
		} else {
			$("#num--"+i+j).text(parseInt($("#num--"+i+j).text()) + 1);
			$("#totalprice--"+j).text(parseInt($("#totalprice--"+j).text()) + parseInt($("#price--"+j).text()));
		}
	}
	
	function basketIn(i) {
		if(${loginUser == null}) {
			alert("로그인 후 담기가 가능합니다.");
		} else {
			$("#foodamount"+i).val($("#num"+i).text());
			$("#foodtotalprice"+i).val($("#totalprice"+i).text());
			$("#topMenu"+i).submit();
		}
	}
	
	function basketInn(i) {
		if(${loginUser == null}) {
			alert("로그인 후 담기가 가능합니다.");
		} else {
			$("#foodamount-"+i).val($("#num-"+i).text());
			$("#foodtotalprice-"+i).val($("#totalprice-"+i).text());
			$("#topMenu-"+i).submit();
		}
	}
	
	function basketInnn(i, j) {
		if(${loginUser == null}) {
			alert("로그인 후 담기가 가능합니다.");
		} else {
			$("#foodamount--"+j).val($("#num--"+i+j).text());
			$("#foodtotalprice--"+j).val($("#totalprice--"+j).text());
			$("#topMenu--"+j).submit();
		}
	}
	
	function clickcall() {
		alert("전화번호 : "+"${store.storephone}");
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
	
	
	// 별점
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
</body>
</html>