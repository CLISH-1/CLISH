<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%-- <link href="${pageContext.request.contextPath}/resources/css/main.css" rel="stylesheet" type="text/css"> --%>
<%-- <link href="${pageContext.request.contextPath}/resources/css/default.css" rel="stylesheet" type="text/css"> --%>
</head>
<body>
	<header>
		<jsp:include page="/WEB-INF/views/admin/header.jsp"></jsp:include>
	</header>
	<main class="main">
		<jsp:include page="/WEB-INF/views/admin/sidebar.jsp"></jsp:include>
		<div>ddd</div>
	</main>
	<footer>
		<jsp:include page="/WEB-INF/views/admin/bottom.jsp"></jsp:include>
	</footer>
</body>
</html>