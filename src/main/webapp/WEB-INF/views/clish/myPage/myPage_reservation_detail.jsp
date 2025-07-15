<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약상세</title>
<link href="${pageContext.request.contextPath}/resources/css/the_best_styles.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/myPage.css" rel="stylesheet" type="text/css">

</head>
<body>

	
	<main id="container">
	
	<div id="main">
	
		<h1>예약상세페이지</h1>
		<input type="hidden" id="parent" value="detail">
		<table >
			<tr>
				<th rowspan="5">클래스이미지</th>
				<th>${reservationClassInfo.class_title}</th>
			</tr>
			<tr><th>클래스정원</th></tr>
			<tr>
				<th>${reservationClassInfo.class_member}</th>
			</tr>
			<tr><th>남은자리</th></tr> 
			<tr>
				<th>${reservationClassInfo.remainSeats}</th>
			</tr>
			<tr><th>시작일</th><th>종료일</th></tr>
			<tr>
				<th>${reservationClassInfo.start_date}</th>
				<th>${reservationClassInfo.end_date}</th>
			</tr> 
		</table>
		<table >
			<tr>
				<th>예약번호</th>
				<th>유저아이디</th>
				<th>클래스명</th>
				<th>예약일</th>
				<th>예약인원</th>
				<th>예약완료일</th>
				<th>결제 금액</th>
				<th>취소</th>
				<th>수정</th>
				<th>결제</th>
			</tr>
        	<tr>
        		<td>${reservationClassInfo.reservation_idx}</td>
				<td>${user.userName}</td>
				<td>${reservationClassInfo.class_title}</td>
				<td>${reservationClassInfo.reservation_class_date}</td>
				<td>${reservationClassInfo.reservation_members}</td>
				<td>${reservationClassInfo.reservation_com}</td>
				<td>${reservationClassInfo.reservation_members * reservationClassInfo.class_price}</td>
				<td><input type="button" value="취소" data-reservation-num="${reservationClassInfo.reservation_idx}"
         onclick="cancelReservation(this)"></td>
				<td><input type="button" value="수정" data-reservation-num="${reservationClassInfo.reservation_idx}"
         onclick="reservationChange(this)"> </td>
				<td><input type="button" value="결제" data-reservation-num="${reservationClassInfo.reservation_idx}"
         onclick="payReservation(this)"> </td>
        	</tr>
		</table>
	
	</div>
	
	</main>
	

</body>
</html>
<script type="text/javascript">

	function cancelReservation(btn) {
		if(confirm("정말로 예약을 취소하시겠습니까?")){
		    // 1. 버튼의 data- 속성에서 예약번호 읽기
		    var reservationIdx = btn.getAttribute('data-reservation-num');
		
		    fetch('/myPage/payment_info/cancel', {
		        method: 'POST',
		        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
		        body: 'reservationIdx=' + encodeURIComponent(reservationIdx)
		    })
		    .then(response => response.text())
		    .then(result => {
		        alert(result); // 서버에서 받은 결과 메시지 표시
		        window.opener.location.reload(); // 결제내역 새로고침
		        window.close(); // 예약상세창 끄기
		    })
		    .catch(error => {
		        alert("오류 발생: " + error);
		    });
		}
	}
		
	function reservationChange(btn) {
		var reservationIdx = btn.getAttribute('data-reservation-num');
		console.log("예약번호 :" + reservationIdx);
		console.log("예약정보수정페이지이동");
		location.href="/myPage/payment_info/change?reservationIdx=" + reservationIdx;
	}
	
	function payReservation(btn) {
	    var reservationIdx = btn.getAttribute('data-reservation-num');
		var from = btn.getAttribute('data-from');
	    location.href ="
	        '/myPage/payment_info/payReservation?reservationIdx=' + encodeURIComponent(reservationIdx)
	        + '&from=' + encodeURIComponent(from)"
	}

</script>