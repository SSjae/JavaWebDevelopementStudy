// 주소 찾기
function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                document.getElementById("sample6_extraAddress").value = extraAddr;
            
            } else {
                document.getElementById("sample6_extraAddress").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample6_postcode').value = data.zonecode;
            document.getElementById("sample6_address").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("sample6_detailAddress").focus();
        }
    }).open();
}

// 인증번호 발송
let authnumber;
var myVar;

function authjoin() {
	const userphone = document.joinForm.userphone;
	if(userphone.value == ""){
		alert("휴대폰 번호를 입력하세요!");
		userphone.focus();
		return false;
	}
	var regPhone = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
    if (!regPhone.test(userphone.value)) {
		alert("올바른 휴대폰 번호를 입력하세요!");
		userphone.focus();
		return false;
    }
    
	$("#authjoin").css("display","inline-flex");
	$("#authbuttonjoin").css("display","none");
	$("#userphone").attr("readonly",true);
	
	var num = 60 * 3; // 몇분을 설정할지의 대한 변수 선언
	function time(){
		myVar = setInterval(function() {
			var min = num / 60;
			min = Math.floor(min);
			
			var sec = num - (60 * min);
			
			var $input = $('.timejoin').val(min + ':' + sec);
			
			if(num == 0){
				alert("시간이 초과되었습니다.");
				history.go(0);
				clearInterval(myVar) // num 이 0초가 되었을대 clearInterval로 타이머 종료
			}
			num--;
			
		}, 1000);
	}
	time();
	
	alert("인증번호가 발송되었습니다.");
	const xhr = new XMLHttpRequest();
	
	xhr.open("GET",cp+"/user/SMSNumOk.us?userphone="+userphone.value,true);
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4){
			if(xhr.status == 200){
				let txt = xhr.responseText;
				txt = txt.trim();
				
				authnumber = txt;
			}
		}	
	}
	xhr.send();
}
//회원 정보 수정
function authmodify() {
	const userphone = document.modifyForm.userphone;
	if(userphone.value == ""){
		alert("휴대폰 번호를 입력하세요!");
		userphone.focus();
		return false;
	}
	var regPhone = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
    if (!regPhone.test(userphone.value)) {
		alert("올바른 휴대폰 번호를 입력하세요!");
		userphone.focus();
		return false;
    }
    
	$("#authjoin").css("display","inline-flex");
	$("#authbuttonjoin").css("display","none");
	$("#userphone").attr("readonly",true);
	
	var num = 60 * 3; // 몇분을 설정할지의 대한 변수 선언
	function time(){
		myVar = setInterval(function() {
			var min = num / 60;
			min = Math.floor(min);
			
			var sec = num - (60 * min);
			
			var $input = $('.timejoin').val(min + ':' + sec);
			
			if(num == 0){
				alert("시간이 초과되었습니다.");
				history.go(0);
				clearInterval(myVar) // num 이 0초가 되었을대 clearInterval로 타이머 종료
			}
			num--;
			
		}, 1000);
	}
	time();
	
	alert("인증번호가 발송되었습니다.");
	const xhr = new XMLHttpRequest();
	
	xhr.open("GET",cp+"/user/SMSNumOk.us?userphone="+userphone.value,true);
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4){
			if(xhr.status == 200){
				let txt = xhr.responseText;
				txt = txt.trim();
				
				authnumber = txt;
			}
		}	
	}
	xhr.send();
}

