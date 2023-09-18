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
%>
<script src="${pageContext.request.contextPath}/resources/js/mypage.js?ver=0.2"></script>
<button onclick="document.getElementById('id01').style.display='block'"
	class="w3-button w3-large">로그인</button>

<div id="id01" class="w3-modal">
	<div class="w3-modal-content w3-card-4 w3-animate-zoom"
		style="max-width: 600px">

		<form class="w3-container" action="<c:url value="/login"/>"
			method="post">
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
					class="w3-input w3-border" type="password" placeholder="비밀번호를 입력해주세요."
					required />
				<a class="w3-right" onclick="pwOn3()" id="pw3"
						style="display: block; cursor: pointer;">비밀번호 보기</a>
				<a class="w3-right" onclick="pwOff3()" id="pw4"
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
			<span class="w3-left w3-padding w3-hide-small"><a href="<c:url value="/forgetPw"/>">비밀번호를
					잊으셨나요?</a></span> <span class="w3-right w3-padding w3-hide-small"><a
				href="<c:url value="/join"/>">ID가 없으신가요?</a></span>
		</div>

	</div>
</div>