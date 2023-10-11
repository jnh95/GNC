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

String myQuestion = (String) request.getAttribute("myQuestion");

String end = (String) request.getAttribute("end");

int questionBegin = 0;
int questionEnd = 5;

if (end != null) {
	questionBegin = Integer.parseInt(end) - 6;
	questionEnd = Integer.parseInt(end) - 1;
}
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
		<input style="display: none;" id="MEM_NO" name="MEM_NO"
			value="<%=memNo%>">
	</form>

	<jsp:include page="sidebar.jsp" />

	<div style="margin: 0 0 0 250px;">
		<div class="w3-content w3-padding"
			style="max-width: 1500px; padding-top: 0px !important;">
			<%
			if ("myQuestion".equals(myQuestion)) {
			%>
			<p class="w3-left"
				style="font-size: 20px; padding: 8px 16px 8px 16px; margin: 20px 0 10px 0;">내
				질문</p>
			<%
			} else {
			%><p class="w3-left"
				style="font-size: 20px; padding: 8px 16px 8px 16px; margin: 20px 0 10px 0;">질문</p>
			<%
			}
			%>

			<%
			if (id != null & pw != null) {
			%>
			<a class="w3-right w3-button w3-medium"
				style="margin: 20px 0 10px 0;"
				href="<c:url value="/question/questionWrite"/>">작성하기</a>
			<%
			if ("myQuestion".equals(myQuestion)) {
			%>
			<a class="w3-right w3-button w3-medium"
				style="margin: 20px 0 10px 0;" href="<c:url value="/question"/>">질문</a>
			<%
			} else {
			%>
			<a class="w3-right w3-button w3-medium"
				style="margin: 20px 0 10px 0;" onclick="myQuestion()">내 질문</a>
			<%
			}
			%>
			<%
			}
			%>

			<div class="w3-row-padding">
				<c:forEach items="${questionList }" var="question"
					begin="<%=questionBegin %>" end="<%=questionEnd %>">
					<form action="<c:url value="/question/questionDetail"/>"
						method="get">
						<div class="w3-col l3 m6" style="margin: 0 20px 50px 20px; height:400px;">
							<h4>${question.QUE_TITLE }</h4>
							<hr>
							<input type="image"
								src="<c:url value="/resources/images/${question.QUE_IMAGE }"/>"
								style="max-width: 270px; height: 180px;">
							<hr>
							<p>${question.QUE_CONTENT }</p>
							<input style="display: none;" value="${question.QUE_NO }"
								id="QUE_NO" name="QUE_NO">
							<%
							if ("myQuestion".equals(myQuestion)) {
							%>
							<a
								href="<c:url value="/question/questionModify?QUE_NO=${question.QUE_NO }"/>"
								class="w3-button w3-block w3-light-grey w3-padding">수정하기</a>
							<%
							}
							%>
						</div>
					</form>
				</c:forEach>
			</div>

			<div style="margin-left: 25px;">
				<c:if test="${questionList.size() > 6 }">
					<c:choose>
						<c:when test="${myQuestion eq 'myQuestion' }">
							<c:forEach items="${questionList }" step="6">
								<c:set var="i" value="${i+1 }"></c:set>
								<input class="w3-button" type="submit" onclick="MyQuestionButton(${i*6})"
									value="${i }"></input>
							</c:forEach>
						</c:when>

						<c:otherwise>
							<c:forEach items="${questionList }" step="6">
								<c:set var="i" value="${i+1 }"></c:set>
								<input class="w3-button" type="submit" onclick="questionButton(${i*6})"
									value="${i }"></input>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</c:if>
			</div>
		</div>
	</div>

	<script>
	function myQuestionButton(button) {
		document.myQuestionBoardForm.end.value = button;
		document.myQuestionBoardForm.submit();
	}

	function questionButton(button) {
		document.questionBoardForm.end.value = button;
		document.questionBoardForm.submit();
	}
	</script>

	<form method="get" action="<c:url value="/question/myQuestionBoard"/>"
		name="myQuestionBoardForm" style="display: none;">
		<input name="MEM_NO" style="display: none;" value="<%=memNo%>">
		<input name="end" style="display: none;">
	</form>

	<form method="get" action="<c:url value="/question/questionBoard"/>"
		name="questionBoardForm" style="display: none;">
		<input name="end" style="display: none;">
	</form>

</body>

</html>