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
%>
<!DOCTYPE html>
<html>
<title>블로그</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://www.w3schools.com/lib/w3-theme-teal.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body {
	font-family: "Roboto", sans-serif
}

.w3-bar-block .w3-bar-item {
	padding: 16px;
	font-weight: bold;
}
</style>
<!-- 좌상단 GNC 우상단 로그인 -->
<%
if (id == null & pw == null) {
%>


<!-- 로그인 버튼  -->
<div style="margin: 5px;">
	<a href="<c:url value="/"/>" class="w3-bar-item w3-button w3-xlarge"><b>GNC</b></a>
	<div class="w3-right" style="margin-top: 2px;">
		<jsp:include page="login.jsp" />
	</div>
</div>

<nav class="w3-sidebar w3-bar-block w3-collapse w3-animate-left w3-card"
	style="z-index: 3; width: 250px;" id="mySidebar">
	<a class="w3-bar-item w3-button" href="<c:url value="/blog"/>">블로그</a>
	<a class="w3-bar-item w3-button" href="#">Link 1</a> <a
		class="w3-bar-item w3-button" href="#">Link 2</a> <a
		class="w3-bar-item w3-button" href="#">Link 3</a> <a
		class="w3-bar-item w3-button" href="#">Link 4</a>
</nav>

<%
} else {
%>
<!-- 로그인이 되었을 때  -->
<div style="margin: 5px;">
	<a href="<c:url value="/"/>" class="w3-bar-item w3-button w3-xlarge"><b>GNC</b></a>
	<form action="<c:url value="/logout"/>" method="post" class="w3-right"
		style="margin-top: 8px;">
		안녕하세요. <a href="<c:url value="/mypage"/>" class="w3-button"
			style="margin-bottom: 4px; padding: 10px;"><%=name%>님 </a>
		<button type="submit" class="w3-button"
			style="margin-bottom: 4px; padding: 10px;">로그아웃</button>
			<%
			if (blog == "blog") {
			%>
				<input name="blog" id="blog" style="display:none;" value="blog">
			<%
			}
			%>
	</form>
</div>
<nav class="w3-sidebar w3-bar-block w3-collapse w3-animate-left w3-card"
	style="z-index: 3; width: 150px;" id="mySidebar">
	<a class="w3-bar-item w3-button" href="<c:url value="/blog"/>">블로그</a>
	<a class="w3-bar-item w3-button" href="#">Link 1</a> <a
		class="w3-bar-item w3-button" href="#">Link 2</a> <a
		class="w3-bar-item w3-button" href="#">Link 3</a> <a
		class="w3-bar-item w3-button" href="#">Link 4</a> <a
		class="w3-bar-item w3-button" href="<c:url value="/mypage"/>">내 정보</a>
</nav>
<%
}
%>