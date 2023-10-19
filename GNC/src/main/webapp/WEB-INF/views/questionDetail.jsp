<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.green.domain.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<title>질문 상세</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<body>
	<jsp:include page="sidebar.jsp" />

	<div style="margin: 0 0 0 250px;">
		<div class="w3-content w3-padding"
			style="max-width: 1500px; padding-top: 0px !important;">
			<p class="w3-left"
				style="font-size: 20px; padding: 8px 16px 8px 16px; margin: 20px 0 10px 0;">질문</p>

			<c:if test="${idkey ne null && pwkey ne null }">
				<a class="w3-right w3-button w3-medium"
					style="margin: 20px 0 10px 0;"
					href="<c:url value="/question/questionWrite"/>">작성하기</a>
				<c:choose>
					<c:when test="${questionDetail eq 'questionDetail' }">
						<a class="w3-right w3-button w3-medium"
							style="margin: 20px 0 10px 0;" href="<c:url value="/question"/>">질문</a>
					</c:when>

					<c:otherwise>
						<a class="w3-right w3-button w3-medium"
							style="margin: 20px 0 10px 0;" onclick="myQuestion()">내 질문</a>
					</c:otherwise>
				</c:choose>
			</c:if>


			<div class="w3-row-padding">
				<c:forEach items="${questionList }" var="question">
					<h4>${question.QUE_TITLE }</h4>
					<c:if test="${question.QUE_IMAGE ne 'noimg.jpg' }">
						<hr>
						<img
							src="<c:url value="/resources/images/${question.QUE_IMAGE }"/>"
							style="max-width: 400px; max-height: 400px;">
					</c:if>
					<hr>
					<p>${question.QUE_CONTENT }</p>

					<c:if test="${idkey ne null && pwkey ne null }">
						<hr>
						<a
							href="<c:url value="/answer/answerWrite?QUE_NO=${question.QUE_NO }"/>"
							class="w3-button w3-block w3-light-grey w3-padding">답변하기</a>
					</c:if>

					<c:if test="${lenokey eq '1' }">
					<br>
						<a onclick="questionDelete(${question.QUE_NO})"
							class="w3-button w3-block w3-light-grey w3-padding">삭제하기</a>
					</c:if>
				</c:forEach>
			</div>
		</div>
	</div>
	<form name="questionDeleteForm"
		action="<c:url value="/question/questionDelete"/>" method="post"
		style="display: none;">
		<input name="QUE_NO">
	</form>

	<script>
	function questionDelete(queNo) {
		if (confirm("삭제하시겠습니까?") == true){ //확인
			document.questionDeleteForm.QUE_NO.value = queNo;
			document.questionDeleteForm.submit();
		}else{ //취소
			return false;
		}
	}
	</script>
</body>
</html>
