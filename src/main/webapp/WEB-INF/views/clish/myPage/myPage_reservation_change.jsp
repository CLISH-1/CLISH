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
		<form action="/clish/myPage/payment_info/change" method="post">
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
				<th>유저아이디</th>
				<th>클래스명</th>
				<th>예약일</th>
				<th>예약인원</th>
				<th>예약완료일</th>
				<th>결제 금액</th>
				
			</tr>
        	<tr>
        		<td><input type="text" value="${reservationClassInfo.reservation_idx}" name="reservationIdx"readonly></td>
				<td>${reservationClassInfo.user_id}</td>
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
<script type="text/javascript">

	function cancelReservation(btn) {
		if(confirm("정말로 예약을 취소하시겠습니까?")){
		    // 1. 버튼의 data- 속성에서 예약번호 읽기
		    var reservationIdx = btn.getAttribute('data-reservation-num');
		
		    // 2. 필요하면 같은 행의 다른 정보도 읽을 수 있음
		    // var row = btn.closest('tr');
		    // var userId = row.cells[1].innerText;
		
		    // 3. 서버로 AJAX 전송 (fetch 사용)
		    fetch('/clish/myPage/payment_info/cancel', {
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
	}
	
	function payReservation(btn) {
	    var reservationIdx = btn.getAttribute('data-reservation-num');
		var from = btn.getAttribute('data-from');
	    window.open(
	        '/clish/myPage/payment_info/payReservation?reservationIdx=' + encodeURIComponent(reservationIdx)
	        + '&from=' + encodeURIComponent(from),
	        'payReservation',
	        `width=600,height=1500,resizable=yes,scrollbars=yes`
	    );
	}

</script>