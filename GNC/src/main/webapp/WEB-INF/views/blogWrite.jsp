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

String blogModify = (String) request.getAttribute("blogModify");
%>
<!DOCTYPE html>
<html>
<title>블로그</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script
	src="${pageContext.request.contextPath}/resources/js/mypage.js?ver=0.12"></script>
<body>
	<form id="myBlogForm" name="myBlogForm"
		action="<c:url value="/blog/myBlog"/>">
		<input style="display: none;" id="myBlog" name="myBlog"
			value="<%=memNo%>">
	</form>
	<jsp:include page="sidebar.jsp" />

	<%
	if ("blogModify".equals(blogModify)) {
	%>
	<c:forEach items="${blogList }" var="blog">
		<div style="margin: 0 0 0 250px;">
			<div class="w3-content w3-padding"
				style="max-width: 1500px; padding-top: 0px !important;">
				<p class="w3-left"
					style="font-size: 20px; padding: 8px 16px 8px 16px; margin: 20px 0 10px 0;">블로그
					작성하기</p>

				<div class="w3-row-padding">
					<form method="get">
						<div style="padding: 10px;">
							<input id="title" placeholder="제목을 입력해주세요."
								style="width: 1200px;" value="${blog.BLO_TITLE }">
						</div>

						<div style="padding: 10px;">
							<input id="content" placeholder="내용을 입력해주세요."
								style="width: 1200px; height: 1000px;" value="${blog.BLO_CONTENT }">
						</div>

						<div style="padding: 10px;">
							<img src="<c:url value="/resources/images/${blog.BLO_IMAGE }.jpg"/>">
						</div>

						<button class="w3-button w3-right"
							style="border: 1px solid #000; border-radius: 20px;">작성하기</button>
					</form>
				</div>
			</div>
		</div>
	</c:forEach>
	<%
	} else {
	%>
	<div style="margin: 0 0 0 250px;">
		<div class="w3-content w3-padding"
			style="max-width: 1500px; padding-top: 0px !important;">
			<p class="w3-left"
				style="font-size: 20px; padding: 8px 16px 8px 16px; margin: 20px 0 10px 0;">블로그
				작성하기</p>

			<div class="w3-row-padding">
				<form method="get">
					<div style="padding: 10px;">
						<input id="title" placeholder="제목을 입력해주세요." style="width: 1200px;">
					</div>

					<div style="padding: 10px;">
						<input id="content" placeholder="내용을 입력해주세요."
							style="width: 1200px; height: 1000px;">
					</div>

					<div style="padding: 10px;">
						<input id="image" placeholder="이미지를 넣어주세요." style="width: 1200px;">
					</div>

					<button class="w3-button w3-right"
						style="border: 1px solid #000; border-radius: 20px;">작성하기</button>
				</form>
			</div>
		</div>
	</div>
	<%
	}
	%>
</body>
</html>