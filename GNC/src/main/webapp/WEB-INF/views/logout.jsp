<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.green.domain.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%
request.setCharacterEncoding("UTF-8");

String name = (String) session.getAttribute("namekey");
String id = (String) session.getAttribute("idkey");
String pw = (String) session.getAttribute("pwkey");

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

String loginSuccess = (String) session.getAttribute("loginSuccess");

if ("loginSuccess".equals(loginSuccess)) {
%>
<script>
	alert("로그인 되었습니다.");
</script>
<%
session.removeAttribute("loginSuccess");
}
%>

안녕하세요.
<a href="<c:url value="/mypage"/>" class="w3-button"
	style="margin-bottom: 4px; padding: 10px;"> <%=name%>님
</a>

<button type="submit" class="w3-button"
	style="margin-bottom: 4px; padding: 10px;">로그아웃</button>
<%
if (blog == "blog") {
%>
<input name="blog" id="blog" style="display: none;" value="blog">
<%
}

if (blogDetail == "blogDetail") {
%>
<input name="blogDetail" id="blogDetail" style="display: none;"
	value="blogDetail">
<input style="display: none;" value="<%=bloNo%>" name="bloNo">
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
<input name="questionDetail" id="questionDetail" style="display: none;"
	value="questionDetail">
<input style="display: none;" value="<%=queNo%>" name="queNo">
<%
}

if (answer == "answer") {
%>
<input name="answer" id="answer" style="display: none;" value="answer">
<%
}

if (answerDetail == "answerDetail") {
%>
<input name="answerDetail" id="answerDetail" style="display: none;"
	value="answerDetail">
<input style="display: none;" value="<%=ansNo%>" name="ansNo">
<%
}

if (searchLogin == "searchLogin") {
%>
<input name="searchLogin" id="searchLogin" style="display: none;"
	value="searchLogin">
<input name="content" id="content" style="display: none;"
	value="${content }">
<%
}

if (search == "in") {
%>
<input name="search" id="search" style="display: none;"
	value="${search }">
<input name="content" id="content" style="display: none;"
	value="${content }">
<%
}
%>
