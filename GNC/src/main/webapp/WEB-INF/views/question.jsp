<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.green.domain.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- 질문 삭제 -->
<c:if test="${questionDelete eq 'questionDelete' }">
<script>
	alert("질문을 삭제하셨습니다.");
</script>
<c:remove var="questionDelete"/>
</c:if>

<c:set var="questionBegin" value="0" />
<c:set var="questionEnd" value="5" />
<c:if test="${end ne null }">
	<fmt:parseNumber var="end" type="number" value="${end}" />
	<c:set var="questionBegin" value="${end - 6 }" />
	<c:set var="questionEnd" value="${end - 1 }" />
</c:if>
<!DOCTYPE html>
<html>
<title>질문</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script
	src="${pageContext.request.contextPath}/resources/js/mypage.js?ver=0.12"></script>
<body>
	<form id="myQuestionForm" name="myQuestionForm"
		action="<c:url value="/question/myQuestion"/>">
		<input style="display: none;" id="MEM_NO" name="MEM_NO"
			value="${nokey}">
	</form>

	<jsp:include page="sidebar.jsp" />

	<div style="margin: 0 0 0 250px;">
		<div class="w3-content w3-padding"
			style="max-width: 1500px; padding-top: 0px !important;">
			<c:choose>
				<c:when test="${myQuestion eq 'myQuestion' }">
					<p class="w3-left"
						style="font-size: 20px; padding: 8px 16px 8px 16px; margin: 20px 0 10px 0;">내
						질문</p>
				</c:when>
				<c:otherwise>
					<p class="w3-left"
						style="font-size: 20px; padding: 8px 16px 8px 16px; margin: 20px 0 10px 0;">질문</p>
				</c:otherwise>
			</c:choose>

			<c:if test="${idkey ne null && pwkey ne null }">
				<a class="w3-right w3-button w3-medium"
					style="margin: 20px 0 10px 0;"
					href="<c:url value="/question/questionWrite"/>">작성하기</a>
				<c:choose>
					<c:when test="${myQuestion eq 'myQuestion' }">
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
				<c:forEach items="${questionList }" var="question"
					begin="${questionBegin }" end="${questionEnd }">
					<form action="<c:url value="/question/questionDetail"/>"
						method="get">
						<div class="w3-col l3 m6"
							style="margin: 0 20px 50px 20px; height: 400px;">
							<h4>${question.QUE_TITLE }</h4>
							<hr>
							<input type="image"
								src="<c:url value="/resources/images/${question.QUE_IMAGE }"/>"
								style="max-width: 270px; height: 180px;">
							<hr>
							<p>${fn:substring(question.QUE_CONTENT, 0, 50)}</p>
							<input style="display: none;" value="${question.QUE_NO }"
								id="QUE_NO" name="QUE_NO">
							<c:choose>
								<c:when test="${myQuestion eq 'myQuestion' }">
									<a
										href="<c:url value="/question/questionModify?QUE_NO=${question.QUE_NO }"/>"
										class="w3-button w3-block w3-light-grey w3-padding">수정하기</a>
									<br>
									<a onclick="myQuestionDelete(${question.QUE_NO})"
										class="w3-button w3-block w3-light-grey w3-padding">삭제하기</a>
								</c:when>

								<c:when test="${lenokey eq '1' }">
									<a onclick="questionDelete(${question.QUE_NO})"
										class="w3-button w3-block w3-light-grey w3-padding">삭제하기</a>
								</c:when>
							</c:choose>
						</div>
					</form>
				</c:forEach>
			</div>

			<div style="margin-left: 25px;">
				<c:if test="${questionList.size() > 6 }">
					<c:choose>
						<c:when test="${myQuestion eq 'myQuestion' }">
							<c:forEach items="${questionList }" step="6">
								<c:set var="i" value="${i+1 }"></c:set>
								<input class="w3-button" type="submit"
									onclick="myQuestionButton(${i*6})" value="${i }"></input>
							</c:forEach>
						</c:when>

						<c:otherwise>
							<c:forEach items="${questionList }" step="6">
								<c:set var="i" value="${i+1 }"></c:set>
								<input class="w3-button" type="submit"
									onclick="questionButton(${i*6})" value="${i }"></input>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</c:if>
			</div>
		</div>
	</div>
	
		<form name="questionDeleteForm" action="<c:url value="/question/questionDelete"/>" method="post" style="display:none;">
		<input name="QUE_NO">
	</form>
	
		<form name="myQuestionDeleteForm"
		action="<c:url value="/question/myQuestionDelete"/>" method="post"
		style="display: none;">
		<input name="QUE_NO">
		<input style="display: none;" id="MEM_NO" name="MEM_NO"
			value="${nokey }">
	</form>

	<script>
	function myQuestionButton(button) {
		document.myQuestionBoardForm.end.value = button;
		document.myQuestionBoardForm.submit();
	}

	function questionButton(button) {
		document.questionBoardForm.end.value = button;
		document.questionBoardForm.submit();
	}
	
	function questionDelete(queNo) {
		if (confirm("삭제하시겠습니까?") == true){ //확인
			document.questionDeleteForm.QUE_NO.value = queNo;
			document.questionDeleteForm.submit();
		}else{ //취소
			return false;
		}
	}
	
	function myQuestionDelete(queNo) {
		if (confirm("삭제하시겠습니까?") == true){ //확인
			document.myQuestionDeleteForm.QUE_NO.value = queNo;
			document.myQuestionDeleteForm.submit();
		}else{ //취소
			return false;
		}
	}
	</script>

	<form method="get" action="<c:url value="/question/myQuestionBoard"/>"
		name="myQuestionBoardForm" style="display: none;">
		<input name="MEM_NO" style="display: none;" value="${nokey}">
		<input name="end" style="display: none;">
	</form>

	<form method="get" action="<c:url value="/question/questionBoard"/>"
		name="questionBoardForm" style="display: none;">
		<input name="end" style="display: none;">
	</form>

</body>

</html>