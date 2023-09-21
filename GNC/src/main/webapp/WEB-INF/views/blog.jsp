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
<title>블로그</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<body>
<jsp:include page="sidebar.jsp" />

<div style="margin: 0 0 0 250px;">
<div class="w3-content w3-padding"
		style="max-width: 1500px; padding-top: 0px !important;">
		<p style="font-size: 20px;">블로그</p>

		<hr>

		<div class="w3-row-padding w3-grayscale">
			<c:forEach items="${blogList }" var="blog">
				<form action="<c:url value="/blog/blogDetail"/>" method="get" id="blogForm" name="blogForm">
				<div class="w3-col l3 m6" style="margin-bottom:50px;">
					<a>${blog.BLO_TITLE }</a>
					<hr>
					<input type="image" style="width: 100%">
					<hr>
					<a>${blog.BLO_CONTENT }</a>
					<input style="display:none;" value="${blog.BLO_NO }" id="BLO_NO" name="BLO_NO">
				</div>
				</form>
			</c:forEach>
		</div>
	</div>
</div>

</body>
</html> 
