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
			<span id="result" style="color:red; font-weight: bold;"></span><br>
			<!-- onkeyup : 키가 누르고 올라갈 때마다 함수 실행 -->
			<input type="text" placeholder="아이디를 입력하세요." name="userid" autofocus onkeyup="checkId()">
			<input type="button" value="중복체크" onclick="checkId();"><br>
			<input type="password" placeholder="비밀번호를 입력하세요." name="userpw"><br>
			<input type="text" placeholder="이름을 입력하세요." name="username">
			<input type="submit" value="가입하기">
		</fieldset>
	</form>
</body>
<script>
	const joinForm = document.joinForm;
	const result = document.getElementById("result");

	function sendit() {
		const userid = joinForm.userid;
		if(userid.value == "") {
			alert("아이디를 입력하세요!");
			userid.focus();
			// userid.style.borderColor = "red";
			return false;
		}
		if(userid.value.length < 5 || userid.value.length > 12) {
			alert("아이디는 5자 이상 12자 이하로  작성해주세요!");
			userid.focus();
			return false;
		}
		// userid.style.borderColor = "black";
		if(result.innerHTML == "") {
			alert("아이디 중복검사를 해주세요")
			return false;
		}
		if(result.innerHTML != "사용할 수 있는 아이디입니다."){
			alert("아이디가 중복되었습니다.")
			userid.focus();
			return false;
		}
		
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
	
	function checkId() {
		
		const userid = document.joinForm.userid;
		
		if(userid.value.length == 0) {
			result.innerHTML = "";
		} else {
			const xhr = new XMLHttpRequest();
			
			// xhr.open("GET","checkId_db.jsp?userid="+userid.value, true);
			xhr.open("POST","checkId_db.jsp", true);
			
			
			// POST 방식은 body에 데이터를 넣어서 보내기 때문에
			// 이 코드를 보고 body를 데이터로 읽겠다는 것을 의미한다.
			xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
			
			// xhr이 할 행동들을 미리 정해줌 밑에
			
			// xhr 객체의 상태가 변화할 때 함수 실행 open, send, 성공, 실패 등등
			// 상태가 변하기만 해도 다 들어와서 함수 실행
			// 응답이 있고 완료가 되어야 if문 안으로 들어가 들어가 실행
			xhr.onreadystatechange = function() {
				// 통신이 완료되었다면 참
				// XMLHttpRequest.DONE : 통신이 완료했을 때
				if(xhr.readyState == XMLHttpRequest.DONE) {
					// 요청과 응답이 성공했다면 참
					// 응답 코드 200 => 성공
					// 		 404 => 페이지를 못 찾음
					//		 500 => 오류
					if(xhr.status == 200) {
						// 들어왔다는 것은 응답된 데이터가 있다는 뜻
						// 응답된 데이터를 문자열로 받아오라는 뜻
						let txt = xhr.responseText;
						console.log(txt);
						
						// 문자열.trim() : 문자열의 양쪽에 있는 모든 공백을 제거
						txt = txt.trim();
						
						if(txt == "O") {
							result.innerHTML = "사용할 수 있는 아이디 입니다."
						} else {
							result.innerHTML = "이미 존재하는 아이디입니다."
						}
					}
				}
			}
			
			// xhr 객체가 요청을 보냈고 응답을 받았을 것이다.
			// xhr.send();
			
			xhr.send("userid="+userid.value);
		}
	}
</script>
</html>