<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.green.domain.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- 블로그 삭제 -->
<c:if test="${blogDelete eq 'blogDelete' }">
	<script>
	alert("블로그를 삭제하셨습니다.");
</script>
	<c:remove var="blogDelete" />
</c:if>

<c:set var="blogBegin" value="0" />
<c:set var="blogEnd" value="5" />
<c:if test="${end ne null }">
	<fmt:parseNumber var="end" type="number" value="${end}" />
	<c:set var="blogBegin" value="${end - 6 }" />
	<c:set var="blogEnd" value="${end - 1 }" />
</c:if>

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
			value="${nokey }">
	</form>

	<jsp:include page="sidebar.jsp" />

	<div style="margin: 0 0 0 250px;">
		<div class="w3-content w3-padding"
			style="max-width: 1500px; padding-top: 0px !important;">

			<c:choose>
				<c:when test="${myBlog eq 'myBlog' }">
					<p class="w3-left"
						style="font-size: 20px; padding: 8px 16px 8px 16px; margin: 20px 0 10px 0;">내
						블로그</p>
				</c:when>
				<c:otherwise>
					<p class="w3-left"
						style="font-size: 20px; padding: 8px 16px 8px 16px; margin: 20px 0 10px 0;">블로그</p>
				</c:otherwise>
			</c:choose>

			<c:if test="${idkey ne null && pwkey ne null}">
				<a class="w3-right w3-button w3-medium"
					style="margin: 20px 0 10px 0;"
					href="<c:url value="/blog/blogWrite"/>">작성하기</a>
				<c:choose>
					<c:when test="${myBlog eq 'myBlog' }">
						<a class="w3-right w3-button w3-medium"
							style="margin: 20px 0 10px 0;" href="<c:url value="/blog"/>">블로그</a>
					</c:when>

					<c:otherwise>
						<a class="w3-right w3-button w3-medium"
							style="margin: 20px 0 10px 0;" onclick="myBlog()">내 블로그</a>
					</c:otherwise>
				</c:choose>
			</c:if>

			<div class="w3-row-padding">
				<c:forEach items="${blogList }" var="blog" begin="${blogBegin }"
					end="${blogEnd }">
					<form action="<c:url value="/blog/blogDetail"/>" method="get">
						<div class="w3-col l3 m6"
							style="margin: 0 20px 50px 20px; height: 400px;">
							<h4>${blog.BLO_TITLE }</h4>
							<hr>
							<input type="image"
								src="<c:url value="/resources/images/${blog.BLO_IMAGE }"/>"
								style="max-width: 270px; height: 180px;">
							<hr>
							<p>${blog.BLO_CONTENT }</p>
							<input style="display: none;" value="${blog.BLO_NO }" id="BLO_NO"
								name="BLO_NO">

							<c:choose>
								<c:when test="${myBlog eq 'myBlog' }">
									<a
										href="<c:url value="/blog/blogModify?BLO_NO=${blog.BLO_NO }"/>"
										class="w3-button w3-block w3-light-grey w3-padding">수정하기</a>
									<br>
									<a onclick="myBlogDelete(${blog.BLO_NO})"
										class="w3-button w3-block w3-light-grey w3-padding">삭제하기</a>
								</c:when>

								<c:when test="${lenokey eq '1' }">
									<a onclick="blogDelete(${blog.BLO_NO})"
										class="w3-button w3-block w3-light-grey w3-padding">삭제하기</a>
								</c:when>
							</c:choose>

						</div>
					</form>
				</c:forEach>
			</div>

			<div style="margin-left: 25px;">
				<c:if test="${blogList.size() > 6 }">
					<c:choose>
						<c:when test="${myBlog eq 'myBlog' }">
							<c:forEach items="${blogList }" step="6">
								<c:set var="i" value="${i+1 }"></c:set>
								<input class="w3-button" type="submit"
									onclick="myBlogButton(${i*6})" value="${i }"></input>
							</c:forEach>
						</c:when>

						<c:otherwise>
							<c:forEach items="${blogList }" step="6">
								<c:set var="i" value="${i+1 }"></c:set>
								<input class="w3-button" type="submit"
									onclick="blogButton(${i*6})" value="${i }"></input>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</c:if>
			</div>
		</div>
	</div>

	<form name="blogDeleteForm" action="<c:url value="/blog/blogDelete"/>"
		method="post" style="display: none;">
		<input name="BLO_NO">
	</form>

	<form name="myBlogDeleteForm" action="<c:url value="/blog/myBlogDelete"/>"
		method="post" style="display: none;">
		<input name="BLO_NO"> <input style="display: none;"
			id="MEM_NO" name="MEM_NO" value="${nokey }">
	</form>

	<script>
	function myBlogButton(button) {
		document.myBlogBoardForm.end.value = button;
		document.myBlogBoardForm.submit();
	}

	function blogButton(button) {
		document.blogBoardForm.end.value = button;
		document.blogBoardForm.submit();
	}
	
	function blogDelete(bloNo) {
		if (confirm("삭제하시겠습니까?") == true){ //확인
			document.blogDeleteForm.BLO_NO.value = bloNo;
			document.blogDeleteForm.submit();
		}else{ //취소
			return false;
		}
	}
	
	function myBlogDelete(bloNo) {
		if (confirm("삭제하시겠습니까?") == true){ //확인
			document.myBlogDeleteForm.BLO_NO.value = bloNo;
			document.myBlogDeleteForm.submit();
		}else{ //취소
			return false;
		}
	}
	</script>

	<form method="get" action="<c:url value="/blog/myBlogBoard"/>"
		name="myBlogBoardForm" style="display: none;">
		<input name="MEM_NO" style="display: none;" value="${nokey }">
		<input name="end" style="display: none;">
	</form>

	<form method="get" action="<c:url value="/blog/blogBoard"/>"
		name="blogBoardForm" style="display: none;">
		<input name="end" style="display: none;">
	</form>

</body>

</html>