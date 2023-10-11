<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.green.domain.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script
	src="${pageContext.request.contextPath}/resources/js/join.js?ver=0.11"></script>
<title>GNC 회원가입</title>
</head>
<body>
	<!-- 좌상단 GNC 우상단 로그인 -->
	<div style="margin: 5px;">
		<a href="<c:url value="/"/>" class="w3-bar-item w3-button w3-xlarge"><b>GNC</b></a>
		<!-- 로그인 버튼  -->
		<div class="w3-right" style="margin-top: 2px;">
			<jsp:include page="login.jsp" />
		</div>
	</div>
	<form style="display: none;" id="idCheckForm" name="idCheckForm"
		method="get" action="<c:url value="/join/idCheck"/>">
		<input id="idInput" name="idInput"> <input id="nameInput"
			name="nameInput"> <input id="pwdInput" name="pwdInput">
		<input id="pwd2Input" name="pwd2Input"> <input id="phoneInput"
			name="phoneInput"> <input id="mailInput" name="mailInput">
		<input id="addInput" name="addInput"> <input id="birthInput"
			name="birthInput">
	</form>


	<div class="w3-modal-content w3-card-4" style="max-width: 600px">

		<form name="joinForm" id="joinForm" class="w3-container"
			action="<c:url value="/join"/>" method="post">
			<div class="w3-section">

				<c:choose>

					<c:when test="${existId == 'exist' }">
						<script>
							alert("이미 있는 Id입니다.");
						</script>

						<label><b>이름</b></label>

						<input id="name" name="MEM_NAME"
							class="w3-input w3-border w3-margin-bottom" type="text"
							placeholder="이름을 입력해주세요." value="${useName }" required />

						<div>
							<label><b>ID</b></label>
							<input id="id" name="MEM_ID" class="w3-input w3-border"
								type="text" maxlength="16" placeholder="ID를 입력해주세요." required />

							<a class="w3-right" onclick="idCheck()" style="cursor: pointer;">ID
								중복 검사</a>
						</div>

						<div class="w3-margin-bottom w3-margin-top">
							<label><b>비밀번호</b></label>
							<input id="pwd" name="MEM_PWD"
								class="w3-input w3-border" style="margin-bottom: 5px;"
								type="password" placeholder="비밀번호를 입력해주세요." maxlength="16"
								value="${usePwd }" required />
							<input id="pwd2" name="MEM_PWD2"
								class="w3-input w3-border" type="password"
								style="margin-bottom: 0px;" maxlength="16"
								value="${usePwd2 }" placeholder="동일한 비밀번호를 입력해주세요." required />
								
							<a class="w3-right"
								onclick="pwdOn4()" id="pwd3"
								style="display: block; cursor: pointer;">비밀번호 보기</a>
							<a
								class="w3-right" onclick="pwdOff4()" id="pwd4"
								style="display: none; cursor: pointer;">비밀번호 숨기기</a>
						</div>

						<label><b>전화번호</b></label>

						<input id="MEM_PHONE" name="MEM_PHONE"
							class="w3-input w3-border w3-margin-bottom" type="text"
							value="${usePhone }" placeholder="-를 빼고 전화번호를 입력해주세요." maxlength="11" />

						<label><b>이메일</b></label>

						<input id="MEM_MAIL" name="MEM_MAIL"
							class="w3-input w3-border w3-margin-bottom" type="text"
							value="${useMail }" placeholder="이메일을 입력해주세요." />

						<label><b>주소</b></label>

						<input id="MEM_ADD" name="MEM_ADD"
							class="w3-input w3-border w3-margin-bottom" type="text"
							value="${useAdd }" maxlength="50" placeholder="주소를 적어주세요." />

						<label><b>생년월일</b></label>

						<input id="MEM_BIRTH" name="MEM_BIRTH" class="w3-input w3-border"
							value="${useBirth }" type="text" maxlength="8" placeholder="예시 : 19990101" />
					</c:when>


					<c:when test="${useId != null }">
						<script>
							alert("사용가능한 Id입니다.");
						</script>
						
						<label><b>이름</b></label>
						<input id="name" name="MEM_NAME"
							class="w3-input w3-border w3-margin-bottom" type="text"
							placeholder="이름을 입력해주세요." value="${useName }" required />

						<label><b>ID</b></label>
						<input id="id" name="MEM_ID" class="w3-input w3-border"
							type="text" maxlength="16" placeholder="ID를 입력해주세요."
							value="${useId }" required />

						<a class="w3-right" onclick="idCheck()" style="cursor: pointer;">ID
							중복 검사</a>

						<div class="w3-margin-bottom w3-margin-top">
							<label><b>비밀번호</b></label>
							<input id="pwd" name="MEM_PWD"
								class="w3-input w3-border" style="margin-bottom: 5px;"
								type="password" placeholder="비밀번호를 입력해주세요." maxlength="16"
								value="${usePwd }" required />
							<input id="pwd2" name="MEM_PWD2"
								class="w3-input w3-border" type="password"
								style="margin-bottom: 0px;" maxlength="16"
								value="${usePwd2 }" placeholder="동일한 비밀번호를 입력해주세요." required />
							<a class="w3-right"
								onclick="pwdOn4()" id="pwd3"
								style="display: block; cursor: pointer;">비밀번호 보기</a>
							<a
								class="w3-right" onclick="pwdOff4()" id="pwd4"
								style="display: none; cursor: pointer;">비밀번호 숨기기</a>
						</div>

						<label><b>전화번호</b></label>

						<input id="MEM_PHONE" name="MEM_PHONE"
							class="w3-input w3-border w3-margin-bottom" type="text"
							value="${usePhone }" placeholder="-를 빼고 전화번호를 입력해주세요." maxlength="11" />

						<label><b>이메일</b></label>

						<input id="MEM_MAIL" name="MEM_MAIL"
							class="w3-input w3-border w3-margin-bottom" type="text"
							value="${useMail }" placeholder="이메일을 입력해주세요." />

						<label><b>주소</b></label>

						<input id="MEM_ADD" name="MEM_ADD"
							class="w3-input w3-border w3-margin-bottom" type="text"
							value="${useAdd }" maxlength="50" placeholder="주소를 적어주세요." />

						<label><b>생년월일</b></label>

						<input id="MEM_BIRTH" name="MEM_BIRTH" class="w3-input w3-border"
							value="${useBirth }" type="text" maxlength="8" placeholder="예시 : 19990101" />

					</c:when>

					<c:otherwise>
						<label><b>이름</b></label>
						<input id="name" name="MEM_NAME"
							class="w3-input w3-border w3-margin-bottom" type="text"
							placeholder="이름을 입력해주세요." value="${useName }" required />
					
						<label><b>ID</b></label>
						<input id="id" name="MEM_ID" class="w3-input w3-border"
							type="text" maxlength="16" placeholder="ID를 입력해주세요." required />

						<a class="w3-right" onclick="idCheck()" style="cursor: pointer;">ID
							중복 검사</a>

						<div class="w3-margin-bottom w3-margin-top">
							<label><b>비밀번호</b></label> <input id="pwd" name="MEM_PWD"
								class="w3-input w3-border" style="margin-bottom: 5px;"
								type="password" placeholder="비밀번호를 입력해주세요." maxlength="16"
								required /> <input id="pwd2" name="MEM_PWD2"
								class="w3-input w3-border" type="password"
								style="margin-bottom: 0px;" maxlength="16"
								placeholder="동일한 비밀번호를 입력해주세요." required /> <a class="w3-right"
								onclick="pwdOn4()" id="pwd3"
								style="display: block; cursor: pointer;">비밀번호 보기</a> <a
								class="w3-right" onclick="pwdOff4()" id="pwd4"
								style="display: none; cursor: pointer;">비밀번호 숨기기</a>
						</div>

						<label><b>전화번호</b></label>
						<input id="MEM_PHONE" name="MEM_PHONE"
							class="w3-input w3-border w3-margin-bottom" type="text"
							placeholder="-를 빼고 전화번호를 입력해주세요." maxlength="11" />
						<label><b>이메일</b></label>

						<input id="MEM_MAIL" name="MEM_MAIL"
							class="w3-input w3-border w3-margin-bottom" type="text"
							placeholder="이메일을 입력해주세요." />
						<label><b>주소</b></label>
						<input id="MEM_ADD" name="MEM_ADD"
							class="w3-input w3-border w3-margin-bottom" type="text"
							maxlength="50" placeholder="주소를 적어주세요." />
						<label><b>생년월일</b></label>

						<input id="MEM_BIRTH" name="MEM_BIRTH" class="w3-input w3-border"
							type="text" maxlength="8" placeholder="예시 : 19990101" />
					</c:otherwise>
				</c:choose>
			</div>

			<input id="hiddenId" name="hiddenId" style="display: none;"
				value="${useId }" />
		</form>

		<button class="w3-button w3-block w3-light-grey" onclick="join()">회원가입하기</button>
		<a href="<c:url value="/"/>" class="w3-button w3-block w3-red w3-padding">취소</a>
	</div>

</body>
</html>