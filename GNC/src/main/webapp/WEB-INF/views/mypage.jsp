<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%
request.setCharacterEncoding("UTF-8");

String name = (String) session.getAttribute("namekey");
String id = (String) session.getAttribute("idkey");
String pw = (String) session.getAttribute("pwkey");
String date = (String) session.getAttribute("datekey");
String phone = (String) session.getAttribute("phonekey");
String mail = (String) session.getAttribute("mailkey");
String add = (String) session.getAttribute("addkey");
String birth = (String) session.getAttribute("birthkey");
%>
<!DOCTYPE html>
<html>
<head>
<title>GNC</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link href="<c:url value="/resources/css/mypage.css"/>" rel="stylesheet">
<script
	src="${pageContext.request.contextPath}/resources/js/mypage.js?ver=0.2"></script>
</head>
<body>
	<!-- 좌상단 GNC 우상단 로그인 -->
	<div style="margin: 5px;">
		<a href="<c:url value="/"/>" class="w3-bar-item w3-button w3-xlarge"><b>GNC</b></a>
		<%
		if (id == null & pw == null) {
		%>
		<!-- 로그인 버튼  -->
		<div class="w3-right" style="margin-top: 2px;">
			<jsp:include page="login.jsp" />
		</div>

		<%
		} else {
		%>
		<!-- 로그인이 되었을 때  -->
		<form action="<c:url value="/logout"/>" method="post" class="w3-right"
			style="margin-top: 8px;">
			안녕하세요. <a href="<c:url value="/mypage"/>" class="w3-button"
				style="margin-bottom: 4px; padding: 10px;"><%=name%>님 </a>
			<button type="submit" class="w3-button"
				style="margin-bottom: 4px; padding: 10px;">로그아웃</button>
		</form>
	</div>
	<%
	}
	%>

	<div class="w3-modal-content w3-card-4" style="max-width: 600px">

		<div class="w3-section">

			<!-- 이름 -->
			<div style="padding: 16px 10px 0px 10px;">
				<label><b>이름</b></label>
				<div>
					<%=name%>
				</div>
			</div>

			<!-- ID -->
			<div style="padding: 16px 10px 0px 10px;">
				<label><b>ID</b></label>
				<div>
					<%=id%>
				</div>
			</div>

			<!-- 가입일 -->
			<div style="padding: 16px 10px 0px 10px;">
				<label><b>가입일</b></label>
				<div>
					<%=date%>
				</div>
			</div>

			<div style="padding: 16px 10px 0px 10px;">
				<label><b id="pw">비밀번호</b></label>
				<div class="space">
					<div id="pwBox" style="padding: 10px 0 0 0;">
						<a id="pw2"> **** </a>
						<a id="pw12" class="nonebox"> <%=pw%>
						</a>

						<form action="<c:url value="/mypage/pw"/>" method="post"
							name="pw7" id="pw7">
							<input class="nonebox" name="pw4" id="pw4"
								placeholder="영어와 숫자를 입력해주세요."
								style="width: 220px; margin-bottom: 5px;" maxlength="20"
								type="password"></input> <input class="nonebox" name="pw5"
								id="pw5" placeholder="동일한 비밀번호를 입력하세요." style="width: 220px;"
								type="password" maxlength="20"></input>
						</form>
					</div>

					<div style="padding: 8px 0 0 0;">

						<button class="buttonbox blockbox" id="pw1"
							style="margin-left: 10px;" onclick="pwChangeOn()">수정</button>
						<button class="buttonbox" id="pw10" onclick="pwOn()">보기</button>
						<button class="buttonbox nonebox" id="pw11" onclick="pwOff()">숨기기</button>

						<div>
							<button class="buttonbox nonebox" id="pw3" onclick="pwModify()">수정
								완료</button>
						</div>

						<div style="margin-top: 30px;">
							<button class="buttonbox nonebox" id="pw6"
								style="margin-left: 10px;" onclick="pwChangeOff()">취소</button>
							<button class="buttonbox nonebox" id="pw8" onclick="pwOn2()">보기</button>
							<button class="buttonbox nonebox" id="pw9" onclick="pwOff2()">숨기기</button>
						</div>

					</div>

				</div>
			</div>

			<div style="padding: 8px 10px 0px 10px;">
				<label><b id="phone">전화번호</b></label>
				<div class="space">
					<div style="padding: 8px 0 0 0;">
						<a id="phone2"> <%=phone%>
						</a>
						<form action="<c:url value="/mypage/phone"/>" method="post"
							name="phone6" id="phone6">
							<input class="nonebox" name="phone4" id="phone4"
								placeholder="-를 빼고 전화번호를 입력해주세요." style="width: 220px;"
								maxlength="11"></input>
						</form>
					</div>

					<div style="padding: 8px 0 0 0;">
						<button class="buttonbox blockbox" id="phone1"
							onclick="phoneChangeOn()">수정</button>

						<div>
							<button class="buttonbox nonebox" id="phone3"
								onclick="phoneModify()">수정 완료</button>
						</div>

						<div style="margin-top: 30px;">
							<button class="buttonbox nonebox" id="phone5"
								onclick="phoneChangeOff()">취소</button>
						</div>

					</div>

				</div>
			</div>

			<div style="padding: 8px 10px 0px 10px;">
				<label><b id="mail">이메일</b></label>
				<div class="space">
					<div style="padding: 8px 0 0 0;">
						<a id="mail2"> <%=mail%>
						</a>
						<form action="<c:url value="/mypage/mail"/>" method="post"
							name="mail6" id="mail6">
							<input class="nonebox" name="mail4" id="mail4"
								placeholder="바꾸고 싶은 이메일을 입력하세요." style="width: 220px;"
								maxlength="50" type="email"></input>
						</form>
					</div>

					<div style="padding: 8px 0 0 0;">
						<button class="buttonbox blockbox" id="mail1"
							onclick="mailChangeOn()">수정</button>


						<div>
							<button class="buttonbox nonebox" id="mail3"
								onclick="mailModify()">수정 완료</button>
						</div>

						<div style="margin-top: 30px;">
							<button class="buttonbox nonebox" id="mail5"
								onclick="mailChangeOff()">취소</button>
						</div>

					</div>

				</div>
			</div>

			<div style="padding: 8px 10px 0px 10px;">
				<label><b id="add">주소</b></label>
				<div class="space">
					<div style="padding: 8px 0 0 0;">
						<a id="add2"> <%=add%>
						</a>
						<form action="<c:url value="/mypage/add"/>" method="post"
							name="add6" id="add6">
							<input class="nonebox" name="add4" id="add4"
								placeholder="바꾸고 싶은 주소를 입력하세요." style="width: 220px;"
								maxlength="30"></input>
						</form>
					</div>

					<div style="padding: 8px 0 0 0;">
						<button class="buttonbox blockbox" id="add1"
							onclick="addChangeOn()">수정</button>

						<div>
							<button class="buttonbox nonebox" id="add3" onclick="addModify()">수정
								완료</button>
						</div>

						<div style="margin-top: 30px;">
							<button class="buttonbox nonebox" id="add5"
								onclick="addChangeOff()">취소</button>
						</div>
					</div>
				</div>
			</div>

			<div style="padding: 8px 10px;">
				<label><b id="birth">생년월일</b></label>
				<div class="space">
					<div style="padding: 8px 0 0 0;">
						<a id="birth2"> <%=birth%>
						</a>
						<form action="<c:url value="/mypage/birth"/>" method="post"
							name="birth6" id="birth6">
							<input class="nonebox" name="birth4" id="birth4"
								placeholder="예시 : 19990101" style="width: 220px;" maxlength="8"></input>
						</form>
					</div>

					<div style="padding: 8px 0 0 0;">
						<button class="buttonbox blockbox" id="birth1"
							onclick="birthChangeOn()">수정</button>

						<div>
							<button class="buttonbox nonebox" id="birth3"
								onclick="birthModify()">수정 완료</button>
						</div>

						<div style="margin-top: 30px;">
							<button class="buttonbox nonebox" id="birth5"
								onclick="birthChangeOff()">취소</button>
						</div>

					</div>
				</div>
			</div>

		</div>
	</div>
</body>
</html>