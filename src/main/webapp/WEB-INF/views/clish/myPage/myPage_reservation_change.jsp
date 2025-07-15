<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약변경</title>
<link href="${pageContext.request.contextPath}/resources/css/the_best_styles.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/myPage.css" rel="stylesheet" type="text/css">

</head>
<body>

	
	<main id="container">
	
	<div id="main">
	
		<h1>예약변경</h1>
		<form action="/myPage/payment_info/change" method="post">
		<table >
			<tr>
				<th rowspan="3">클래스이미지</th>
				<th>${reservationClassInfo.class_title}</th>
			</tr>
			<tr>
				<th>${reservationClassInfo.class_members}</th>
			</tr> 
			<tr>
				<th>${reservationClassInfo.remain_seats}</th>
			</tr>
			<tr>
				<th>${reservationClassInfo.start_date}</th>
				<th>${reservationClassInfo.end_date}</th>
			</tr> 
		</table>
		<table >
			<tr>
				<th>예약번호</th>
				<th>예약자</th>
				<th>클래스명</th>
				<th>예약일</th>
				<th>예약인원</th>
				<th>예약완료일</th>
				<th>결제 금액</th>
				
			</tr>
        	<tr>
        		<td><input type="text" value="${reservationClassInfo.reservation_idx}" name="reservationIdx"readonly></td>
				<td>${user.userName}</td>
				<td>${reservationClassInfo.class_title}</td>
				<td><input type="text" value="${reservationClassInfo.reservation_class_date}" name="reservationClassDate"></td>
				<td><input type="text" value="${reservationClassInfo.reservation_members}" name="reservationMembers" ></td>
				<td>${reservationClassInfo.reservation_com}</td>
				<td>${reservationClassInfo.class_price * reservationClassInfo.reservation_members}</td>
        	</tr>
        	<tr>
				<td colspan="6">
					<input type="button" value="취소" data-reservation-num="${reservationClassInfo.reservation_idx}"
	         onclick="history.back()">
					<input type="submit" value="수정완료" >
         		</td>        		
        	</tr>
		</table>
		</form>
		
	
	</div>
	
	</main>
	

</body>
</html>