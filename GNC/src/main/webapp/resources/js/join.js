function join() {

// ID 체크
var id = document.getElementById("id");
var idCheck = /^(?=.*[a-zA-Z])(?=.*[0-9]).{2,16}$/;

var pw = document.getElementById("pw");
var pw2 = document.getElementById("pw2");
var pwCheck = /^(?=.*[a-zA-Z])(?=.*[0-9]).{2,16}$/;

var name = document.getElementById("name");

var hiddenId = document.getElementById("hiddenId");
	
	if (hiddenId.value == "" || hiddenId.value == null) {
		alert("ID 중복 검사를 해주세요.");
		return false;
	} else if (name.value == "") {
		alert("이름을 적어주세요.");
		return false;
	} else if (!idCheck.test(id.value)) {
		alert("ID는 영문자+숫자 조합으로 2~16자리로 사용가능합니다.");
		return false;
  } else if(!pwCheck.test(pw.value)) {
		alert("비밀번호는 영문자+숫자 조합으로 2~16자리를 사용해야합니다.");
		return false;
  } else if (pw2.value !== pw.value) {
	    alert("비밀번호가 일치하지 않습니다.");
	    return false;
  	} else {
		document.joinForm.submit();
  	}
}

function pwOn() {
	document.querySelector('#pw').type = "text";
	document.querySelector('#pw2').type = "text";
	document.querySelector('#pw3').style.display = "none";
	document.querySelector('#pw4').style.display = "block";
}

function pwOff() {
	document.querySelector('#pw').type = "password";
	document.querySelector('#pw2').type = "password";
	document.querySelector('#pw3').style.display = "block";
	document.querySelector('#pw4').style.display = "none";
}

function idCheck() {
	var id = document.getElementById("id").value;
	var idCheck = /^(?=.*[a-zA-Z])(?=.*[0-9]).{2,16}$/;

	if (!idCheck.test(id)) {
		alert("ID는 영문자+숫자 조합으로 2~16자리로 사용가능합니다.");
		return false;
	}
	
	document.getElementById("idInput").value = id;
	document.idCheckForm.submit();
}

function existId() {
	var id = document.getElementById("id").value;
	
	document.getElementById("idInput").value = id;
	
	document.idCheckForm.submit();
}

function useId() {
	var id = document.getElementById("id").value;
	
	document.getElementById("idInput").value = id;
	
	document.idCheckForm.submit();
}