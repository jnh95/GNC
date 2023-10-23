<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.green.domain.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
			value="${nokey}">
	</form>
	<jsp:include page="sidebar.jsp" />

	<c:choose>
		<c:when test="${blogModify eq 'blogModify' }">
			<c:forEach items="${blogList }" var="blog">
				<div style="margin: 0 0 0 250px;">
					<div class="w3-content w3-padding"
						style="max-width: 1500px; padding-top: 0px !important;">
						<p class="w3-left"
							style="font-size: 20px; padding: 8px 16px 8px 16px; margin: 20px 0 10px 0;">블로그
							작성하기</p>

						<div class="w3-row-padding">
							<form:form method="post" modelAttribute="blogChange"
								action="${pageContext.request.contextPath}/blog/blogChange"
								enctype="multipart/form-data">

								<div style="padding: 10px;">
									<input name="BLO_TITLE" placeholder="제목을 입력해주세요."
										style="width: 1200px;" value="${blog.BLO_TITLE }" />
								</div>

								<div style="padding: 10px;">
									<input name="BLO_CONTENT" placeholder="내용을 입력해주세요."
										style="width: 1200px; height: 1000px;"
										value="${blog.BLO_CONTENT }" />
								</div>

								<div style="padding: 10px;">
									<c:if test="${not empty blog.BLO_IMAGE }">
										<img
											src="<c:url value="/resources/images/${blog.BLO_IMAGE }"/>"
											onclick="img()" id="bloImg"
											style="max-width: 300px; max-height: 300px;">
										<input id="file" name="fileName" type="file"
											style="display: none;" accept="image/jpeg"
											onchange="change(event)" />
									</c:if>

									<c:if test="${empty blog.BLO_IMAGE }">
										<img src="<c:url value="/resources/images/noimg.jpg"/>"
											onclick="img()" id="bloImg"
											style="max-width: 300px; max-height: 300px;">
										<input id="file" name="fileName" type="file"
											style="display: none;" accept="image/jpeg"
											onchange="change(event)" />
									</c:if>
								</div>
								<input name="BLO_NO" style="display: none;"
									value="${blog.BLO_NO }" />

								<input name="MEM_NO" style="display: none;"
									value="${blog.MEM_NO }" />

								<input name="BLO_IMAGE" style="display: none;"
									value="${blog.BLO_IMAGE }" />

								<button class="w3-button w3-right"
									style="border: 1px solid #000; border-radius: 20px;">작성하기</button>
							</form:form>
						</div>
					</div>
				</div>
			</c:forEach>
		</c:when>

		<c:otherwise>
<!-- 		작성하기 -->
			<div style="margin: 0 0 0 250px;">
				<div class="w3-content w3-padding"
					style="max-width: 1500px; padding-top: 0px !important;">
					<p class="w3-left"
						style="font-size: 20px; padding: 8px 16px 8px 16px; margin: 20px 0 10px 0;">블로그
						작성하기</p>

					<div class="w3-row-padding">
						<form:form method="post" modelAttribute="blog"
							action="${pageContext.request.contextPath}/blog/blogInsert"
							enctype="multipart/form-data">
							<div style="padding: 10px;">
								<input name="BLO_TITLE" placeholder="제목을 입력해주세요."
									style="width: 1200px;">
							</div>
<input hidden='hidden'/>
							<div style="padding: 10px;">
								<input name="BLO_CONTENT" placeholder="내용을 입력해주세요."
									style="width: 1200px; height: 1000px;">
							</div>

							<img src="<c:url value="/resources/images/noimg.jpg"/>"
								onclick="img()" id="bloImg"
								style="max-width: 300px; max-height: 300px;">
							<input id="file" name="fileName" type="file"
								style="display: none;" accept="image/jpeg"
								onchange="change(event)" />

							<input name="MEM_NO" style="display: none;" value="${nokey}">

							<input name="BLO_IMAGE" style="display: none;" value="noimg.jpg" />

							<button class="w3-button w3-right"
								style="border: 1px solid #000; border-radius: 20px;">작성하기</button>
						</form:form>
					</div>
				</div>
			</div>
		</c:otherwise>
	</c:choose>
</body>
<script>
	function img() {
		document.getElementById('file').click();
	}

	function change(event) {
		var reader = new FileReader();

		reader.onload = function(event) {
			let img = document.getElementById("bloImg");
			document.querySelector('#bloImg').style.display = "block";
			img.setAttribute("src", event.target.result);
		};

		reader.readAsDataURL(event.target.files[0]);
	}
</script>
</html>