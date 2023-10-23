<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.green.domain.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- 답변 삭제 -->
<c:if test="${answerDelete eq 'answerDelete' }">
	<script>
	alert("답변을 삭제하셨습니다.");
</script>
	<c:remove var="answerDelete" />
</c:if>

<c:set var="answerBegin" value="0" />
<c:set var="answerEnd" value="5" />
<c:if test="${end ne null }">
	<fmt:parseNumber var="end" type="number" value="${end}" />
	<c:set var="answerBegin" value="${end - 6 }" />
	<c:set var="answerEnd" value="${end - 1 }" />
</c:if>

<!DOCTYPE html>
<html>
<title>답변</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script
	src="${pageContext.request.contextPath}/resources/js/mypage.js?ver=0.12"></script>
<body>
	<form id="myAnswerForm" name="myAnswerForm"
		action="<c:url value="/answer/myAnswer"/>">
		<input style="display: none;" id="MEM_NO" name="MEM_NO"
			value="${nokey }">
	</form>

	<jsp:include page="sidebar.jsp" />

	<div style="margin: 0 0 0 250px;">
		<div class="w3-content w3-padding"
			style="max-width: 1500px; padding-top: 0px !important;">

			<c:choose>
				<c:when test="${myAnswer eq 'myAnswer' }">
					<p class="w3-left"
						style="font-size: 20px; padding: 8px 16px 8px 16px; margin: 20px 0 10px 0;">내
						답변</p>
				</c:when>
				<c:otherwise>
					<p class="w3-left"
						style="font-size: 20px; padding: 8px 16px 8px 16px; margin: 20px 0 10px 0;">답변</p>
				</c:otherwise>
			</c:choose>

			<c:if test="${idkey ne null && pwkey ne null}">
				<c:choose>
					<c:when test="${myAnswer eq 'myAnswer' }">
						<a class="w3-right w3-button w3-medium"
							style="margin: 20px 0 10px 0;" href="<c:url value="/answer"/>">답변</a>
					</c:when>

					<c:otherwise>
						<a class="w3-right w3-button w3-medium"
							style="margin: 20px 0 10px 0;" onclick="myAnswer()">내 답변</a>
					</c:otherwise>
				</c:choose>
			</c:if>

			<div class="w3-row-padding">
				<c:forEach items="${answerList }" var="answer"
					begin="${answerBegin }" end="${answerEnd }">
					<form action="<c:url value="/answer/answerDetail"/>" method="get">
						<div class="w3-col l3 m6"
							style="margin: 0 20px 120px 20px; height: 400px;">
							<h4>${answer.ANS_TITLE }</h4>
							<hr>
							<input type="image"
								src="<c:url value="/resources/images/${answer.ANS_IMAGE }"/>"
								style="max-width: 270px; height: 180px;">
							<hr>
							<p>${fn:substring(answer.ANS_CONTENT, 0, 50)}</p>
							<input style="display: none;" value="${answer.ANS_NO }"
								id="ANS_NO" name="ANS_NO"> <input style="display: none;"
								value="${answer.QUE_NO }" id="QUE_NO" name="QUE_NO">

							<c:choose>
								<c:when test="${myAnswer eq 'myAnswer' }">
									<a
										href="<c:url value="/answer/answerModify?ANS_NO=${answer.ANS_NO }"/>"
										class="w3-button w3-block w3-light-grey w3-padding">수정하기</a>
									<br>
									<a onclick="myAnswerDelete(${answer.ANS_NO})"
										class="w3-button w3-block w3-light-grey w3-padding">삭제하기</a>
								</c:when>

								<c:when test="${lenokey eq '1' }">
									<a onclick="answerDelete(${answer.ANS_NO})"
										class="w3-button w3-block w3-light-grey w3-padding">삭제하기</a>
								</c:when>
							</c:choose>

						</div>
					</form>
				</c:forEach>
			</div>

			<div style="margin-left: 25px;">
				<c:if test="${answerList.size() > 6 }">
					<c:choose>
						<c:when test="${myAnswer eq 'myAnswer' }">
							<c:forEach items="${answerList }" step="6">
								<c:set var="i" value="${i+1 }"></c:set>
								<input class="w3-button" type="submit"
									onclick="myAnswerButton(${i*6})" value="${i }"></input>
							</c:forEach>
						</c:when>

						<c:otherwise>
							<c:forEach items="${answerList }" step="6">
								<c:set var="i" value="${i+1 }"></c:set>
								<input class="w3-button" type="submit"
									onclick="answerButton(${i*6})" value="${i }"></input>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</c:if>
			</div>
		</div>
	</div>

	<form name="answerDeleteForm"
		action="<c:url value="/answer/answerDelete"/>" method="post"
		style="display: none;">
		<input name="ANS_NO">
	</form>
	
	<form name="myAnswerDeleteForm"
		action="<c:url value="/answer/myAnswerDelete"/>" method="post"
		style="display: none;">
		<input name="ANS_NO">
		<input style="display: none;" id="MEM_NO" name="MEM_NO"
			value="${nokey }">
	</form>

	<script>
	function myAnswerButton(button) {
		document.myAnswerBoardForm.end.value = button;
		document.myAnswerBoardForm.submit();
	}

	function answerButton(button) {
		document.answerBoardForm.end.value = button;
		document.answerBoardForm.submit();
	}
	
	function answerDelete(ansNo) {
		if (confirm("삭제하시겠습니까?") == true){ //확인
			document.answerDeleteForm.ANS_NO.value = ansNo;
			document.answerDeleteForm.submit();
		}else{ //취소
			return false;
		}
	}
	
	function myAnswerDelete(ansNo) {
		if (confirm("삭제하시겠습니까?") == true){ //확인
			document.myAnswerDeleteForm.ANS_NO.value = ansNo;
			document.myAnswerDeleteForm.submit();
		}else{ //취소
			return false;
		}
	}
	</script>

	<form method="get" action="<c:url value="/answer/myAnswerBoard"/>"
		name="myAnswerBoardForm" style="display: none;">
		<input name="MEM_NO" style="display: none;" value="${nokey }">
		<input name="end" style="display: none;">
	</form>

	<form method="get" action="<c:url value="/answer/answerBoard"/>"
		name="answerBoardForm" style="display: none;">
		<input name="end" style="display: none;">
	</form>

</body>

</html>