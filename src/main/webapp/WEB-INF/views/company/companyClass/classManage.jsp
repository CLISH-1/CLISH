<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>클래스 관리 페이지</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/the_best_styles.css">
    <style>
        .classManage-container {
            display: flex;
            width: 100%;
            min-height: 100vh;
        }

        .content-area {
            flex: 1;
            padding: 30px;
        }

        .class-header {
            margin-bottom: 10px;
        }

        .button-right {
            width: 100%;
            display: flex;
            justify-content: flex-end;
            margin-bottom: 30px;
        }

        .orange-button {
            background-color: #FF7601;
            color: #fff;
            border-radius: 10px;
            width: 80px;
            height: 30px;
            border: none;
            display: block;
        }

        .orange-button:hover {
            background-color: #FF8C00;
            transform: translateY(-2px);
            transition: background-color 0.3s ease, transform 0.3s ease;
        }

        .class-filter-box {
            border: 1px solid black;
            padding: 10px;
            margin-bottom: 20px;
        }

        .class-table {
            width: 100%;
            border-collapse: collapse;
        }

        .class-table th, .class-table td {
            border: 1px solid #ccc;
            padding: 8px;
            text-align: center;
        }

        .class-table tr:hover {
            background-color: #f5f5f5;
            cursor: pointer;
        }
    </style>
</head>
<body>

    <!-- 공통 헤더 -->
    <header>
        <jsp:include page="/WEB-INF/views/admin/header.jsp" />
    </header>

    <!-- 페이지 전체 컨테이너 -->
    <div class="classManage-container">
        <!-- 사이드바 -->
        <jsp:include page="/WEB-INF/views/company/comSidebar.jsp" />

        <!-- 본문 내용 -->
        <div class="content-area">
            <div class="class-header">
                <h1>클래스 관리 페이지</h1>
            </div>

            <!-- 클래스 개설 버튼 -->
            <div class="button-right">
                <button class="orange-button"
                        onclick="location.href='${pageContext.request.contextPath}/company/myPage/registerClass'">
                    클래스 개설
                </button>
            </div>

            <!-- 필터 & 검색창 -->
            <div class="class-filter-box">
                <h5>강좌 목록</h5>
                <div style="margin-bottom: 10px;">
                    <select>
                        <option>전체</option>
                        <option>최신등록순</option>
                    </select>
                    <input type="text" placeholder="검색어를 입력하세요" />
                </div>
            </div>

            <!-- 강좌 목록 테이블 -->
            <div>
                <table class="class-table">
                    <thead>
                        <tr>
                            <th>제목</th>
                            <th>대분류</th>
                            <th>소분류</th>
                            <th>상태</th>
                            <th>수정</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:set var="hasRegisteredClass" value="false" />
                        <c:forEach var="classItem" items="${classList}">
                            <c:if test="${classItem.class_status != 1}">
                                <c:set var="hasRegisteredClass" value="true" />
                                <tr onclick="location.href='${pageContext.request.contextPath}/company/myPage/classDetail?classIdx=${classItem.class_idx}'">
                                    <td>${classItem.class_title}</td>
                                    <td>${classItem.parent_category_name}</td>
                                    <td>${classItem.child_category_name}</td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${classItem.class_status == 2}">오픈</c:when>
                                            <c:otherwise>마감</c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td>
                                        <button class="orange-button">수정</button>
                                    </td>
                                </tr>
                            </c:if>
                        </c:forEach>
                        <c:if test="${not hasRegisteredClass}">
                            <tr><td colspan="5">등록된 강의가 없습니다.</td></tr>
                        </c:if>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <!-- 공통 푸터 -->
    <footer>
        <jsp:include page="/WEB-INF/views/admin/bottom.jsp" />
    </footer>

</body>
</html>