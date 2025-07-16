<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/the_best_styles.css">
</head>
<body>
<section style="max-width: 700px; margin: 50px auto; padding: 30px;">
    <h2 style="text-align: center; margin-bottom: 20px;">클래스 등록 페이지</h2>

    <form action="${pageContext.request.contextPath}/company/myPage/registerClass" method="post">
        
        <label><b>강의명</b></label>
        <input type="text" name="classTitle" required>

        <label><b>카테고리 ID</b></label>
        <input type="text" name="categoryIdx" required>

        <label><b>수강료</b></label>
        <input type="number" name="classPrice" value="0" required>

        <label><b>정원</b></label>
        <input type="number" name="classMember" required>

        <label><b>강의 시작일</b></label>
        <input type="date" name="startDate" required>

        <label><b>강의 종료일</b></label>
        <input type="date" name="endDate" required>

        <label><b>수업요일</b></label>
        <div style="display: flex; flex-wrap: wrap; gap: 10px; margin-bottom: 15px;">
            <label><input type="checkbox" name="classDayNames" value="1">월</label>
            <label><input type="checkbox" name="classDayNames" value="2">화</label>
            <label><input type="checkbox" name="classDayNames" value="4">수</label>
            <label><input type="checkbox" name="classDayNames" value="8">목</label>
            <label><input type="checkbox" name="classDayNames" value="16">금</label>
            <label><input type="checkbox" name="classDayNames" value="32">토</label>
            <label><input type="checkbox" name="classDayNames" value="64">일</label>
        </div>

        <label><b>장소</b></label>
        <input type="text" name="location" size="50" required>

        <div style="text-align: center; margin-top: 30px;">
            <input type="submit" value="강좌 개설 신청" class="orange-button big-button">
        </div>
    </form>
</section>
</body>
</html>