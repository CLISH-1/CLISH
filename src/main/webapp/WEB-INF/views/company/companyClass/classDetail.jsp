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
		<h1>클래스 상세 페이지</h1>
		<h3>클래스 상세 정보</h3>
			<p>강의명 : ${classInfo.classTitle}</p>
			<p>카테고리 ID : ${classInfo.categoryIdx}</p>
			<p>수강료 : ${classInfo.classPrice}</p>
			<p>정원 : ${classInfo.classMember}</p>
			<p>강의 시작일 ~ 종료일 : ${classInfo.startDate} ~ ${class.endDate}</p>
			<p>수업요일 : ${classInfo.classDayNames}</p>
			<p>장소 : ${classInfo.location}</p>
	</div>
</body>
</html>