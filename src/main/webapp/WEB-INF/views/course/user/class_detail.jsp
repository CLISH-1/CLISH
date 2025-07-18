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
	<header>
		<jsp:include page="/WEB-INF/views/admin/header.jsp"></jsp:include>
	</header>
	<main>
		<section style="max-width: 800px; margin: 50px auto; padding: 40px;">
				<h1>클래스 상세 페이지</h1>
				<h3 style="text-align: center; margin-bottom: 30px;">[ 클래스 상세 정보 ]</h3>
				
				<table class="table-with-side-borders" style="width: 90%;">
					<tr>
						<th>강의명</th> <td>${classInfo.classTitle}</td>
					</tr>
					<tr>
						<th>카테고리 ID</th> <td>${classInfo.categoryIdx}</td>
					</tr>
					<tr>
						<th>수강료</th> <td>${classInfo.classPrice}</td>
					</tr>
					<tr>
						<th>정원</th> <td> ${classInfo.classMember}</td>
					</tr>
					<tr>
						<th>강의 기간</th> <td>${classInfo.startDate} ~ ${classInfo.endDate}</td>
					</tr>
					<tr>
						<th>수업요일</th> <td>${classInfo.classDayNames}</td>
					</tr>
					<tr>
						<th>장소</th> <td>${classInfo.location}</td>
					</tr>
					<tr>
						<th>예약 일자</th> <td>${classInfo.location}</td>
					</tr>
					
					
				</table>
					
				<!-- 아직 안함.. -->
		        <div style="text-align: center; padding-top: 30px;">
		            <button class="orange-button">클래스 목록</button>
		            <button class="orange-button" onclick="location.href='예약페이지 매핑'">예약</button>
		        </div>
		</section>
	</main>
	<footer>
		<jsp:include page="/WEB-INF/views/admin/bottom.jsp"></jsp:include>
	</footer>

</body>
</html>