function join() {

// ID 체크
var id = document.getElementById("id");
var idCheck = /^(?=.*[a-zA-Z])(?=.*[0-9]).{2,16}$/;

var pwd = document.getElementById("pwd");
var pwd2 = document.getElementById("pwd2");
var pwdCheck = /^(?=.*[a-zA-Z])(?=.*[0-9]).{2,16}$/;

var phone = document.getElementById("MEM_PHONE");
var phonetest = /[0-9]{10,11}/;

var mail = document.getElementById("MEM_MAIL");
var mailtest = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;

var birth = document.getElementById("MEM_BIRTH");
var birthtest = /[0-9]{8}/;

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
	} else if(!pwdCheck.test(pwd.value)) {
		alert("비밀번호는 영문자+숫자 조합으로 2~16자리를 사용해야합니다.");
		return false;
	} else if (pwd2.value !== pwd.value) {
		alert("비밀번호가 일치하지 않습니다.");
		return false;
	} else if (!phonetest.test(phone.value)) {
		alert("전화번호는 숫자로 10~11자리 사용해야 합니다.");
		return false;
	} else if (!mailtest.test(mail.value)) {
		alert("이메일은 숫자로 hong1234@naver.com처럼 작성해야 합니다.");
		return false;
	} else if (!birthtest.test(birth.value)) {
		alert("생년월일은 숫자로 8자리를 적어야 합니다.");
		return false;
	} else {
		document.joinForm.submit();
	}
}

function pwdOn4() {
	document.querySelector('#pwd').type = "text";
	document.querySelector('#pwd2').type = "text";
	document.querySelector('#pwd3').style.display = "none";
	document.querySelector('#pwd4').style.display = "block";
}

function pwdOff4() {
	document.querySelector('#pwd').type = "password";
	document.querySelector('#pwd2').type = "password";
	document.querySelector('#pwd3').style.display = "block";
	document.querySelector('#pwd4').style.display = "none";
}

function idCheck() {
	var id = document.getElementById("id").value;
	var name = document.getElementById("name").value;
	var pwd = document.getElementById("pwd").value;
	var pwd2 = document.getElementById("pwd2").value;
	var phone = document.getElementById("MEM_PHONE").value;
	var mail = document.getElementById("MEM_MAIL").value;
	var add = document.getElementById("MEM_ADD").value;
	var birth = document.getElementById("MEM_BIRTH").value;
	var idCheck = /^(?=.*[a-zA-Z])(?=.*[0-9]).{2,16}$/;

	if (!idCheck.test(id)) {
		alert("ID는 영문자+숫자 조합으로 2~16자리로 사용가능합니다.");
		return false;
	}
	
	document.getElementById("idInput").value = id;
	document.getElementById("nameInput").value = name;
	document.getElementById("pwdInput").value = pwd;
	document.getElementById("pwd2Input").value = pwd2;
	document.getElementById("phoneInput").value = phone;
	document.getElementById("mailInput").value = mail;
	document.getElementById("addInput").value = add;
	document.getElementById("birthInput").value = birth;
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