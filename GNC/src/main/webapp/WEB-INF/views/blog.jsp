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

String myBlog = (String) request.getAttribute("myBlog");

String end = (String) request.getAttribute("end");

int blogBegin = 0;
int blogEnd = 8;

if (end != null) {
	blogBegin = Integer.parseInt(end) - 9;
	blogEnd = Integer.parseInt(end) - 1;
}
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
		<input style="display: none;" id="MEM_NO" name="MEM_NO"
			value="<%=memNo%>">
	</form>

	<jsp:include page="sidebar.jsp" />

	<div style="margin: 0 0 0 250px;">
		<div class="w3-content w3-padding"
			style="max-width: 1500px; padding-top: 0px !important;">
			<%
			if ("myBlog".equals(myBlog)) {
			%>
			<p class="w3-left"
				style="font-size: 20px; padding: 8px 16px 8px 16px; margin: 20px 0 10px 0;">내
				블로그</p>
			<%
			} else {
			%><p class="w3-left"
				style="font-size: 20px; padding: 8px 16px 8px 16px; margin: 20px 0 10px 0;">블로그</p>
			<%
			}
			%>

			<%
			if (id != null & pw != null) {
			%>
			<a class="w3-right w3-button w3-medium"
				style="margin: 20px 0 10px 0;"
				href="<c:url value="/blog/blogWrite"/>">작성하기</a>
			<%
			if ("myBlog".equals(myBlog)) {
			%>
			<a class="w3-right w3-button w3-medium"
				style="margin: 20px 0 10px 0;" href="<c:url value="/blog"/>">블로그</a>
			<%
			} else {
			%>
			<a class="w3-right w3-button w3-medium"
				style="margin: 20px 0 10px 0;" onclick="myBlog()">내 블로그</a>
			<%
			}
			%>
			<%
			}
			%>

			<div class="w3-row-padding">
				<c:forEach items="${blogList }" var="blog" begin="<%=blogBegin %>"
					end="<%=blogEnd %>">
					<form action="<c:url value="/blog/blogDetail"/>" method="get">
						<div class="w3-col l3 m6" style="margin: 0 20px 50px 20px;">
							<h4>${blog.BLO_TITLE }</h4>
							<hr>
							<input type="image"
								src="<c:url value="/resources/images/${blog.BLO_IMAGE }"/>"
								style="max-width: 180px; max-height: 180px;">
							<hr>
							<p>${blog.BLO_CONTENT }</p>
							<input style="display: none;" value="${blog.BLO_NO }" id="BLO_NO"
								name="BLO_NO">
							<%
							if ("myBlog".equals(myBlog)) {
							%>
							<a
								href="<c:url value="/blog/blogModify?BLO_NO=${blog.BLO_NO }"/>"
								class="w3-button w3-block w3-light-grey w3-padding">수정하기</a>
							<%
							}
							%>
						</div>
					</form>
				</c:forEach>
			</div>

			<div style="margin-left: 25px;">
				<c:if test="${blogList.size() > 9 }">
					<c:choose>
						<c:when test="${myBlog eq 'myBlog' }">
							<c:forEach items="${blogList }" step="9">
								<c:set var="i" value="${i+1 }"></c:set>
								<input type="submit" onclick="MyBlogButton(${i*9})"
									value="${i }"></input>
							</c:forEach>
						</c:when>

						<c:otherwise>
							<c:forEach items="${blogList }" step="9">
								<c:set var="i" value="${i+1 }"></c:set>
								<input type="submit" onclick="blogButton(${i*9})" value="${i }"></input>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</c:if>
			</div>
		</div>
	</div>

	<script>
	function myBlogButton(button) {
		document.myBlogBoardForm.end.value = button;
		document.myBlogBoardForm.submit();
	}

	function blogButton(button) {
		document.blogBoardForm.end.value = button;
		document.blogBoardForm.submit();
	}
	</script>

	<form method="get" action="<c:url value="/blog/myBlogBoard"/>"
		name="myBlogBoardForm" style="display: none;">
		<input name="MEM_NO" style="display: none;" value="<%=memNo%>">
		<input name="end" style="display: none;">
	</form>

	<form method="get" action="<c:url value="/blog/blogBoard"/>"
		name="blogBoardForm" style="display: none;">
		<input name="end" style="display: none;">
	</form>

</body>

</html>