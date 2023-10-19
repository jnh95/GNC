<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.green.domain.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<title>로그인</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>
.w3-bar-block .w3-bar-item {
	padding: 16px;
	font-weight: bold;
}
</style>

<!-- 좌상단 GNC 우상단 로그인 -->
<!-- 로그인 버튼  -->
<div
	style="height: 70px; width: 100%; position: fixed !important; background-color: #fff;">
	<a href="<c:url value="/"/>" class="w3-bar-item w3-button w3-xlarge"
		style="margin: 5px;"><b>GNC</b></a>
	<c:choose>
		<c:when test="${idkey eq null || pwkey eq null }">
			<div class="w3-right" style="margin: 7px 5px 5px 5px;">
				<jsp:include page="login.jsp" />
			</div>
		</c:when>

		<c:otherwise>
			<!-- 로그인이 되었을 때  -->
			<form action="<c:url value="/logout"/>" method="post"
				class="w3-right" style="margin: 13px 5px 5px 5px;">
				<jsp:include page="logout.jsp" />
			</form>
		</c:otherwise>
	</c:choose>
</div>
<nav class="w3-sidebar w3-bar-block w3-collapse w3-card"
	style="margin-top: 70px; width: 250px;" id="mySidebar">
	<c:choose>
		<c:when test="${idkey ne null || pwkey ne null }">
			<a class="w3-bar-item w3-button" href="<c:url value="/blog"/>">블로그</a>
			<a class="w3-bar-item w3-button" href="<c:url value="/question"/>">질문</a>
			<a class="w3-bar-item w3-button" href="<c:url value="/answer"/>">답변</a>
			<a class="w3-bar-item w3-button" href="<c:url value="/mypage"/>">내
				정보</a>
		</c:when>
		<c:otherwise>
			<a class="w3-bar-item w3-button" href="<c:url value="/blog"/>">블로그</a>
			<a class="w3-bar-item w3-button" href="<c:url value="/question"/>">질문</a>
			<a class="w3-bar-item w3-button" href="<c:url value="/answer"/>">답변</a>
		</c:otherwise>
	</c:choose>
</nav>
<div style="padding-top: 70px;"></div>