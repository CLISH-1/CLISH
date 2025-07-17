<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/the_best_styles.css">
<style>
    .sidebar {
        width: 220px;
        background-color: #f5f5f5;
        padding: 20px;
    }

    .sidebar h2 {
        font-size: 20px;
        margin-bottom: 20px;
    }

    .sidebar h3 a {
        display: block;
        margin-bottom: 15px;
        color: #333;
        text-decoration: none;
    }

    .sidebar h3 a:hover {
        text-decoration: underline;
    }
</style>
</head>
<body>
	<div class="sidebar">
	    <!-- 왼쪽 사이드 메뉴 -->
	    <div class="sidebar">
	        <h3><a href="">개인정보 수정</a></h3>
	        <h3><a href="${pageContext.request.contextPath}/company/myPage/classManage">클래스 관리</a></h3>
	        <!-- 밑에꺼는 현재 매핑 안함 -->
	        <h3><a href="">나의 문의</a></h3>
	        <h3><a href="">수강평 보기</a></h3>
	        <h3><a href="">알람 내역</a></h3>
	        <h3><a href="">회원 탈퇴</a></h3>
	    </div>
	
	</div>

</body>
</html>