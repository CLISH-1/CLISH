<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기업 메인페이지</title>
 <!-- top.jsp에서 사용하는 스타일시트 포함 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/the_best_styles.css">
<style>
    .header-button {
        background-color: orange;
        color: white;
        padding: 8px 16px;
        margin: 10px;
        border-radius: 8px;
        text-decoration: none;
        font-weight: bold;
        display: inline-block;
        box-shadow: 0px 3px 5px rgba(0, 0, 0, 0.2);
    }
</style>
</head>
<body>
	
	<!-- 본문 내용 -->
   <div align="center">
        <h1>기업 메인페이지</h1>

        <!-- 버튼 출력 영역 -->
        <div style="margin-top: 30px;">
            <a href="${pageContext.request.contextPath}/company/myPage" class="header-button">마이페이지</a>
            <a href="${pageContext.request.contextPath}/login" class="header-button">로그인</a>
        </div>
    </div>
    
</body>
</html>