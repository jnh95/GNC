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
<title>블로그 상세</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<body>
	<jsp:include page="sidebar.jsp" />

	<div style="margin: 0 0 0 250px;">
		<div class="w3-content w3-padding"
			style="max-width: 1500px; padding-top: 0px !important;">
			<p class="w3-left"
				style="font-size: 20px; padding: 8px 16px 8px 16px; margin: 20px 0 10px 0;">질문</p>


			<div class="w3-row-padding">
				<c:forEach items="${questionList }" var="question">
						<h4>${question.QUE_TITLE }</h4>
						<hr>
						<img
							src="<c:url value="/resources/images/${question.QUE_IMAGE }"/>"
							style="max-width: 400px; max-height: 400px;">
						<hr>
						<p>${question.QUE_CONTENT }</p>
				</c:forEach>
			</div>
			
			<p class="w3-left"
				style="font-size: 20px; padding: 8px 16px 8px 16px; margin: 20px 0 10px 0;">질문에 대한 답변</p>
			<div class="w3-row-padding">
				<c:forEach items="${answerList }" var="answer">
						<h4>${answer.ANS_TITLE }</h4>
						<hr>
						<img
							src="<c:url value="/resources/images/${answer.ANS_IMAGE }"/>"
							style="max-width: 400px; max-height: 400px;">
						<hr>
						<p>${answer.ANS_CONTENT }</p>
				</c:forEach>
			</div>
		</div>
	</div>

</body>
</html>