function authid() {
	const userphone = document.findIdForm.userphone;
	if(userphone.value == ""){
		alert("휴대폰 번호를 입력하세요!");
		userphone.focus();
		return false;
	}
	var regPhone = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
    if (!regPhone.test(userphone.value)) {
		alert("올바른 휴대폰 번호를 입력하세요!");
		userphone.focus();
		return false;
    }
    
	$("#authid").css("display","inline-flex");
	$("#authbuttonid").css("display","none");
	$("#userphone").attr("readonly",true);
	
	var num = 60 * 3; // 몇분을 설정할지의 대한 변수 선언
	function time(){
		myVar = setInterval(function() {
			var min = num / 60;
			min = Math.floor(min);
			
			var sec = num - (60 * min);
			
			var $input = $('.timeid').val(min + ':' + sec);
			
			if(num == 0){
				alert("시간이 초과되었습니다.");
				history.go(0);
				clearInterval(myVar) // num 이 0초가 되었을대 clearInterval로 타이머 종료
			}
			num--;
			
		}, 1000);
	}
	time();
	
	alert("인증번호가 발송되었습니다.");
	const xhr = new XMLHttpRequest();
	
	xhr.open("GET",cp+"/user/SMSNumOk.us?userphone="+userphone.value,true);
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4){
			if(xhr.status == 200){
				let txt = xhr.responseText;
				txt = txt.trim();
				
				authnumber = txt;
			}
		}	
	}
	xhr.send();
}
function authpw() {
	const userphone = document.findPwForm.userphone;
	if(userphone.value == ""){
		alert("휴대폰 번호를 입력하세요!");
		userphone.focus();
		return false;
	}
	var regPhone = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
    if (!regPhone.test(userphone.value)) {
		alert("올바른 휴대폰 번호를 입력하세요!");
		userphone.focus();
		return false;
    }
    
	$("#authpw").css("display","inline-flex");
	$("#authbuttonpw").css("display","none");
	$("#userphone").attr("readonly",true);
	
	var num = 60 * 3; // 몇분을 설정할지의 대한 변수 선언
	function time(){
		myVar = setInterval(function() {
			var min = num / 60;
			min = Math.floor(min);
			
			var sec = num - (60 * min);
			
			var $input = $('.timepw').val(min + ':' + sec);
			
			if(num == 0){
				alert("시간이 초과되었습니다.");
				history.go(0);
				clearInterval(myVar) // num 이 0초가 되었을대 clearInterval로 타이머 종료
			}
			num--;
			
		}, 1000);
	}
	time();
	
	alert("인증번호가 발송되었습니다.");
	const xhr = new XMLHttpRequest();
	
	xhr.open("GET",cp+"/user/SMSNumOk.us?userphone="+userphone.value,true);
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4){
			if(xhr.status == 200){
				let txt = xhr.responseText;
				txt = txt.trim();
				
				authnumber = txt;
			}
		}	
	}
	xhr.send();
}
// 시간 연장
function addtime(i) {
	clearInterval(myVar)
	var num = 60 * 3; // 몇분을 설정할지의 대한 변수 선언
	function time(i){
		myVar = setInterval(function() {
			var min = num / 60;
			min = Math.floor(min);
			
			var sec = num - (60 * min);
			
			var $input = $('.time'+i).val(min + ':' + sec);
			
			if(num == 0){
				alert("시간이 초과되었습니다.");
				history.go(0);
				clearInterval(myVar) // num 이 0초가 되었을대 clearInterval로 타이머 종료
			}
			num--;
			
		}, 1000);
	}
	time(i);
}
// 인증버튼
function joinauth() {
	const authnum = document.joinForm.authnum;
	if(authnum.value == ""){
		alert("인증을 완료해주세요");
		authnum.focus();
		return false;
	}
	if(authnum.value == authnumber) {
		alert("인증이 완료되었습니다.");
		clearInterval(myVar);
		$("#abutton").css("display","none");
		$("#tbutton").css("display","none");
		$("#authnum").attr("readonly",true);
		$("#time").css("display","none");
	} else {
		alert("인증에 실패하였습니다. 다시 시도해주세요")
		$("#authnum").focus();
	}
}
function modifyauth() {
	const authnum = document.modifyForm.authnum;
	if(authnum.value == ""){
		alert("인증을 완료해주세요");
		authnum.focus();
		return false;
	}
	if(authnum.value == authnumber) {
		alert("인증이 완료되었습니다.");
		clearInterval(myVar);
		$("#abutton").css("display","none");
		$("#tbutton").css("display","none");
		$("#authnum").attr("readonly",true);
		$("#time").css("display","none");
	} else {
		alert("인증에 실패하였습니다. 다시 시도해주세요")
		$("#authnum").focus();
	}
}
function idauth() {
	const authnum = document.findIdForm.authnum;
	if(authnum.value == ""){
		alert("인증을 완료해주세요");
		authnum.focus();
		return false;
	}
	if(authnum.value == authnumber) {
		alert("인증이 완료되었습니다.");
		clearInterval(myVar);
		$("#abutton1").css("display","none");
		$("#tbutton1").css("display","none");
		$("#authnum1").attr("readonly",true);
		$("#time1").css("display","none");
	} else {
		alert("인증에 실패하였습니다. 다시 시도해주세요")
		$("#authnum1").focus();
	}
}
function pwauth() {
	const authnum = document.findPwForm.authnum;
	if(authnum.value == ""){
		alert("인증을 완료해주세요");
		authnum.focus();
		return false;
	}
	if(authnum.value == authnumber) {
		alert("인증이 완료되었습니다.");
		clearInterval(myVar);
		$("#abutton2").css("display","none");
		$("#tbutton2").css("display","none");
		$("#authnum2").attr("readonly",true);
		$("#time2").css("display","none");
	} else {
		alert("인증에 실패하였습니다. 다시 시도해주세요")
		$("#authnum2").focus();
	}
}

