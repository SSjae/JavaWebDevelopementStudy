<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 수정</title>
<style>
	body{
		background-color:#fff;
	}
	table{
		border:0px;
		width:900px;
	}
	#wrap{
		width:1000px;
		margin:0 auto;
	}
	.title h3{
		font-size:1.5em;
		color:rgb(0,200,80);
		text-shadow:0 0 4px deepskyblue;
	}
	a{
		display:inline-block;
		border-radius:3px;
		background-color:rgb(0,200,80);
		color:#fff;
		font-weight: bold;
		text-decoration: none;
	}
	.header_area a{
		width:100px;
		padding:10px;
		text-align:center;
	}
	.header_area span{
		font-weight:bold;
	}
	.btn_area a{
		text-align:center;
		padding:10px;
		width:100px;
	}
	.finput{
		position:absolute;
		left:-9999px;
		width:1px;
		height:1px;
		padding:0;
		margin:-1px;
	}
	input[type=hidden]+label{
		display:inline-block;
		border-radius:3px;
		background-color:rgb(0,200,80);
		color:#fff;
		font-weight: bold;
		text-decoration: none;
		padding:5px;
		margin-left:10px;
	}
</style>
</head>
<body>
	<c:if test="${loginUser == null}">
		<script>
			alert("로그인 후 이용하세요!");
			location.replace("${pageContext.request.contextPath}/user/UserLogin.us");
		</script>
	</c:if>
	<c:set var="cp" value="${pageContext.request.contextPath}"/>
	<div id="wrap">
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
		</table>

		<form method="post" name="boardForm" action="${cp}/board/BoardModifyOk.bo" enctype="multipart/form-data">
			<input type="hidden" name="boardnum" value="${board.boardnum }">
			<input type="hidden" name="keyword" value="${param.keyword}">
			<input type="hidden" name="page" value="${param.page}">
			<!-- 게시글 작성하는 인풋들 배치 테이블 -->
			<table border="1" style="border-collapse:collapse;">
				<tr height="30px">
					<th align="center" width="150px">
						제 목
					</th>
					<td>
						<input name="boardtitle" size="50" maxlength="100" value="${board.boardtitle }">
					</td>
				</tr>
				<tr height="30px">
					<th align="center" width="150px">
						글쓴이
					</th>
					<td>
						<input name="userid" size="10" maxlength="20" readonly value="${board.userid }">
					</td>
				</tr>
				<tr height="300px">
					<th align="center" width="150px">
						내 용
					</th>
					<td>
						<textarea name="boardcontents" style="width:700px;height:250px;resize:none;">${board.boardcontents}</textarea>					
					</td>
				</tr>
				<c:forEach var="i" begin="0" end="1">
					<tr>
						<th>첨부파일${i+1}</th>
						<td>
							<c:choose>
								<c:when test="${i<files.size()}">
									<span class="filename" id="file${i+1}">${files[i].orgname}</span>
									<input type="hidden" name="filename" value="${files[i].orgname}">
								</c:when>
								<c:otherwise>
									<span class="filename" id="file${i+1}"></span>
									<input type="hidden" name="filename">
								</c:otherwise>
							</c:choose>
							<label for="fileInput${i+1}">첨부하기</label>
							<input type="file" class="finput" id="fileInput${i+1}" name="file${i+1}">
						</td>
					</tr>
				</c:forEach>
			</table>
			<br>
			<table class="btn_area">
				<tr align="right" valign="middle">
					<td>
						<a href="javascript:document.boardForm.submit()">수정완료</a>&nbsp;&nbsp;
						<a href="${cp}/board/BoardList.bo?page=${param.page}&keyword=${param.keyword}">목록</a>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(".finput").change(function(e){
		//$(this) : 내가 클릭한 첨부하기 버튼을 통해 눌리는 type=file 태그
		let filename = e.target.files[0].name;
		$(this).prev().prev().prev().text(filename);
		$(this).prev().prev().val(filename);
	})


</script>
</html>
