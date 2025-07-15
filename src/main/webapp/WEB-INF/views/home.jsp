<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
	<header>
		<jsp:include page="/WEB-INF/views/inc/top.jsp"></jsp:include>
	</header>
	<c:choose>
	<c:when test="${empty sessionScope.sId || sessionScope.sId == '' }">
		<form action="/home" method="post">
			<input type="text" placeholder="아이디입력" name="userId">
			<input type="text" placeholder="비밀번호입력" name="userPassword">
			<input type="submit" value="로그인" >
		</form>
	</c:when>
	<c:otherwise>
	<a href="/myPage/main">${sessionScope.sId}</a>
</c:otherwise>
</c:choose>
</body>
</html>
