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
<title>질문</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<body>
<jsp:include page="sidebar.jsp" />

<div style="margin: 0 0 0 250px;">
	<div class="w3-content w3-padding"
		style="max-width: 1500px; padding-top: 0px !important;">
		<p style="font-size: 20px;">질문</p>

		<hr>

		<div class="w3-row-padding w3-grayscale">
			<c:forEach items="${questionList }" var="question">
				<div class="w3-col l3 m6" style="margin-bottom:50px;">
					<h4>${question.QUE_TITLE }</h4>
					<hr>
					<img alt="메인 사진" style="width: 100%">
					<hr>
					<p>${question.QUE_CONTENT }</p>
				</div>
			</c:forEach>
		</div>
	</div>
</div>
</body>
</html> 
