<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/css/the_best_styles.css" rel="stylesheet" type="text/css">
<%-- <script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/myPage_payment.js"></script> --%>
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
		          data-from="list" onclick="payReservation(this)"> </td>
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
					<th>결제상태</th>
					<th>예약번호</th>
					<th>유저아이디</th>
					<th>클래스아이디</th>
					<th>예약요청일</th>
					<th>예약완료일</th>
					<th>취소</th>
					<th>상세보기</th>
				</tr>
				<c:forEach var="reserve" items="${reservationList }" >
					<c:if test="${reserve.reservationStatus == 2}">
			        	<tr>
			        		<td><c:if test="${reserve.reservationStatus eq 2 }">결제완료</c:if></td>
			        		<td>${reserve.reservationIdx}</td>
							<td>${reserve.userId}</td>
							<td>${reserve.classIdx}</td>
							<td>${reserve.reservationClassDate}</td>
							<td>${reserve.reservationCom}</td>
							<td><input type="button" value="결제취소" data-reservation-num="${reserve.reservationIdx}"
		          onclick="cancelPayment(this)"></td>
							<td><input type="button" value="상세보기" data-reservation-num="${reserve.reservationIdx}"
		          onclick="paymentInfo(this)"> </td>
			        	</tr>
			        </c:if>
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
			console.log(reservationIdx);
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
		var from = btn.getAttribute('data-from'); 
	    window.open(
	        '/clish/myPage/payment_info/payReservation?reservationIdx=' + encodeURIComponent(reservationIdx)
	        + '&from=' + encodeURIComponent(from),
	        'payReservation',
	        `width=600,height=1500,resizable=yes,scrollbars=yes`
	    );
	}
	
	function cancelPayment(btn) {
		var reservationIdx = btn.getAttribute('data-reservation-num');
		window.open(
			'/clish/myPage/payment_info/cancelPayment?reservationIdx=' + encodeURIComponent(reservationIdx),			
			'paymentInfo',
			`width=600,height=1500, resizable=yes, scrollbars=yes`
		);
	}
	
	function paymentInfo(btn) {
		var reservationIdx = btn.getAttribute('data-reservation-num');
		window.open(
			'/clish/myPage/payment_info/paymentInfo?reservationIdx=' + encodeURIComponent(reservationIdx),			
			'paymentInfo',
			`width=600,height=1500, resizable=yes, scrollbars=yes`
		);
	}
	
	
</script>