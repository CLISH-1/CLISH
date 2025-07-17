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
		remain_seats: [${reservationClassInfo.remain_seats}]<br>
		<form action="/myPage/payment_info/change" method="post" onsubmit="return validateForm();">
		<table >
			<tr>
				<th rowspan="3">클래스이미지</th>
				<th>${reservationClassInfo.class_title}</th>
			</tr>
			<tr>
				<th>${reservationClassInfo.class_member}</th>
			</tr> 
			<tr>
				<th>${reservationClassInfo.remainSeats}</th>
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
	<script>

		function validateForm() {
		    const dateInput = document.querySelector('input[name="reservationClassDate"]');
		    const membersInput = document.querySelector('input[name="reservationMembers"]');
		    const dateValue = dateInput.value.trim();
		    const membersValue = membersInput.value.trim();
		
		    // JSTL 값을 자바스크립트 변수로 전달
		    const remainSeats = parseInt('${reservationClassInfo.remainSeats}');
		    const classMember = parseInt('${reservationClassInfo.class_member}');
		    const reservationMembers = parseInt('${reservationClassInfo.reservation_members}');
		    const maxMembers = remainSeats + reservationMembers
		    console.log(maxMembers + ": 맥스멤버");
		    console.log("남은자리 : " + remainSeats);
		    console.log("예약자리 : " + reservationMembers);
		    
		    if (!dateValue) {
		        alert("예약일을 입력하세요.");
		        dateInput.focus();
		        return false;
		    }
		    
		    if (
		        !membersValue ||
		        isNaN(membersValue) ||
		        parseInt(membersValue) < 1
		    ) {
		        alert("예약 인원은 1명 이상이어야 합니다.");
		        membersInput.focus();
		        return false;
		    }
		    
		    if (parseInt(membersValue) > maxMembers) {
		        alert("예약 가능한 최대 인원은 " + maxMembers + "명입니다.");
		        membersInput.focus();
		        return false;
		    }
		    
		    return true;
		}
	</script>

</body>
</html>