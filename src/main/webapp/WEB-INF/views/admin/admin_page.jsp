<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/css/the_best_styles.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/admin/sidebar.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div class="container">
		<div class="sidebar">
			<jsp:include page="/WEB-INF/views/admin/sidebar.jsp"></jsp:include>	
		</div>
		<div class="main">
			<div>관리자 대시보드</div>
			<div>통계자료 넣을 예정</div>
		</div>
	</div>
</body>
</html>