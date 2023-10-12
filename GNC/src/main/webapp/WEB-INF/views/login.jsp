<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%
Cookie[] cookies = request.getCookies();
String id = null;
if (cookies != null) {

	for (Cookie c : cookies) {
		String name = c.getName();
		String value = c.getValue();

		if (name.equals("rememberId")) {
	id = value;
		}
	}
}

String blog = (String) request.getAttribute("blog");
String blogDetail = (String) request.getAttribute("blogDetail");
String bloNo = (String) request.getAttribute("bloNo");
String question = (String) request.getAttribute("question");
String questionDetail = (String) request.getAttribute("questionDetail");
String queNo = (String) request.getAttribute("queNo");
String answer = (String) request.getAttribute("answer");
String answerDetail = (String) request.getAttribute("answerDetail");
String ansNo = (String) request.getAttribute("ansNo");

String searchLogin = (String) request.getAttribute("searchLogin");
String search = (String) request.getAttribute("search");

String loginFailed = (String) session.getAttribute("loginFailed");
String logout = (String) session.getAttribute("logout");

String delete = (String) session.getAttribute("delete");

if ("delete".equals(delete)) {
%>
<script>
	alert("탈퇴하셨습니다.");
</script>
<%
session.removeAttribute("delete");
}

if ("loginFailed".equals(loginFailed)) {
%>
<script>
	alert("로그인에 실패하셨습니다.");
</script>
<%
session.removeAttribute("loginFailed");
}

if ("logout".equals(logout)) {
%>
<script>
	alert("로그아웃 되었습니다.");
</script>
<%
session.removeAttribute("logout");
}
%>
<script
	src="${pageContext.request.contextPath}/resources/js/mypage.js?ver=0.2"></script>
<button onclick="document.getElementById('id01').style.display='block'"
	class="w3-button w3-large">로그인</button>

<div id="id01" class="w3-modal">
	<div class="w3-modal-content w3-card-4 w3-animate-zoom"
		style="max-width: 600px">

		<form class="w3-container" action="<c:url value="/login"/>"
			method="post">
			<%
			if (blog == "blog") {
			%>
			<input name="blog" id="blog" style="display: none;" value="blog">
			<%
			}

			if (blogDetail == "blogDetail") {
			%>
			<input name="blogDetail" id="blogDetail" style="display: none;"
				value="blogDetail"> <input style="display: none;"
				value="<%=bloNo%>" name="bloNo">
			<%
			}

			if (question == "question") {
			%>
			<input name="question" id="question" style="display: none;"
				value="question">
			<%
			}
			
			if (questionDetail == "questionDetail") {
			%>
			<input name="questionDetail" id="questionDetail"
				style="display: none;" value="questionDetail"> <input
				style="display: none;" value="<%=queNo%>" name="queNo">
			<%
			}
			
			if (answer == "answer") {
			%>
			<input name="answer" id="answer" style="display: none;"
				value="answer">
			<%
			}
			
			if (answerDetail == "answerDetail") {
			%>
			<input name="answerDetail" id="answerDetail" style="display: none;"
				value="answerDetail"> <input style="display: none;"
				value="<%=ansNo%>" name="ansNo">
			<%
			}
			
			if (searchLogin == "searchLogin") {
			%>
			<input name="searchLogin" id="searchLogin" style="display: none;"
				value="searchLogin">
			<input name="content" id="content" style="display: none;"
				value="${content }">
			<input name="english" id="english" style="display: none;"
				value="${english }">
			<%
			}
			
			if (search != null) {
			%>
			<input name="search" id="search" style="display: none;"
				value="${search }">
			<input name="content" id="content" style="display: none;"
				value="${content }">
			<input name="english" id="english" style="display: none;"
				value="${english }">
			<%
			}
			%>
			<div class="w3-section">
				<label><b>ID</b></label>
				<%
				if (id != null) {
				%>
				<input name="MEM_ID" class="w3-input w3-border w3-margin-bottom"
					type="text" placeholder="ID를 입력해주세요." value="<%=id%>" required />
				<%
				} else {
				%>
				<input name="MEM_ID" class="w3-input w3-border w3-margin-bottom"
					type="text" placeholder="ID를 입력해주세요." required />
				<%
				}
				%>
				<label><b>비밀번호</b></label> <input id="pw" name="MEM_PW"
					class="w3-input w3-border" type="password"
					placeholder="비밀번호를 입력해주세요." required /> <a class="w3-right"
					onclick="pwOn3()" id="pw3" style="display: block; cursor: pointer;">비밀번호
					보기</a> <a class="w3-right" onclick="pwOff3()" id="pw4"
					style="display: none; cursor: pointer;">비밀번호 숨기기</a>

				<button
					class="w3-button w3-block w3-light-grey w3-section w3-padding"
					type="submit">로그인</button>

				<input class="w3-check" type="checkbox" checked="checked"
					name="remember"> 아이디 기억하기

				<button
					onclick="document.getElementById('id01').style.display='none'"
					type="button" class="w3-button w3-red w3-right ">취소</button>
			</div>
		</form>

		<div class="w3-container w3-border-top w3-padding w3-light-grey">
			<span class="w3-left w3-padding w3-hide-small"><a
				href="<c:url value="/forgetPw"/>">비밀번호를 잊으셨나요?</a></span> <span
				class="w3-right w3-padding w3-hide-small"><a
				href="<c:url value="/join"/>">ID가 없으신가요?</a></span>
		</div>

	</div>
</div>