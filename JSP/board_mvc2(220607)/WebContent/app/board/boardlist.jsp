<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 목록</title>
<style>
	body{
		background-color:#fff;
	}
	table{
		border:0px;
		width:900px;
	}
	.title h3{
		font-size:1.5em;
		color:rgb(0,200,80);
		text-shadow:0 0 4px deepskyblue;
	}
	.list{
		border-collapse:collapse;
		border-spacing:0;
		width:900px;
	}
	.list>tbody>tr:nth-child(2n){
		background-color:rgb(240,255,240);
	}
	.list>tbody>tr:nth-child(n+2):hover{
		background-color:rgb(239,233,252);
	}
	.list>tbody>tr>th{
		border-top:1px solid #384d75;
		border-bottom:1px solid #ccc;
		padding:5px;
	}
	
	.list>tbody>tr>td{
		border-bottom:1px solid #ccc;
		padding:5px;
	}
	a{
		display:inline-block;
		border-radius:3px;
		background-color:rgb(0,200,80);
		color:#fff;
		font-weight: bold;
		text-decoration: none;
	}
	.list a{
		background-color: transparent;
		color:#424242;
		
	}
	.header_area a{
		width:100px;
		padding:10px;
		text-align:center;
	}
	.header_area span{
		font-weight:bold;
	}
	.pagination a{
		padding:5px;
		width:20px;
		height:20px;
	}
	.pagination a:hover{
		background-color:rgb(198,175,245);
	}
	.nowPage{
		padding:5px;
		display:inline-block;
		border-radius:3px;
		background-color:rgb(198,175,245);
		color:#fff;
		font-weight: bold;
		width:20px;
		height:20px;
	}
	a.write{
	padding:5px;
		width:70px;
		height:25px;
		text-align: center;
	}
</style>
</head>
<body>
	<c:set var="cp" value="${pageContext.request.contextPath}"></c:set>
	<c:if test="${loginUser == null }">
		<script>
			alert("로그인 후 이용하세요!");
			location.replace("${pageContext.request.contextPath}/user/UserLogin.us");
		</script>
	</c:if>
	<div style="margin:0 auto; width:1000px;">
		<!-- 로그아웃 버튼 배치할 테이블 -->
		<table class="header_area">
			<tr align="right" valign="middle">
				<td>
					<span>${loginUser.username}님 환영합니다.</span>&nbsp;&nbsp;
					<a href="${cp}/user/UserLogoutOk.us">로그아웃</a>
				</td>			
			</tr>
		</table>

		<!-- 타이틀과 글 개수 띄워주는 테이블 -->
		<table class="title">
			<tr align="center" valign="middle">
				<td><h3>MVC 게시판</h3></td>
			</tr>
			<tr align="right" valign="middle">
				<td>글 개수 : ${totalCnt}</td>
			</tr>
		</table>

		<!-- 게시글 리스트 띄우는 테이블 -->
		<table class="list">
			<tr align="center" valign="middle">
				<th width="8%">번호</th>
				<th width="50%">제목</th>
				<th width="15%">작성자</th>
				<th width="17%">날짜</th>
				<th width="10%">조회수</th>
			</tr>
			
			<c:choose>
				<c:when test="${boardList != null and boardList.size()>0}">
					<c:forEach items="${boardList}" var="board">
						<tr>
							<td>${board.boardnum}</td>
							<td>${board.boardtitle}</td>
							<td>${board.userid}</td>
							<td>${board.regdate}</td>
							<td>${board.readcount}</td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="5" style="text-align: center; font-size: 20px">
							등록된 게시글이 없습니다.
						</td>
					</tr>				
				</c:otherwise>
			</c:choose>
		</table><br>

		<!-- 페이징 처리하는 테이블 -->
		<table class="pagination">
			<tr align="center" valign="middle">
				<td>
					<c:if test="${startPage != 1}">
						<a href="${cp}/board/BoardList.bo?page=${startPage-1}">&lt;</a>				
					</c:if>
					<c:forEach begin="${startPage}" end="${endPage}" step="1" var="i">
						<c:choose>
							<c:when test="${page == i }">
								<span class="nowPage">${i}</span>
							</c:when>
							<c:otherwise>
								<a href="${cp}/board/BoardList.bo?page=${i}">${i}</a>							
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:if test="${endPage != totalPage}">
						<a href="${cp}/board/BoardList.bo?page=${endPage+1}">&gt;</a>
					</c:if>
				</td>
			</tr>
		</table>
		
		<!-- 글쓰기 버튼 배치하는 테이블 -->
		<table style="border:0px; width:900px;">
			<tr align="right" valign="middle">
				<td><a class="write" href="#">글쓰기</a></td>
			</tr>
		</table>
		<div class="search_area">
			<input type="search" id="q" name="q"> <input type="button" value="검색" onclick="search()">
		</div>
	</div>
</body>
</html>