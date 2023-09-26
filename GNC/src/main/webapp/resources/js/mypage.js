//비밀번호
function pwOn() {
	document.querySelector('#pw2').style.display = "none";
	document.querySelector('#pw12').style.display = "block";
	document.querySelector('#pw10').style.display = "none";
	document.querySelector('#pw11').style.display = "block";
	document.querySelector('#pwBox').style.padding = "8px 0 0 0";
}


function pwOff() {
	document.querySelector('#pw2').style.display = "block";
	document.querySelector('#pw12').style.display = "none";
	document.querySelector('#pw10').style.display = "block";
	document.querySelector('#pw11').style.display = "none";
	document.querySelector('#pwBox').style.padding = "10px 0 0 0";
}

function pw() {
	document.querySelector('#pw4').type = "password";
	document.querySelector('#pw5').type = "password";
}

function pwChangeOn() {
	document.getElementById("pw").innerHTML = "비밀번호 변경"
	document.querySelector('#pw1').style.display = "none";
	document.querySelector('#pw2').style.display = "none";
	document.querySelector('#pw3').style.display = "block";
	document.querySelector('#pw4').style.display = "block";
	document.querySelector('#pw5').style.display = "block";
	document.querySelector('#pw6').style.display = "block";
	document.querySelector('#pw8').style.display = "block";
	document.querySelector('#pw10').style.display = "none";
	document.querySelector('#pw11').style.display = "none";
	document.querySelector('#pw12').style.display = "none";
}
function pwModify() {
	document.getElementById("pw").innerHTML = "비밀번호"
	document.querySelector('#pw1').style.display = "inline-block";
	document.querySelector('#pw2').style.display = "inline-block";
	document.querySelector('#pw3').style.display = "none";
	document.querySelector('#pw4').style.display = "none";
	document.querySelector('#pw5').style.display = "none";
	document.querySelector('#pw6').style.display = "none";
	document.querySelector('#pw8').style.display = "none";
	document.querySelector('#pw9').style.display = "none";
	document.querySelector('#pw10').style.display = "block";
	document.querySelector('#pw11').style.display = "none";
	document.querySelector('#pw12').style.display = "none";

	pw();
	
	var pw4 = document.getElementById("pw4");
	var pw5 = document.getElementById("pw5");
	var pwCheck = /^(?=.*[a-zA-Z])(?=.*[0-9]).{2,16}$/;
	
	if (pw4.value == "") {
    return false;
  	};
  	
  	if (pw5.value == "") {
    return false;
  	};
	

  if (!pwCheck.test(pw4.value)) {
    alert("비밀번호는 영문자+숫자 조합으로 2~16자리를 사용해야 합니다.");
    return false;
  };

  if (pw5.value !== pw4.value) {
    alert("비밀번호가 일치하지 않습니다..");
    return false;
  };

	document.pw7.submit();
}
function pwChangeOff() {
	document.getElementById("pw").innerHTML = "비밀번호"
	document.querySelector('#pw1').style.display = "inline-block";
	document.querySelector('#pw2').style.display = "inline-block";
	document.querySelector('#pw3').style.display = "none";
	document.querySelector('#pw4').style.display = "none";
	document.querySelector('#pw5').style.display = "none";
	document.querySelector('#pw6').style.display = "none";
	document.querySelector('#pw8').style.display = "none";
	document.querySelector('#pw9').style.display = "none";
	document.querySelector('#pw10').style.display = "block";
	document.querySelector('#pw11').style.display = "none";
	document.querySelector('#pw12').style.display = "none";

	pw();
}

function pwOn2() {
	document.querySelector('#pw4').type = "text";
	document.querySelector('#pw5').type = "text";
	document.querySelector('#pw8').style.display = "none";
	document.querySelector('#pw9').style.display = "block";
}

function pwOff2() {
	document.querySelector('#pw4').type = "password";
	document.querySelector('#pw5').type = "password";
	document.querySelector('#pw8').style.display = "block";
	document.querySelector('#pw9').style.display = "none";
}

//전화번호
function phoneChangeOn() {
	document.getElementById("phone").innerHTML = "전화번호 변경"
	document.querySelector('#phone1').style.display = "none";
	document.querySelector('#phone2').style.display = "none";
	document.querySelector('#phone3').style.display = "block";
	document.querySelector('#phone4').style.display = "block";
	document.querySelector('#phone5').style.display = "block";
}
function phoneModify() {
	document.getElementById("phone").innerHTML = "전화번호"
	document.querySelector('#phone1').style.display = "block";
	document.querySelector('#phone2').style.display = "block";
	document.querySelector('#phone3').style.display = "none";
	document.querySelector('#phone4').style.display = "none";
	document.querySelector('#phone5').style.display = "none";

	document.phone6.submit();
	
	var phone = document.getElementById("phone4");
	var phonetest = /[0-9]{10,11}/;
	
	
  if (phone.value == "") {
    return false;
  };

  if (!phonetest.test(phone.value)) {
    alert("전화번호는 숫자로 10~11자리 사용해야 합니다.");
    return false;
  };


	document.phone6.submit();
}
function phoneChangeOff() {
	document.getElementById("phone").innerHTML = "전화번호"
	document.querySelector('#phone1').style.display = "block";
	document.querySelector('#phone2').style.display = "block";
	document.querySelector('#phone3').style.display = "none";
	document.querySelector('#phone4').style.display = "none";
	document.querySelector('#phone5').style.display = "none";
}

