<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:set var="name" value="홍길동" />

		이름 : <c:out value="${name}" />

		<br />

		<!-- 변수 재선언 -->
		<c:set var="name" value="철수" />

		변경된 이름 : <c:out value="${name}" />
		<br />
		변경된 이름2 : ${name}

		<br />


		<!-- 변수 삭제 -->
		<c:remove var="name" />

		삭제된 이름 출력 : <c:out value="${name}" default="이름없음" />

</body>
</html>