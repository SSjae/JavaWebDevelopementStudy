<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Gugudan</title>
</head>
<body>
	<hr>
	<form name="myForm" onsubmit="return sendit();">
		<c:choose>
			<c:when test="${empty param.dan}">
				<!-- 처음 시작했을 때 -->
				<!-- 단을 입력할 수 있는 인풋창, 제출버튼 -->
				단 <input type="text" name="dan"><br>
				<input type="submit">
			</c:when>
			<c:otherwise>
				<!-- 무언가를 입력해서 submit 했을 때 -->
				<!-- 그 때의 단으로 구구단 출력하기 -->
				<!-- 0이하거나 100 초과이면 메세지 출력 -->
				<c:set var="dan" value="${param.dan }"/>
				<c:choose>
					<c:when test="${dan>=1 and dan<=100}">
						<!-- 제대로 입력했을 때 -->
						<c:forEach var="i" begin="1" end="9" step="1">
							${dan} × ${i} = ${dan*i}<br>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<!-- 잘못된 입력일 때 -->
						1 이상 100 이하의 숫자를 입력하세요!
					</c:otherwise>
				</c:choose>
				<hr>
				<input type="button" value="홈으로 돌아가기" onclick="history.go(-1);">
			</c:otherwise>
		</c:choose>
	</form>
</body>
<script>
	function sendit() {
		let dan = document.myForm.dan;
		if(dan == "") {
			alert("단을 입력하세요!")
			return false;
		}
		if(isNaN(dan)) {
			alert("숫자를 입력해주세요!");
			return false;
		}
		return true;
	}
</script>
</html>