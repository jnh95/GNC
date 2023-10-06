<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.green.domain.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
request.setCharacterEncoding("UTF-8");

String name = (String) session.getAttribute("namekey");
String id = (String) session.getAttribute("idkey");
String pw = (String) session.getAttribute("pwkey");

String loginFailed = (String) session.getAttribute("loginFailed");
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
	<%
	if ("loginFailed".equals(loginFailed)) {
	%>
	<script>
		alert("로그인에 실패하셨습니다.");
	</script>
	<%
	session.removeAttribute("loginFailed");
	}
	%>

	<!-- 좌상단 GNC 우상단 로그인 -->
	<div style="margin: 5px;">
		<a href="<c:url value="/"/>" class="w3-bar-item w3-button w3-xlarge"><b>GNC</b></a>
		<%
		if (id == null || pw == null) {
		%>
		<!-- 로그인 버튼  -->
		<div class="w3-right" style="margin-top: 2px;">
			<jsp:include page="login.jsp" />
		</div>

		<%} else {%>
		<!-- 로그인이 되었을 때  -->
		<form action="<c:url value="/logout"/>" method="post" class="w3-right"
			style="margin-top: 8px;">
			<jsp:include page="logout.jsp" />
		</form>
	</div>
	<%
	}
	%>
	<form name="newForm" style="display: none;" action="<c:url value="/search"/>">
		<input name="content" style="display: none;">
	</form>
	<form name="inForm" style="display: none;" action="<c:url value="/search/in"/>">
		<input name="content" style="display: none;">
	</form>
	<form name="titleForm" style="display: none;" action="<c:url value="/search/title"/>">
		<input name="content" style="display: none;">
	</form>
	<form name="contentForm" style="display: none;" action="<c:url value="/search/content"/>">
		<input name="content" style="display: none;">
	</form>
	<!-- 검색창 -->
	<header class="w3-display-container w3-content w3-wide"
		style="max-width: 1500px; padding: 100px 0px 100px 150px; margin: 50px 0px 100px 200px;"
		id="home">
		<form name="inputForm" class="w3-display-middle w3-margin-top w3-center"
			action="<c:url value="/search"/>">
			<div style="width: 700px;">
				
				<c:choose>
				<c:when test="${indexSearch eq 'indexSearch' }">
					<input style="width: 600px; height: 50px;" type="search"
						placeholder="검색어를 입력해 주세요." maxlength="255" name="content" value="${content }">
					<button type="submit">검색</button>
					<div>
						<span onclick="inputNew(${content })" style="cursor: pointer;">최근</span>
						<span onclick="inputIn(${content })" style="cursor: pointer;">조회수</span>
						<span onclick="inputTitle(${content })" style="cursor: pointer;">제목</span>
						<span onclick="inputContent(${content })" style="cursor: pointer;">제목+내용</span>
					</div>
				</c:when>
				<c:otherwise>
					<input style="width: 600px; height: 50px;" type="search"
						placeholder="검색어를 입력해 주세요." maxlength="255" name="content">
					<button type="submit">검색</button>
				</c:otherwise>
				</c:choose>
			</div>
		</form>
	</header>

	<script>
		function inputNew(input) {
			document.newForm.content.value = input;
			document.newForm.submit();
		}
		
		function inputIn(input) {
			document.inForm.content.value = input;
			document.inForm.submit();
		}
		
		function inputTitle(input) {
			document.titleForm.content.value = document.inputForm.content.value;
			document.titleForm.submit();
		}
		
		function inputContent(input) {
			document.contentForm.content.value = document.inputForm.content.value;
			document.contentForm.submit();
		}
	
	
	</script>

	<!-- 블로그 -->
	<div class="w3-content w3-padding"
		style="max-width: 1500px; padding-top: 0px !important;">

		<c:choose>
			<c:when test="${search eq 'in' }">
				<a class="w3-button" style="font-size: 20px; margin: 20px 0 10px 0;"
					href="<c:url value="/blog"/>">조회수가 많은 블로그</a>
			</c:when>

			<c:when test="${search eq 'title' }">
				<a class="w3-button" style="font-size: 20px; margin: 20px 0 10px 0;"
					href="<c:url value="/blog"/>">제목에 포함된 블로그</a>
			</c:when>

			<c:when test="${search eq 'content' }">
				<a class="w3-button" style="font-size: 20px; margin: 20px 0 10px 0;"
					href="<c:url value="/blog"/>">제목 또는 내용에 포함된 블로그</a>
			</c:when>

			<c:otherwise>
				<a class="w3-button" style="font-size: 20px; margin: 20px 0 10px 0;"
					href="<c:url value="/blog"/>">최근 작성된 블로그</a>
			</c:otherwise>
		</c:choose>


		<!-- for문으로 여러개 넣기 -->
		<div class="w3-row-padding">
			<c:forEach items="${blogList }" var="blog" end="3">
				<form action="<c:url value="/blog/blogDetail"/>" method="get">
					<div class="w3-col l3 m6" style="margin: 0 0 50px 0;">
						<h4>${blog.BLO_TITLE }</h4>
						<hr>
						<input type="image"
							src="<c:url value="/resources/images/${blog.BLO_IMAGE }"/>"
							style="max-width: 180px; max-height: 180px;">
						<hr>
						<p>${blog.BLO_CONTENT }</p>
						<input style="display: none;" value="${blog.BLO_NO }" id="BLO_NO"
							name="BLO_NO">
					</div>
				</form>
			</c:forEach>
		</div>
	</div>

	<!-- 질문 -->
	<div class="w3-content w3-padding"
		style="max-width: 1500px; padding-top: 0px !important;">

		<c:choose>
			<c:when test="${search eq 'in' }">
				<a class="w3-button" style="font-size: 20px; margin: 20px 0 10px 0;"
					href="<c:url value="/question"/>">조회수가 많은 질문</a>
			</c:when>

			<c:when test="${search eq 'title' }">
				<a class="w3-button" style="font-size: 20px; margin: 20px 0 10px 0;"
					href="<c:url value="/question"/>">제목에 포함된 질문</a>
			</c:when>

			<c:when test="${search eq 'content' }">
				<a class="w3-button" style="font-size: 20px; margin: 20px 0 10px 0;"
					href="<c:url value="/question"/>">제목 또는 내용에 포함된 질문</a>
			</c:when>

			<c:otherwise>
				<a class="w3-button" style="font-size: 20px; margin: 20px 0 10px 0;"
					href="<c:url value="/question"/>">최근 작성된 질문</a>
			</c:otherwise>
		</c:choose>


		<div class="w3-row-padding">
			<c:forEach items="${questionList }" var="question" end="3">
				<form action="<c:url value="/question/questionDetail"/>"
					method="get">
					<div class="w3-col l3 m6" style="margin: 0 0 50px 0;">
						<h4>${question.QUE_TITLE }</h4>
						<hr>
						<input type="image"
							src="<c:url value="/resources/images/${question.QUE_IMAGE }"/>"
							style="max-width: 180px; max-height: 180px;">
						<hr>
						<p>${question.QUE_CONTENT }</p>
						<input style="display: none;" value="${question.QUE_NO }"
							id="QUE_NO" name="QUE_NO">
					</div>
				</form>
			</c:forEach>
		</div>
	</div>

	<!-- 답변 -->
	<div class="w3-content w3-padding"
		style="max-width: 1500px; padding-top: 0px !important;">

		<c:choose>
			<c:when test="${search eq 'in' }">
				<a class="w3-button" style="font-size: 20px; margin: 20px 0 10px 0;"
					href="<c:url value="/answer"/>">조회수가 많은 답변</a>
			</c:when>

			<c:when test="${search eq 'title' }">
				<a class="w3-button" style="font-size: 20px; margin: 20px 0 10px 0;"
					href="<c:url value="/answer"/>">제목에 포함된 답변</a>
			</c:when>

			<c:when test="${search eq 'content' }">
				<a class="w3-button" style="font-size: 20px; margin: 20px 0 10px 0;"
					href="<c:url value="/answer"/>">제목 또는 내용에 포함된 답변</a>
			</c:when>

			<c:otherwise>
				<a class="w3-button" style="font-size: 20px; margin: 20px 0 10px 0;"
					href="<c:url value="/answer"/>">최근 작성된 답변</a>
			</c:otherwise>
		</c:choose>


		<!-- for문으로 여러개 넣기 -->
		<div class="w3-row-padding">
			<c:forEach items="${answerList }" var="answer" end="3">
				<form action="<c:url value="/answer/answerDetail"/>" method="get">
					<div class="w3-col l3 m6" style="margin: 0 0 50px 0;">
						<h4>${answer.ANS_TITLE }</h4>
						<hr>
						<input type="image"
							src="<c:url value="/resources/images/${answer.ANS_IMAGE }"/>"
							style="max-width: 180px; max-height: 180px;">
						<hr>
						<p>${answer.ANS_CONTENT }</p>
						<input style="display: none;" value="${answer.ANS_NO }"
							id="ANS_NO" name="ANS_NO"> <input style="display: none;"
							value="${answer.QUE_NO }" id="QUE_NO" name="QUE_NO">
					</div>
				</form>
			</c:forEach>
		</div>
	</div>

</body>
</html>
