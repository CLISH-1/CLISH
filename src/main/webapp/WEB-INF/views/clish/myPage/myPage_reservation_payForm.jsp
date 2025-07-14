<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제창</title>
<link href="${pageContext.request.contextPath}/resources/css/the_best_styles.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/myPage.css" rel="stylesheet" type="text/css">
<!-- jQuery와 포트원 결제 SDK 로드 -->
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<!-- <script src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script> -->
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>

</head>
<body>

	<main id="container">
	
	<div id="main">
		<form action="" method="post">
		<h1>결제페이지</h1>
		<table >
			<tr>
				<th rowspan="3">클래스이미지</th>
				<th>${reservationClassInfo.class_title}</th>
			</tr>
			<tr>
				<th>${reservationClassInfo.class_member}</th>
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
				<th rowspan="2">클래스이미지</th>
				<th>유저아이디</th>
				<th>클래스명</th>
				<th>예약요청일</th>
				<th>예약완료일</th>
				<th>잔여좌석</th>
				<th>예약인원</th>
				<th>결제 금액</th>
			</tr>
        	<tr>
        		<td>${reservationClassInfo.reservation_idx}</td>
				<td>${reservationClassInfo.user_id}</td>
				<td>${reservationClassInfo.class_title}</td>
				<td>${reservationClassInfo.reservation_class_date}</td>
				<td>${reservationClassInfo.reservation_com}</td>
				<td>${reservationClassInfo.remain_seats}</td>
				<td>${reservationClassInfo.reservation_members}</td>
				<td>${reservationClassInfo.price_fin }</td>		
        	</tr>
		</table>
			<table>
				<tr>
					<td>
					<input type="button" value="취소" data-reservation-num="${reservationNum}"
          				onclick="cancelPayment(this)">
					<input type="button" value="결제" data-reservation-num="${reservationNum}"
						onclick="requestPay()" id="paybtn">
          			</td>
          		</tr> 
			</table>
		</form>
	</div>
	
	</main>
	

</body>
</html>
<script type="text/javascript">
	function cancelPayment(btn) {
		if(confirm("결제를 취소하시겠습니까?")){
		    window.close();
		}
	}	
	var reservation_idx = "${reservationClassInfo.reservation_idx}";
	var reservation_class_date = "${reservationClassInfo.reservation_class_date}"
	var reservation_com = "${reservationClassInfo.reservation_com}";
	var reservation_members = "${reservationClassInfo.reservation_members}";
	var price_fin = "${reservationClassInfo.price_fin }";
	var remain_seats = "${reservationClassInfo.remain_seats}";
	var class_title = "${reservationClassInfo.class_title}";
	var user_id = "${reservationClassInfo.user_id}";
	var from = "${from}";
	
	// =================================================================
	window.onload = () => {
		var IMP = window.IMP;
		IMP.init("imp55304474"); // 포트원에서 발급받은 식별코드 입력
	}
	
	function requestPay() {
//		console.log(" 연결완료");
		console.log("예약인원 " + remain_seats);
	

	  IMP.request_pay({
	    pg: "kakaopay", // 고정
	    pay_method: "card", // 고정
		storeId: "Clish",
	    merchant_uid: reservation_idx, // 예약번호
//	    merchant_uid: randomStr, // 테스트때문에바꿈
	    name: class_title, // 강의명
	    amount: price_fin , // 결제금액
	    buyer_name: user_id, // 결제 user_id
//	    m_redirect_url:"",// 모바일 결제 완료 후리다이렉트 할 주소
//	    m_redirect_url: "http://localhost:8081/clish/myPage/payment_info/payResult",// 모바일 결제 완료 후리다이렉트 할 주소
//		custom_data: from	     
	  }, function(rsp) {
		console.log(rsp);
		alert("rsp");
	    if (rsp.success) {
			console.log("테스트 확인");
		    // 결제 성공 시 서버에 결제정보 전달
		    $.post("/clish/myPage/payment/verify", { imp_uid: rsp.imp_uid }, function(data) {
//				console.log("이동 직전!", rsp.imp_uid, rsp.merchant_uid);
//				alert("JSON.stringify(data, null, 2)"); 
//			      // 서버 검증 후 처리
				if (!isMobile()) {
		        window.location.href =
		          "/clish/myPage/payment_info/payResult"
		            + "?impUid=" + data.impUid
		            + "&merchantUid=" + data.merchantUid
					+ `&amount=`+ data.amount 
		            + `&status=` + data.status 
		            + `&userId=` + data.userId 
					+ `&payMethod=` + data.payMethod
		            + `&payTime=`+ data.payTime 
					+ `&classTitle=` + data.classTitle
					+ `&failReason=`+ data.failReason
					+ `&failTime=`+ data.failTime
					+ `&requestTime=` + data.requestTime
					+ `&from=` + data.from
					+ `&receiptUrl=` + encodeURIComponent(data.receiptUrl);
	        	}
//			
		    });
	    } else {
	      alert("결제에 실패하였습니다: " + rsp.error_msg);
	    }
	  });
	}
	
	// PC/모바일 환경 구분 함수
	// navigator.userAgent : 사용자의 브라우저, 운영체제, 기기 정보
	// /Mobi|Android|iPhone|iPad/i "Mobi","Android", "iPhone", "iPad" 이라는 단어가 들어있는지 검사 /i
	// .test() navigator.userAgent에 위의 단어가 포함되어있는지 검사, true false 리턴
	function isMobile() {
	  return /Mobi|Android|iPhone|iPad/i.test(navigator.userAgent);
	}
	
	//테스트를 위한 난수생성
	function getRandomString(length) {
	  return Math.random().toString(36).substr(2, length);
	}
	
	const randomStr = getRandomString(8);
	
</script>

<%-- <script src="${pageContext.request.contextPath}/resources/js/myPage_payment.js"></script> --%>