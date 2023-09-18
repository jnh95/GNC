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
%>
<!DOCTYPE html>
<html>
<head>
<title>GNC</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<body>
	<!-- 좌상단 GNC 우상단 로그인 -->
	<div style="margin: 5px;">
		<a href="<c:url value="/"/>" class="w3-bar-item w3-button w3-xlarge"><b>GNC</b></a>
		<%
		if (id == null & pw == null) {
		%>
		<!-- 로그인 버튼  -->
		<div class="w3-right" style="margin-top: 2px;">
			<jsp:include page="login.jsp" />
		</div>

		<%} else {%>
		<!-- 로그인이 되었을 때  -->
		<form action="<c:url value="/logout"/>" method="post" class="w3-right"
			style="margin-top: 8px;">
			안녕하세요. <a href="<c:url value="/mypage"/>" class="w3-button"
				style="margin-bottom: 4px; padding: 10px;"><%=name%>님 </a>
			<button type="submit" class="w3-button"
				style="margin-bottom: 4px; padding: 10px;">로그아웃</button>
		</form>
	</div>
	<%
	}
	%>
	<!-- 검색창 -->
	<header class="w3-display-container w3-content w3-wide"
		style="max-width: 1500px; padding: 100px 0px 100px 150px; margin: 50px 0px 100px 200px;"
		id="home">
		<form class="w3-display-middle w3-margin-top w3-center">
			<div style="width: 700px;">
				<input style="width: 600px; height: 50px;" type="search"
					placeholder="검색어를 입력해 주세요." maxlength="255">
				<button type="submit">검색</button>
			</div>
		</form>
	</header>

	<!-- 블로그 -->
	<div class="w3-content w3-padding"
		style="max-width: 1500px; padding-top: 0px !important;">

		<hr>

		<!-- for문으로 여러개 넣기 -->
		<c:forEach items="${boardlist }" var="board">
		<div class="w3-row-padding w3-grayscale">
			<div class="w3-col l3 m6 w3-margin-bottom">
				<h4>${board.BOA_TITLE }</h4>
				<hr>
				<img alt="메인 사진" style="width: 100%">
				<hr>
				<p>${board.BOA_CONTENT }</p>
			</div>
		</div>
		</c:forEach>
	</div>

</body>
</html>