//이메일
function mailChangeOn() {
	document.getElementById("mail").innerHTML = "이메일 변경"
	document.querySelector('#mail1').style.display = "none";
	document.querySelector('#mail2').style.display = "none";
	document.querySelector('#mail3').style.display = "block";
	document.querySelector('#mail4').style.display = "block";
	document.querySelector('#mail5').style.display = "block";
}
function mailModify() {
	document.getElementById("mail").innerHTML = "이메일"
	document.querySelector('#mail1').style.display = "block";
	document.querySelector('#mail2').style.display = "block";
	document.querySelector('#mail3').style.display = "none";
	document.querySelector('#mail4').style.display = "none";
	document.querySelector('#mail5').style.display = "none";
	
	var mail = document.getElementById("mail4");
	var mailtest = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	
	
  if (mail.value == "") {
    return false;
  };

  if (!mailtest.test(mail.value)) {
    alert("이메일은 숫자로 hong1234@naver.com처럼 작성해야 합니다.");
    return false;
  };

	document.mail6.submit();
}
function mailChangeOff() {
	document.getElementById("mail").innerHTML = "이메일"
	document.querySelector('#mail1').style.display = "block";
	document.querySelector('#mail2').style.display = "block";
	document.querySelector('#mail3').style.display = "none";
	document.querySelector('#mail4').style.display = "none";
	document.querySelector('#mail5').style.display = "none";
}

//생년월일
function birthChangeOn() {
	document.getElementById("birth").innerHTML = "생년월일 변경"
	document.querySelector('#birth1').style.display = "none";
	document.querySelector('#birth2').style.display = "none";
	document.querySelector('#birth3').style.display = "block";
	document.querySelector('#birth4').style.display = "block";
	document.querySelector('#birth5').style.display = "block";
}
function birthModify() {
	document.getElementById("birth").innerHTML = "생년월일"
	document.querySelector('#birth1').style.display = "block";
	document.querySelector('#birth2').style.display = "block";
	document.querySelector('#birth3').style.display = "none";
	document.querySelector('#birth4').style.display = "none";
	document.querySelector('#birth5').style.display = "none";
	
	var birth = document.getElementById("birth4");
	var birthtest = /[0-9]{8}/;
	
	
  if (birth.value == "") {
    return false;
  };

  if (!birthtest.test(birth.value)) {
    alert("생년월일은 숫자로 8자리를 적어야 합니다.");
    return false;
  };

	document.birth6.submit();
}
function birthChangeOff() {
	document.getElementById("birth").innerHTML = "생년월일"
	document.querySelector('#birth1').style.display = "block";
	document.querySelector('#birth2').style.display = "block";
	document.querySelector('#birth3').style.display = "none";
	document.querySelector('#birth4').style.display = "none";
	document.querySelector('#birth5').style.display = "none";
}

//주소
function addChangeOn() {
	document.getElementById("add").innerHTML = "주소 변경"
	document.querySelector('#add1').style.display = "none";
	document.querySelector('#add2').style.display = "none";
	document.querySelector('#add3').style.display = "block";
	document.querySelector('#add4').style.display = "block";
	document.querySelector('#add5').style.display = "block";
}
function addModify() {
	document.getElementById("add").innerHTML = "주소"
	document.querySelector('#add1').style.display = "block";
	document.querySelector('#add2').style.display = "block";
	document.querySelector('#add3').style.display = "none";
	document.querySelector('#add4').style.display = "none";
	document.querySelector('#add5').style.display = "none";
  
	document.add6.submit();
}
function addChangeOff() {
	document.getElementById("add").innerHTML = "주소"
	document.querySelector('#add1').style.display = "block";
	document.querySelector('#add2').style.display = "block";
	document.querySelector('#add3').style.display = "none";
	document.querySelector('#add4').style.display = "none";
	document.querySelector('#add5').style.display = "none";
}

function pwOn3() {
	document.querySelector('#pw').type = "text";
	document.querySelector('#pw3').style.display = "none";
	document.querySelector('#pw4').style.display = "block";
}

function pwOff3() {
	document.querySelector('#pw').type = "password";
	document.querySelector('#pw3').style.display = "block";
	document.querySelector('#pw4').style.display = "none";
}

function myBlog() {
	document.myBlogForm.submit();
}

function myQuestion() {
	document.myQuestionForm.submit();
}

function myAnswer() {
	document.myAnswerForm.submit();
}