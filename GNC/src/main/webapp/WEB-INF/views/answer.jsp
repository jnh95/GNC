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

String myAnswer = (String) request.getAttribute("myAnswer");

String end = (String) request.getAttribute("end");

int answerBegin = 0;
int answerEnd = 8;

if (end != null) {
	answerBegin = Integer.parseInt(end) - 9;
	answerEnd = Integer.parseInt(end) - 1;
}
%>
<!DOCTYPE html>
<html>
<title>답변</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script
	src="${pageContext.request.contextPath}/resources/js/mypage.js?ver=0.12"></script>
<body>
	<form id="myAnswerForm" name="myAnswerForm"
		action="<c:url value="/answer/myAnswer"/>">
		<input style="display: none;" id="MEM_NO" name="MEM_NO"
			value="<%=memNo%>">
	</form>

	<jsp:include page="sidebar.jsp" />

	<div style="margin: 0 0 0 250px;">
		<div class="w3-content w3-padding"
			style="max-width: 1500px; padding-top: 0px !important;">
			<%
			if ("myAnswer".equals(myAnswer)) {
			%>
			<p class="w3-left"
				style="font-size: 20px; padding: 8px 16px 8px 16px; margin: 20px 0 10px 0;">내
				답변</p>
			<%
			} else {
			%><p class="w3-left"
				style="font-size: 20px; padding: 8px 16px 8px 16px; margin: 20px 0 10px 0;">답변</p>
			<%
			}
			%>

			<%
			if (id != null & pw != null) {
				if ("myAnswer".equals(myAnswer)) {
			%>
			<a class="w3-right w3-button w3-medium"
				style="margin: 20px 0 10px 0;" href="<c:url value="/answer"/>">답변</a>
			<%
			} else {
			%>
			<a class="w3-right w3-button w3-medium"
				style="margin: 20px 0 10px 0;" onclick="myAnswer()">내 답변</a>
			<%
			}
			%>
			<%
			}
			%>

			<div class="w3-row-padding">
				<c:forEach items="${answerList }" var="answer"
					begin="<%=answerBegin %>" end="<%=answerEnd %>">
					<form action="<c:url value="/answer/answerDetail"/>" method="get">
						<div class="w3-col l3 m6" style="margin: 0 20px 50px 20px;">
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
							<%
							if ("myAnswer".equals(myAnswer)) {
							%>
							<a
								href="<c:url value="/answer/answerModify?ANS_NO=${answer.ANS_NO }"/>"
								class="w3-button w3-block w3-light-grey w3-padding">수정하기</a>
							<%
							}
							%>
						</div>
					</form>
				</c:forEach>
			</div>

			<div style="margin-left: 25px;">
				<c:if test="${answerList.size() > 9 }">
					<c:choose>
						<c:when test="${myAnswer eq 'myAnswer' }">
							<c:forEach items="${answerList }" step="9">
								<c:set var="i" value="${i+1 }"></c:set>
								<input type="submit" onclick="MyAnswerButton(${i*9})"
									value="${i }"></input>
							</c:forEach>
						</c:when>

						<c:otherwise>
							<c:forEach items="${answerList }" step="9">
								<c:set var="i" value="${i+1 }"></c:set>
								<input type="submit" onclick="answerButton(${i*9})"
									value="${i }"></input>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</c:if>
			</div>
		</div>
	</div>

	<script>
	function myAnswerButton(button) {
		document.myAnswerBoardForm.end.value = button;
		document.myAnswerBoardForm.submit();
	}

	function answerButton(button) {
		document.answerBoardForm.end.value = button;
		document.answerBoardForm.submit();
	}
	</script>

	<form method="get" action="<c:url value="/answer/myAnswerBoard"/>"
		name="myAnswerBoardForm" style="display: none;">
		<input name="MEM_NO" style="display: none;" value="<%=memNo%>">
		<input name="end" style="display: none;">
	</form>

	<form method="get" action="<c:url value="/answer/answerBoard"/>"
		name="answerBoardForm" style="display: none;">
		<input name="end" style="display: none;">
	</form>

</body>

</html>