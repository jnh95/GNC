<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.green.domain.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:if test="${loginSuccess eq 'loginSuccess' }">
	<script>
		alert("로그인 되었습니다.");
	</script>
	<c:remove var="loginSuccess" />
</c:if>

안녕하세요.
<a href="<c:url value="/mypage"/>" class="w3-button"
	style="margin-bottom: 4px; padding: 10px;"> ${namekey}님 </a>

<button type="submit" class="w3-button"
	style="margin-bottom: 4px; padding: 10px;">로그아웃</button>

<!-- 여기부터 페이지 위치 저장 후 로그아웃시 해당 페이지로 돌아가는 정보 저장 -->
<!-- 블로그 -->
<c:if test="${blog eq 'blog' }">
	<input name="blog" id="blog" style="display: none;" value="blog">
</c:if>

<!-- 블로그 디테일 -->
<c:if test="${blogDetail eq 'blogDetail' }">
	<input name="blogDetail" id="blogDetail" style="display: none;"
		value="blogDetail">
	<input style="display: none;" value="${bloNo}" name="bloNo">
</c:if>

<!-- 질문 -->
<c:if test="${question eq 'question' }">
	<input name="question" id="question" style="display: none;"
		value="question">
</c:if>

<!-- 질문 디테일 -->
<c:if test="${questionDetail eq 'questionDetail' }">
	<input name="questionDetail" id="questionDetail" style="display: none;"
		value="questionDetail">
	<input style="display: none;" value="${queNo}" name="queNo">
</c:if>

<!-- 답변 -->
<c:if test="${answer eq 'answer' }">
	<input name="answer" id="answer" style="display: none;" value="answer">
</c:if>

<!-- 답변 디테일 -->
<c:if test="${answerDetail eq 'answerDetail' }">
	<input name="answerDetail" id="answerDetail" style="display: none;"
		value="answerDetail">
	<input style="display: none;" value="${ansNo}" name="ansNo">
	<input style="display: none;" value="${queNo}" name="queNo">
</c:if>

<!-- 검색 -->
<c:if test="${searchLogin ne null }">
	<input name="searchLogin" id="searchLogin" style="display: none;"
		value="${searchLogin}">
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