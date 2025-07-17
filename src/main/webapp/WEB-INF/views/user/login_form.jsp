<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 폼</title>
<link rel="preconnect" href="https://fonts.googleapis.com" >
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Inter:ital,opsz,wght@0,14..32,100..900;1,14..32,100..900&family=Nanum+Myeongjo&family=Open+Sans:ital,wght@0,300..800;1,300..800&family=Orelega+One&display=swap" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/home/top.css" rel="stylesheet" >
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/the_best_styles.css" >
</head>
<body>
	<header>
		<jsp:include page="/WEB-INF/views/inc/top.jsp" />
	</header>
	<main>
		<h1>로그인</h1>
		<form action="${pageContext.request.contextPath}/user/login" method="post">
			<input type="text" name="userId" value = "${cookie.rememberId.value }" placeholder="아이디"><br>
			<input type="password" name="userPassword" placeholder="패스워드"><br>
			<input type="checkbox" name="rememberId" <c:if test="${not empty cookie.rememberId}">checked</c:if>>아이디 기억하기<br>
			<input type="submit" value="로그인">
		</form>	
	</main>
</body>
</html>




















