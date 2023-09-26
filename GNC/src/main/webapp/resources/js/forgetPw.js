//비밀번호
function pwChange() {

	var pw = document.getElementById("forgetPw");
	var pw2 = document.getElementById("forgetPw2");
	var pwCheck = /^(?=.*[a-zA-Z])(?=.*[0-9]).{2,16}$/;
	
	if (pw.value == "") {
    return false;
  	};
  	
  	if (pw2.value == "") {
    return false;
  	};
	

  if (!pwCheck.test(pw.value)) {
    alert("비밀번호는 영문자+숫자 조합으로 2~16자리를 사용해야 합니다.");
    return false;
  };

  if (pw.value !== pw2.value) {
    alert("비밀번호가 일치하지 않습니다..");
    return false;
  };

	document.forgetPwForm.submit();
}

function forgetPwOn() {
	document.querySelector('#forgetPw').type = "text";
	document.querySelector('#forgetPw2').type = "text";
	document.querySelector('#MEM_PW3').style.display = "none";
	document.querySelector('#MEM_PW4').style.display = "block";
}

function forgetPwOff() {
	document.querySelector('#forgetPw').type = "password";
	document.querySelector('#forgetPw2').type = "password";
	document.querySelector('#MEM_PW3').style.display = "block";
	document.querySelector('#MEM_PW4').style.display = "none";
}