<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>클래스 관리</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/the_best_styles.css">
 	<style>
        .classManage-container {
            display: flex;
            width: 100%;
            height: 100vh;
        }

        .content-area {
            flex: 1;
            padding: 30px;
        }

        .class-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .class-list {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            margin-top: 30px;
        }

        .class-card {
            border: 1px solid #ccc;
            padding: 15px;
            width: 200px;
            text-align: center;
        }

        .class-card img {
            width: 150px;
            height: 100px;
            background-color: #eee;
        }

        .class-card h4 {
            margin-top: 10px;
        }

    </style>
</head>
<body>
    <div class="classManage-container">

        <%-- ⬅️ 사이드바 포함시키는 부분 --%>
        <jsp:include page="/WEB-INF/views/company/comSidebar.jsp" />

        <%-- 📄 본문 내용 영역 --%>
        <div class="content-area">
            <div class="class-header">
                <h1>클래스 관리 페이지</h1>
                <button onclick="location.href='${pageContext.request.contextPath}/company/myPage/registerClass'">클래스 개설</button>
            </div>

            <div class="class-list">
                <c:forEach var="classDTO" items="${classList}">
                    <div class="class-card">
                        <img src="${pageContext.request.contextPath}/resources/images/default_thumbnail.png" alt="썸네일">
                        <h4>${classDTO.class_title}</h4>
                        <p>평점: ${classDTO.class_rating}</p>
                        <button onclick="location.href='${pageContext.request.contextPath}/company/myPage/classDetail?class_idx=${classDTO.class_idx}'">상세보기</button>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</body>
</html>