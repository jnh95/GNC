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
%>
<!DOCTYPE html>
<html>
<title>질문</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<body>
	<jsp:include page="sidebar.jsp" />

	<div style="margin: 0 0 0 250px;">
		<div class="w3-content w3-padding"
			style="max-width: 1500px; padding-top: 0px !important;">
			<p class="w3-left"
				style="font-size: 20px; padding: 8px 16px 8px 16px; margin: 20px 0 10px 0;">질문</p>
			<a class="w3-right w3-button w3-medium"
				style="margin: 20px 0 10px 0;">질문하기</a>


			<div class="w3-row-padding">
				<c:forEach items="${questionList }" var="question">
					<form action="<c:url value="/question/questionDetail"/>"
						method="get">
						<div class="w3-col l3 m6" style="margin-bottom: 50px;">
							<h4>${question.QUE_TITLE }</h4>
							<hr>
							<input type="image"
								src="<c:url value="/resources/images/${question.QUE_IMAGE }.jpg"/>"
								style="max-width: 180px; max-height: 180px;">
							<hr>
							<p>${fn:substring(question.QUE_CONTENT, 0, 10) }</p>
							<input style="display: none;" value="${question.QUE_NO }"
								id="QUE_NO" name="QUE_NO">
						</div>
					</form>
				</c:forEach>
			</div>
		</div>
	</div>
</body>
</html>
