<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.green.domain.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<title>답변 상세</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<body>
	<jsp:include page="sidebar.jsp" />

	<div style="margin: 0 0 0 250px;">
		<div class="w3-content w3-padding"
			style="max-width: 1500px; padding-top: 0px !important;">
			<p class="w3-left"
				style="font-size: 20px; padding: 8px 16px 8px 16px; margin: 20px 0 10px 0;">질문</p>
				
			<c:if test="${idkey ne null && pwkey ne null}">
				<c:choose>
					<c:when test="${answerDetail eq 'answerDetail' }">
						<a class="w3-right w3-button w3-medium" style="margin: 20px 0 10px 0;" href="<c:url value="/answer"/>">답변</a>
					</c:when>
						
					<c:otherwise>
						<a class="w3-right w3-button w3-medium" style="margin: 20px 0 10px 0;" onclick="myAnswer()">내 답변</a>
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
				</c:forEach>
			</div>

			<p class="w3-left"
				style="font-size: 20px; padding: 8px 16px 8px 16px; margin: 20px 0 10px 0;">질문에
				대한 답변</p>
			<div class="w3-row-padding">
				<c:forEach items="${answerList }" var="answer">
					<h4>${answer.ANS_TITLE }</h4>
					<c:if test="${answer.ANS_IMAGE ne 'noimg.jpg' }">
						<hr>
						<img src="<c:url value="/resources/images/${answer.ANS_IMAGE }"/>"
							style="max-width: 400px; max-height: 400px;">
					</c:if>
					<hr>
					<p>${answer.ANS_CONTENT }</p>
					
					<hr>
					<c:if test="${lenokey eq '1' }">
								<a onclick="answerDelete(${answer.ANS_NO})" class="w3-button w3-block w3-light-grey w3-padding">삭제하기</a>
							</c:if>
				</c:forEach>
			</div>
		</div>
	</div>
	
	<form name="answerDeleteForm" action="<c:url value="/answer/answerDelete"/>" method="post" style="display:none;">
		<input name="ANS_NO">
	</form>
	
	<script>
		function answerDelete(ansNo) {
		if (confirm("삭제하시겠습니까?") == true){ //확인
			document.answerDeleteForm.ANS_NO.value = ansNo;
			document.answerDeleteForm.submit();
		}else{ //취소
			return false;
		}
	}
	</script>

</body>
</html>
