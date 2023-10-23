<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.green.domain.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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

		<c:choose>
			<c:when test="${idkey eq null || pwkey eq null }">
				<!-- 로그인 버튼  -->
				<div class="w3-right" style="margin-top: 2px;">
					<jsp:include page="login.jsp" />
				</div>
			</c:when>
			<c:otherwise>
				<!-- 로그인이 되었을 때  -->
				<form action="<c:url value="/logout"/>" method="post"
					class="w3-right" style="margin-top: 8px;">
					<jsp:include page="logout.jsp" />
				</form>
			</c:otherwise>
		</c:choose>
	</div>
	
	<!-- 검색창 -->
	<header class="w3-display-container w3-content w3-wide"
		style="max-width: 1500px; padding: 100px 0px 100px 150px; margin: 50px 0px 0 200px;"
		id="home">
		<form name="inputForm"
			class="w3-display-middle w3-margin-top w3-center"
			action="<c:url value="/search"/>">
			<div style="width: 700px;">

				<c:choose>
					<c:when test="${indexSearch eq 'indexSearch' }">
						<c:choose>
							<c:when test="${english ne null }">
								<input style="width: 600px; height: 50px; margin-top: 10px;"
									type="search" placeholder="검색어를 입력해 주세요." maxlength="255"
									name="content" value="${english }">
								<button type="submit">검색</button>
								<br>
								<div>
									<a style="text-decoration: none;"
										href="<c:url value="/search?content=${english }"/>">최근</a> <a
										style="text-decoration: none;"
										href="<c:url value="/search/in?content=${english }"/>">조회수</a>
									<a style="text-decoration: none;"
										href="<c:url value="/search/title?content=${english }"/>">제목</a>
									<a style="text-decoration: none;"
										href="<c:url value="/search/content?content=${english }"/>">제목+내용</a>
								</div>
								<span> 검색하신 단어를 ${content }(으)로 검색했습니다. </span>
								<br>
								<a style="text-decoration: none; color: blue;"
									href="<c:url value="/search/english?content=${english }"/>">${english }</a>
								<span>(으)로 검색하고 싶으신가요?</span>
							</c:when>

							<c:when test="${'englishKeep' eq englishKeep }">
								<input style="width: 600px; height: 50px; margin-top: 10px;"
									type="search" placeholder="검색어를 입력해 주세요." maxlength="255"
									name="content" value="${content }">
								<button type="submit">검색</button>
								<br>
								<div>
									<a style="text-decoration: none;"
										href="<c:url value="/search/english?content=${content }"/>">최근</a>
									<a style="text-decoration: none;"
										href="<c:url value="/search/in/english?content=${content }"/>">조회수</a>
									<a style="text-decoration: none;"
										href="<c:url value="/search/title/english?content=${content }"/>">제목</a>
									<a style="text-decoration: none;"
										href="<c:url value="/search/content/english?content=${content }"/>">제목+내용</a>
								</div>
							</c:when>

							<c:otherwise>
								<input style="width: 600px; height: 50px; margin-top: 1px;"
									type="search" placeholder="검색어를 입력해 주세요." maxlength="255"
									name="content" value="${content }">
								<button type="submit">검색</button>
								<br>
								<div>
									<a style="text-decoration: none;" href="<c:url value="/search?content=${content }"/>">최근</a>
									<a style="text-decoration: none;" href="<c:url value="/search/in?content=${content }"/>">조회수</a>
									<a style="text-decoration: none;" href="<c:url value="/search/title?content=${content }"/>">제목</a>
									<a style="text-decoration: none;" href="<c:url value="/search/content?content=${content }"/>">제목+내용</a>
								</div>
							</c:otherwise>
						</c:choose>
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
							style="max-width: 270px; height: 150px;">
						<hr>
						<p>${fn:substring(blog.BLO_CONTENT, 0, 50)}</p>
						<input style="display: none;" value="${blog.BLO_NO }" id="BLO_NO"
							name="BLO_NO">
					</div>
				</form>
			</c:forEach>
			<c:if test="${blogList.size() == 0 }">
				<p>작성된 블로그가 없습니다.</p>
			</c:if>
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
							style="max-width: 270px; height: 150px;">
						<hr>
						<p>${fn:substring(question.QUE_CONTENT, 0, 50)}</p>
						<input style="display: none;" value="${question.QUE_NO }"
							id="QUE_NO" name="QUE_NO">
					</div>
				</form>
			</c:forEach>
			<c:if test="${questionList.size() == 0 }">
				<p>작성된 질문이 없습니다.</p>
			</c:if>
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
							style="max-width: 270px; height: 150px;">
						<hr>
						<p>${fn:substring(answer.ANS_CONTENT, 0, 50)}</p>
						<input style="display: none;" value="${answer.ANS_NO }"
							id="ANS_NO" name="ANS_NO"> <input style="display: none;"
							value="${answer.QUE_NO }" id="QUE_NO" name="QUE_NO">
					</div>
				</form>
			</c:forEach>
			<c:if test="${answerList.size() == 0 }">
				<p>작성된 답변이 없습니다.</p>
			</c:if>
		</div>
	</div>
</body>
</html>
