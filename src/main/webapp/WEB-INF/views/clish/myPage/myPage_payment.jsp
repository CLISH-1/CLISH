<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.googleapis.com" >
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Inter:ital,opsz,wght@0,14..32,100..900;1,14..32,100..900&family=Nanum+Myeongjo&family=Open+Sans:ital,wght@0,300..800;1,300..800&family=Orelega+One&display=swap" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/home/top.css" rel="stylesheet" >
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/the_best_styles.css" >
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/home.js"></script>
</head>
<body>
	<header>
		<jsp:include page="/WEB-INF/views/inc/top.jsp"></jsp:include>
	</header>
	
	<main id="container">
	
	<jsp:include page="/WEB-INF/views/clish/myPage/side.jsp"></jsp:include>
	
	<div id="main">
	
		<h1>${sessionScope.sId}의 페이지</h1>
		<hr>
		<h3>결제내역</h3>
<!-- 		<input type="hidden" id="parent" value="list"> -->
		<div>
			<h3>예약 목록</h3>
			<table border="solid 1px">
				<tr>
					<th>선택</th>
					<th>결제상태</th>
					
					<th>예약번호</th>
					<th>예약자</th>
					<th>클래스아이디</th>
					<th>예약요청일</th>
					<th>예약완료일</th>
					<th>취소</th>
					<th>결제</th>
					<th>상세보기</th>
				</tr>
				<c:forEach var="reserve" items="${reservationList }" >
					<c:if test="${reserve.reservationStatus == 1}">
			        	<tr>
			        		<td><input type="checkbox" name="${reserve.reservationIdx}"> </td>
			        		<td><c:if test="${reserve.reservationStatus eq 1 }">미결제</c:if></td>
			        		<td>${reserve.reservationIdx}</td>
							<td>${user.userName}</td>
							<td>${reserve.classIdx}</td>
							<td>${reserve.reservationClassDate}</td>
							<td>${reserve.reservationCom}</td>
							<td><input type="button" value="취소" data-reservation-num="${reserve.reservationIdx}"
		          onclick="cancelReservation(this)"></td>
							<td><input type="button" value="결제" data-reservation-num="${reserve.reservationIdx}"
		          onclick="payReservation(this)"> </td>
							<td><input type="button" value="상세보기" data-reservation-num="${reserve.reservationIdx}"
		          onclick="reservationInfo(this)"> </td>
			        	</tr>
			        </c:if>
	       		</c:forEach>
			</table>
		</div>
		<div>
		
			<h3>결제 목록</h3>
			<table border="solid 1px">
				<tr>
					<th>결제 번호</th>
					<th>예약 번호</th>
					<th>결제 상태</th>
					<th>유저이름</th>
					<th>클래스명</th>
					<th>결제요청시각</th>
					<th>결제완료시각</th>
					<th>취소</th>
					<th>상세보기</th>
				</tr>
				<c:forEach var="payment" items="${paymentList }" >
		        	<tr>
		        		<td>${payment.imp_uid }</td>
		        		<td>${payment.reservation_idx}</td>
		        		<td>${payment.status }</td>
						<td>${payment.user_name}</td>
						<td>${payment.class_title}</td>
						<td>${payment.request_time}</td>
						<td>${payment.pay_time}</td>
						<td><input type="button" value="결제취소" data-imp-num="${payment.imp_uid}"
	          onclick="cancelPayment(this)"></td>
						<td><input type="button" value="상세보기" data-imp-num="${payment.imp_uid}"
	          onclick="paymentInfo(this)"> </td>
		        	</tr>
	       		</c:forEach>
			</table>
		</div>
	
	</div>
	
	</main>
	
	<footer>
		<jsp:include page="/WEB-INF/views/inc/bottom.jsp"></jsp:include>
	</footer>
</body>
</html>

<script type="text/javascript">
	//취소버튼 함수
	function cancelReservation(btn) {
		if(confirm("정말로 예약을 취소하시겠습니까?")){
		    // 1. 버튼의 data- 속성에서 예약번호 읽기
		    var reservationIdx = btn.getAttribute('data-reservation-num');
// 			console.log(reservationIdx);
		    // 2. 필요하면 같은 행의 다른 정보도 읽을 수 있음
		    // var row = btn.closest('tr');
		    // var userId = row.cells[1].innerText;
		
		    // 3. 서버로 AJAX 전송 (fetch 사용)
		    fetch('/myPage/payment_info/cancel', {
		        method: 'POST',
		        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
		        body: 'reservationIdx=' + encodeURIComponent(reservationIdx)
		    })
		    .then(response => response.text())
		    .then(result => {
		        alert(result); // 서버에서 받은 결과 메시지 표시
		        location.reload(); // 필요하다면 새로고침
		    })
		    .catch(error => {
		        alert("오류 발생: " + error);
		    });
		}
	}
	
	//상세보기 버튼 함수
	function reservationInfo(btn) {
    	//예약번호 읽기
	    var reservationIdx = btn.getAttribute('data-reservation-num');
	    
		//팝업창 열기
	    window.open(
	        '/myPage/payment_info/detail?reservationIdx=' + encodeURIComponent(reservationIdx),
	        'reservationDetail',
	        `width=600,height=1500,resizable=yes,scrollbars=yes`
	    );
	}
	
	//결제버튼 함수
	function payReservation(btn) {
	    var reservationIdx = btn.getAttribute('data-reservation-num'); 
	    window.open(
	        '/myPage/payment_info/payReservation?from=list&reservationIdx=' + encodeURIComponent(reservationIdx),
	        'payReservation',
	        `width=600,height=1500,resizable=yes,scrollbars=yes`
	    );
	}
	
	function cancelPayment(btn) {
		var impUid = btn.getAttribute('data-imp-num');
		window.open(
			'/myPage/payment_info/cancelPayment?impUid=' + encodeURIComponent(impUid),			
			'paymentInfo',
			`width=600,height=1500, resizable=yes, scrollbars=yes`
		);
	}
	
	function paymentInfo(btn) {
		var impUid = btn.getAttribute('data-imp-num');
		window.open(
			'/myPage/payment_info/paymentDetail?impUid=' + encodeURIComponent(impUid),			
			'paymentInfo',
			`width=600,height=1500, resizable=yes, scrollbars=yes`
		);
	}
	
	
</script>