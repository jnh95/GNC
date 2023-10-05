<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.green.domain.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
request.setCharacterEncoding("UTF-8");

String name = (String) session.getAttribute("namekey");
String id = (String) session.getAttribute("idkey");
String pw = (String) session.getAttribute("pwkey");
String memNo = (String) session.getAttribute("nokey");

String questionModify = (String) request.getAttribute("questionModify");
%>
<!DOCTYPE html>
<html>
<title>질문</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script
	src="${pageContext.request.contextPath}/resources/js/mypage.js?ver=0.12"></script>
<body>
	<form id="myQuestionForm" name="myQuestionForm"
		action="<c:url value="/question/myQuestion"/>">
		<input style="display: none;" id="myQuestion" name="myQuestion"
			value="<%=memNo%>">
	</form>
	<jsp:include page="sidebar.jsp" />

	<%
	if ("questionModify".equals(questionModify)) { //수정하기
	%>
	<c:forEach items="${questionList }" var="question">
		<div style="margin: 0 0 0 250px;">
			<div class="w3-content w3-padding"
				style="max-width: 1500px; padding-top: 0px !important;">
				<p class="w3-left"
					style="font-size: 20px; padding: 8px 16px 8px 16px; margin: 20px 0 10px 0;">질문
					작성하기</p>

				<div class="w3-row-padding">
					<form:form method="post" modelAttribute="questionChange"
						action="${pageContext.request.contextPath}/question/questionChange"
						enctype="multipart/form-data">

						<div style="padding: 10px;">
							<input name="QUE_TITLE" placeholder="제목을 입력해주세요."
								style="width: 1200px;" value="${question.QUE_TITLE }" />
						</div>

						<div style="padding: 10px;">
							<input name="QUE_CONTENT" placeholder="내용을 입력해주세요."
								style="width: 1200px; height: 1000px;"
								value="${question.QUE_CONTENT }" />
						</div>

						<div style="padding: 10px;">
							<c:if test="${not empty question.QUE_IMAGE }">
								<img
									src="<c:url value="/resources/images/${question.QUE_IMAGE }"/>"
									onclick="img()" id="queImg"
									style="max-width: 300px; max-height: 300px;">
								<input id="file" name="fileName" type="file"
									style="display: none;" accept="image/jpeg"
									onchange="change(event)" />
							</c:if>

							<c:if test="${empty question.QUE_IMAGE }">
								<img src="<c:url value="/resources/images/noimg.jpg"/>"
									onclick="img()" id="queImg"
									style="max-width: 300px; max-height: 300px;">
								<input id="file" name="fileName" type="file"
									style="display: none;" accept="image/jpeg"
									onchange="change(event)" />
							</c:if>
						</div>
						<input name="QUE_NO" style="display: none;"
							value="${question.QUE_NO }" />

						<input name="MEM_NO" style="display: none;"
							value="${question.MEM_NO }" />

						<input name="QUE_IMAGE" style="display: none;"
							value="${question.QUE_IMAGE }" />

						<button class="w3-button w3-right"
							style="border: 1px solid #000; border-radius: 20px;">작성하기</button>
					</form:form>
				</div>
			</div>
		</div>
	</c:forEach>
	<%
	} else { //작성하기
	%>
	<div style="margin: 0 0 0 250px;">
		<div class="w3-content w3-padding"
			style="max-width: 1500px; padding-top: 0px !important;">
			<p class="w3-left"
				style="font-size: 20px; padding: 8px 16px 8px 16px; margin: 20px 0 10px 0;">질문
				작성하기</p>

			<div class="w3-row-padding">
				<form:form method="post" modelAttribute="question"
					action="${pageContext.request.contextPath}/question/questionInsert"
					enctype="multipart/form-data">
					<div style="padding: 10px;">
						<input name="QUE_TITLE" placeholder="제목을 입력해주세요."
							style="width: 1200px;">
					</div>

					<div style="padding: 10px;">
						<input name="QUE_CONTENT" placeholder="내용을 입력해주세요."
							style="width: 1200px; height: 1000px;">
					</div>

					<img src="<c:url value="/resources/images/noimg.jpg"/>"
						onclick="img()" id="queImg"
						style="max-width: 300px; max-height: 300px;">
					<input id="file" name="fileName" type="file" style="display: none;"
						accept="image/jpeg" onchange="change(event)" />

					<input name="MEM_NO" style="display: none;" value="<%=memNo%>">

					<input name="QUE_IMAGE" style="display: none;" value="noimg.jpg" />

					<button class="w3-button w3-right"
						style="border: 1px solid #000; border-radius: 20px;">작성하기</button>
				</form:form>
			</div>
		</div>
	</div>
	<%
	}
	%>
</body>
<script>
	function img() {
		document.getElementById('file').click();
	}

	function change(event) {
		var reader = new FileReader();

		reader.onload = function(event) {
			let img = document.getElementById("queImg");
			document.querySelector('#queImg').style.display = "block";
			img.setAttribute("src", event.target.result);
		};

		reader.readAsDataURL(event.target.files[0]);
	}
</script>
</html>