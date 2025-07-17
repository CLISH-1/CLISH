<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기업 마이페이지</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/the_best_styles.css">
<style>
	.mypage-container {
	    display: flex;
	    width: 100%;
	    height: 100vh;
	  }
	
	.content-area {
	    flex: 1;
	    padding: 30px;
	    display: flex;
	    justify-content: center;
	    align-items: flex-start;  /* ← 글자를 위쪽 가운데 정렬 */
	  }
</style>
</head>
<body>
	<div class="mypage-container">
	
		<%-- 🔽 사이드바 포함시키는 부분 --%>
	   <jsp:include page="/WEB-INF/views/company/comSidebar.jsp"></jsp:include>
	
	    <%-- 🔽 본문 내용 영역 --%>
	    <div class="content-area">
	        <h1>기업 마이페이지</h1>
	    </div>
	</div>
</body>
</html>








