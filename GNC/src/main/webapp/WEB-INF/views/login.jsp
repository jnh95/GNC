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

String loginFailed = (String) session.getAttribute("loginFailed");
String logout = (String) session.getAttribute("logout");
%>
<!-- 회원 탈퇴 -->
<c:if test="${delete eq 'delete' }">
<script>
	alert("탈퇴하셨습니다.");
</script>
<c:remove var="delete"/>
</c:if>

<!-- 로그인 실패 -->
<c:if test="${loginFailed eq 'loginFailed' }">
<script>
	alert("로그인에 실패하셨습니다.");
</script>
<c:remove var="loginFailed"/>
</c:if>

<!-- 로그아웃 -->
<c:if test="${logout eq 'logout' }">
<script>
	alert("로그아웃 되었습니다.");
</script>
<c:remove var="logout"/>
</c:if>

<script
	src="${pageContext.request.contextPath}/resources/js/mypage.js?ver=0.2"></script>
<button onclick="document.getElementById('id01').style.display='block'"
	class="w3-button w3-large">로그인</button>

<div id="id01" class="w3-modal">
	<div class="w3-modal-content w3-card-4 w3-animate-zoom"
		style="max-width: 600px">

		<form class="w3-container" action="<c:url value="/login"/>"
			method="post">
			<!-- 여기부터 페이지 위치 저장 후 로그인시 해당 페이지로 돌아가는 정보 저장 -->
<!-- 			블로그 -->
			<c:if test="${blog eq 'blog' }">
				<input name="blog" id="blog" style="display: none;" value="blog">
			</c:if>

<!-- 			블로그 디테일 -->
			<c:if test="${blogDetail eq 'blogDetail' }">
				<input name="blogDetail" id="blogDetail" style="display: none;"
					value="blogDetail">
				<input style="display: none;" value="${bloNo}" name="bloNo">
			</c:if>

<!-- 			질문 -->
			<c:if test="${question eq 'question' }">
				<input name="question" id="question" style="display: none;"
					value="question">
			</c:if>

<!-- 			질문 디테일 -->
			<c:if test="${questionDetail eq 'questionDetail' }">
				<input name="questionDetail" id="questionDetail"
					style="display: none;" value="questionDetail">
				<input style="display: none;" value="${queNo}" name="queNo">
			</c:if>

<!-- 			답변 -->
			<c:if test="${answer eq 'answer' }">
				<input name="answer" id="answer" style="display: none;"
					value="answer">
			</c:if>

<!-- 			답변 디테일 -->
			<c:if test="${answerDetail eq 'answerDetail' }">
				<input name="answerDetail" id="answerDetail" style="display: none;"
					value="answerDetail">
				<input style="display: none;" value="${ansNo}" name="ansNo">
				<input style="display: none;" value="${queNo}" name="queNo">
			</c:if>

<!-- 			검색 -->
			<c:if test="${searchLogin eq 'searchLogin' }">
				<input name="searchLogin" id="searchLogin" style="display: none;"
					value="searchLogin">
				<input name="content" id="content" style="display: none;"
					value="${content }">
				<input name="english" id="english" style="display: none;"
					value="${english }">
			</c:if>

<!-- 			검색(제목, 제목+내용, 조회수) -->
			<c:if test="${search ne null }">
				<input name="search" id="search" style="display: none;"
					value="${search }">
				<input name="content" id="content" style="display: none;"
					value="${content }">
				<input name="english" id="english" style="display: none;"
					value="${english }">
			</c:if>
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