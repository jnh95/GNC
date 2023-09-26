<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.green.domain.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script
	src="${pageContext.request.contextPath}/resources/js/forgetPw.js?ver=0.1"></script>
<title>GNC</title>
</head>
<body>
	<!-- 좌상단 GNC 우상단 로그인 -->
	<div style="margin: 5px;">
		<a href="<c:url value="/"/>" class="w3-bar-item w3-button w3-xlarge"><b>GNC</b></a>
		<!-- 로그인 버튼  -->
		<div class="w3-right" style="margin-top: 2px;">
			<jsp:include page="login.jsp" />
		</div>
	</div>


	<div class="w3-modal-content w3-card-4 w3-animate-zoom"
		style="max-width: 600px">

		<form class="w3-container" action="<c:url value="/forgetPw"/>"
			method="post" id="forgetPwForm" name="forgetPwForm">
			<div class="w3-section">
				<label><b>ID</b></label>
				<input name="MEM_ID"
					class="w3-input w3-border w3-margin-bottom" type="text"
					placeholder="ID를 입력해주세요." required />
					
					<label><b>비밀번호</b></label>
					<input
					id="forgetPw" name="MEM_PW" class="w3-input w3-border" style="margin-bottom:5px;" type="password"
					placeholder="비밀번호를 입력해주세요." required />
					
					<input
					id="forgetPw2" name="MEM_PW2" class="w3-input w3-border" type="password"
					placeholder="동일한 비밀번호를 입력해주세요." required />
					
					<a class="w3-right"
					onclick="forgetPwOn()" id="MEM_PW3" style="display: block; cursor: pointer;">비밀번호
					보기</a>
					
					<a class="w3-right" onclick="forgetPwOff()" id="MEM_PW4"
					style="display: none; cursor: pointer;">비밀번호 숨기기</a>
			</div>
		</form>
		
		<button
			class="w3-button w3-block w3-light-grey w3-section w3-padding"
			onclick="pwChange()">비밀번호 바꾸기</button>
	</div>

</body>
</html>