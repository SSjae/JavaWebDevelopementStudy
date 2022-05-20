<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>formInput</title>
</head>
<body>
	<!-- onsubmit에 return true일때만 제출이 된다. return false이면 제출이 절대로 안된다.
	그래서 JS로 return 함수명(); 해서 유호성 검사를 통해 true, false를 반환하게 함수를 만들면 된다. -->
	<form name="joinForm" action="join_db.jsp" method="post" onsubmit="return sendit();">
		<fieldset>
			<legend>회원가입</legend>
			<input type="text" placeholder="아이디를 입력하세요." name="userid">
			<input type="password" placeholder="비밀번호를 입력하세요." name="userpw"><br>
			<input type="text" placeholder="이름을 입력하세요." name="username">
			<input type="submit" value="가입하기">
		</fieldset>
	</form>
</body>
<script>
	const joinForm = document.joinForm; 

	function sendit() {
		const userid = joinForm.userid;
		if(userid.value == "") {
			alert("아이디를 입력하세요!");
			userid.focus();
			// userid.style.borderColor = "red";
			return false;
		}
		if(userid.value.length < 5 || userid.value.length > 12) {
			alert("아이디는 5자 이상 12자 이하로 작성해주세요!");
			userid.focus();
			return false;
		}
		// userid.style.borderColor = "black";
		
		const userpw = joinForm.userpw;
		if(userpw.value == "") {
			alert("비밀번호를 입력하세요!");
			userpw.focus();
			return false;
		}
		if(userpw.value.length < 8) {
			alert("비밀번호는 8자 이상으로 작성해주세요!");
			userpw.focus();
			return false;
		}
		
		const username = joinForm.username;
		if(username.value == "") {
			alert("이름을 입력하세요!");
			username.focus();
			return false;
		}
	}
</script>
</html>