// 중복 체크
function checkId(){
	const userid = document.joinForm.userid;
	if(userid.value.length == ""){
		alert("아이디를 입력해주세요");
		userid.focus();
		return false;
	}
	const xhr = new XMLHttpRequest();
	
	xhr.open("GET",cp+"/user/CheckIdOk.us?userid="+userid.value,true);
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4){
			if(xhr.status == 200){
				let txt = xhr.responseText;
				txt = txt.trim();
				
				if(txt == "O"){
					result.innerHTML = "사용할 수 있는 아이디입니다.";
				}
				else{
					result.innerHTML = "이미 존재하는 아이디입니다.";
				}
			}
		}	
	}
	xhr.send();
}

//회원가입 유효성 검사
function join(){
	const joinForm = document.joinForm;
	const result = document.getElementById("result");
	
	const userid = joinForm.userid;
	if(userid.value == ""){
		alert("아이디를 입력하세요!");
		userid.focus();
		return false;
	}
	if(userid.value.length < 5 || userid.value.length > 12){
		alert("아이디는 5자 이상 12자 이하로 작성해주세요!");
		userid.focus();
		return false;
	}
	if(result.innerHTML == ""){
		alert("아이디 중복검사를 해주세요!")
		userid.focus();
		return false;
	}
	if(result.innerHTML != "사용할 수 있는 아이디입니다."){
		alert("아이디가 중복되었습니다!");
		userid.focus();
		return false;
	}
	
	const userpw = joinForm.userpw;
	const userpw_re = joinForm.userpw_re;
	if(userpw.value == ""){
		alert("비밀번호를 입력하세요!");
		userpw.focus();
		return false;
	}
	//정규식 - https://developer.mozilla.org/ko/docs/Web/JavaScript/Guide/Regular_Expressions
	let reg = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[~?!@#$%^&*_-]).{8,}$/
	if(!reg.test(userpw.value)){
		alert("비밀번호는 8자 이상, 숫자, 대문자, 소문자, 특수문자를 모두 포함해야 합니다!");
		userpw.focus();
		return false;
	}
	if(/(\w)\1\1\1/.test(userpw.value)){
		alert("같은 문자를 4번 이상 연속해서 사용하실 수 없습니다!")
		userpw.focus();
		return false;
	}
	if(userpw.value.search(" ") != -1){
		alert("비밀번호는 공백을 포함할 수 없습니다!");
		userpw.focus();
		return false;
	}
	if(userpw_re.value == ""){
		alert("비밀번호 확인을 작성해주세요!");
		userpw_re.focus();
		return false;
	}
	if(userpw.value != userpw_re.value){
		alert("비밀번호와 일치하지 않습니다!");
		userpw.focus();
		return false;
	}
	
	const username = joinForm.username;
	if(username.value == ""){
		alert("이름을 입력하세요!");
		username.focus();
		return false;
	}
	
	const usernickname = joinForm.usernickname;
	if(usernickname.value == ""){
		alert("닉네임을 입력하세요!");
		usernickname.focus();
		return false;
	}
	if(usernickname.value.length < 2){
		alert("닉네임은 두 글자 이상으로 작성해주세요!");
		usernickname.focus();
		return false;
	}

	const useremail = joinForm.useremail;
	if(useremail.value == ""){
		alert("이메일 주소를 입력하세요!");
		useremail.focus();
		return false;
	}
	var re = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
	if(!re.test(useremail.value)){
		alert("올바른 이메일 주소로 입력해주세요!");
		useremail.focus();
		return false;
	}
	
	const userphone = joinForm.userphone;
	const authnum = joinForm.authnum;
	if(userphone.value == ""){
		alert("인증을 완료해주세요");
		userphone.focus();
		return false;
	}
	if(authnum.value == ""){
		alert("인증을 완료해주세요");
		authnum.focus();
		return false;
	}
	
	const zipcode = joinForm.zipcode;
	if(zipcode.value == ""){
		alert("주소찾기를 진행해주세요!");
		sample6_execDaumPostcode();
		return false;
	}
	const addrdetail = joinForm.addrdetail;
	if(addrdetail.value == ""){
		alert("주소를 이어서 입력해주세요!");
		addrdetail.focus();
		return false;
	}
	return true;
}

//회원 정보 수정 유효성 검사
function modify(){
	const modifyForm = document.modifyForm;
	
	const userpw = modifyForm.userpw;
	const userpw_re = modifyForm.userpw_re;
	if(userpw.value != ""){
		//정규식 - https://developer.mozilla.org/ko/docs/Web/JavaScript/Guide/Regular_Expressions
		let reg = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[~?!@#$%^&*_-]).{8,}$/
		if(!reg.test(userpw.value)){
			alert("비밀번호는 8자 이상, 숫자, 대문자, 소문자, 특수문자를 모두 포함해야 합니다!");
			userpw.focus();
			return false;
		}
		if(/(\w)\1\1\1/.test(userpw.value)){
			alert("같은 문자를 4번 이상 연속해서 사용하실 수 없습니다!")
			userpw.focus();
			return false;
		}
		if(userpw.value.search(" ") != -1){
			alert("비밀번호는 공백을 포함할 수 없습니다!");
			userpw.focus();
			return false;
		}
		if(userpw_re.value == ""){
			alert("비밀번호 확인을 작성해주세요!");
			userpw_re.focus();
			return false;
		}
		if(userpw.value != userpw_re.value){
			alert("비밀번호와 일치하지 않습니다!");
			userpw.focus();
			return false;
		}
	}
	
	const usernickname = modifyForm.usernickname;
	if(usernickname.value != ""){
		if(usernickname.value.length < 2){
			alert("닉네임은 두 글자 이상으로 작성해주세요!");
			usernickname.focus();
			return false;
		}
	}

	const useremail = modifyForm.useremail;
	if(useremail.value != ""){
		var re = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
		if(!re.test(useremail.value)){
			alert("올바른 이메일 주소로 입력해주세요!");
			useremail.focus();
			return false;
		}
	}
	
	const userphone = modifyForm.userphone;
	const authnum = modifyForm.authnum;
	if(userphone.value != ""){
		if(authnum.value == "" || authnum.value != authnumber){
			alert("인증을 완료해주세요");
			authnum.focus();
			return false;
		}
	}
	
	const zipcode = modifyForm.zipcode;
	const addrdetail = modifyForm.addrdetail;
	if(zipcode.value != ""){
		if(addrdetail.value == ""){
			alert("주소를 이어서 입력해주세요!");
			addrdetail.focus();
			return false;
		} 
	}
	if(zipcode.value == "" && addrdetail.value != ""){
		alert("상세 주소를 입력하기 전, 우편번호 찾기를 먼저 해주세요!")
		addrdetail.focus();
		return false;
	}
	return true;
}

// 로그인 유호성 검사
function login() {
	const loginForm = document.loginForm;
	
	const userid = loginForm.userid;
	if(userid.value == ""){
		alert("아이디를 입력하세요!");
		userid.focus();
		return false;
	}
	
	const userpw = loginForm.userpw;
	if(userpw.value == ""){
		alert("비밀번호를 입력하세요!");
		userpw.focus();
		return false;
	}
}

// 아이디찾기 유효성 검사
function findId() {
	const findIdForm = document.findIdForm;
	
	const username = findIdForm.username;
	if(username.value == ""){
		alert("이름을 입력하세요!");
		username.focus();
		return false;
	}
	
	const userphone = findIdForm.userphone;
	const authnum = findIdForm.authnum;
	if(userphone.value == ""){
		alert("인증을 완료해주세요");
		userphone.focus();
		return false;
	}
	if(authnum.value == ""){
		alert("인증을 완료해주세요");
		authnum.focus();
		return false;
	}
}

//회원탈퇴 유효성 검사
function removeUser() {
	const removeForm = document.removeForm;
	
	const userpw = removeForm.userpw;
	if(userpw.value == ""){
		alert("비밀번호를 입력하세요!");
		userpw.focus();
		return false;
	}
}

// 비밀번호 찾기 유효성 검사
function findPw() {
	const findPwForm = document.findPwForm;
	
	const userid = findPwForm.userid;
	if(userid.value == ""){
		alert("아이디를 입력하세요!");
		userid.focus();
		return false;
	}
	
	const username = findPwForm.username;
	if(username.value == ""){
		alert("이름을 입력하세요!");
		username.focus();
		return false;
	}
	
	const userphone = findPwForm.userphone;
	const authnum = findPwForm.authnum;
	if(userphone.value == ""){
		alert("인증을 완료해주세요");
		userphone.focus();
		return false;
	}
	if(authnum.value == ""){
		alert("인증을 완료해주세요");
		authnum.focus();
		return false;
	}
}

//비밀번호 재설정 유효성 검사
function findResetPw() {
	const findResetPwForm = document.findResetPwForm;
	
	const userpw = findResetPwForm.userpw;
	const userpw_re = findResetPwForm.userpw_re;
	if(userpw.value == ""){
		alert("새 비밀번호를 입력하세요!");
		userpw.focus();
		return false;
	}
	//정규식 - https://developer.mozilla.org/ko/docs/Web/JavaScript/Guide/Regular_Expressions
	let reg = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[~?!@#$%^&*_-]).{8,}$/
	if(!reg.test(userpw.value)){
		alert("새 비밀번호는 8자 이상, 숫자, 대문자, 소문자, 특수문자를 모두 포함해야 합니다!");
		userpw.focus();
		return false;
	}
	if(/(\w)\1\1\1/.test(userpw.value)){
		alert("같은 문자를 4번 이상 연속해서 사용하실 수 없습니다!")
		userpw.focus();
		return false;
	}
	if(userpw.value.search(" ") != -1){
		alert("새 비밀번호는 공백을 포함할 수 없습니다!");
		userpw.focus();
		return false;
	}
	if(userpw_re.value == ""){
		alert("새 비밀번호 확인을 작성해주세요!");
		userpw_re.focus();
		return false;
	}
	if(userpw.value != userpw_re.value){
		alert("새 비밀번호와 일치하지 않습니다!");
		userpw_re.focus();
		return false;
	}
}






















