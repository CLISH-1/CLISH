<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<h1>클래스 등록 페이지</h1>
		
		<form action="/company/myPage/registerClass" method="post">
			
<!-- 			<label>클래스idx : </label> -->
<!-- 			<input type="text" name="classIdx" /><br><br> -->
			
			<label>강의명 : </label>
            <input type="text" name="classTitle" required><br><br>

            <label>카테고리 ID : </label>
            <input type="text" name="categoryIdx" required><br><br>

            <label>수강료 : </label>
            <input type="number" name="classPrice" value="0" required><br><br>

            <label>정원 : </label>
            <input type="number" name="classMember" required><br><br>

            <label>강의 시작일 : </label>
            <input type="date" name="startDate" required><br><br>

            <label>강의 종료일 : </label>
            <input type="date" name="endDate" required><br><br>
			
			<!-- 체크박스로 -->
           <label>수업요일:</label><br>
			<input type="checkbox" name="classDays" value="1"> 월
			<input type="checkbox" name="classDays" value="2"> 화
			<input type="checkbox" name="classDays" value="4"> 수
			<input type="checkbox" name="classDays" value="8"> 목
			<input type="checkbox" name="classDays" value="16"> 금
			<input type="checkbox" name="classDays" value="32"> 토
			<input type="checkbox" name="classDays" value="64"> 일
			<br><br>

            <label>장소 : </label>
            <input type="text" name="location" size="50" required><br><br>

            <input type="submit" value="강좌 개설 신청">
		</form>
		
	</div>
</body>
</html>