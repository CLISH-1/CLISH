<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <link rel="icon" type="image/png" href="/favicon.png" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>포트원 결제연동 샘플</title>
    <script src="https://cdn.portone.io/v2/browser-sdk.js" async defer></script>
    <link href="${pageContext.request.contextPath}/resources/css/the_best_styles.css" rel="stylesheet" type="text/css">
    
  </head>
  <body>
		<form action="/myPage/payment_info/cancelPayment" method="post">
		<h1>${message }</h1>
		<table>
			<tr>
				<th>결제 번호</th>
				<td><input type="text" value="${paymentInfoDTO.impUid }" name="impUid" readonly></td>
			</tr><tr>
				<th>상품 이름</th>
				<td><input type="text" value="${paymentInfoDTO.classTitle}" name="classTitle" readonly></td>
			</tr><tr>
				<th>주문 번호</th>
				<td><input type="text" value="${paymentInfoDTO.reservationIdx}"name="reservationIdx" readonly></td>
			</tr><tr>
				<th>결제 금액</th>
				<td><input type="text" value="${paymentInfoDTO.amount }" name="amount" readonly></td>
			</tr><tr>
				<th>구매 I  D</th>
				<td><input type="text" value="${paymentInfoDTO.userName}"name="userName" readonly></td>
			</tr><tr>
				<th>구매 상태</th>
				<td><input type="text" value="${paymentInfoDTO.status }" readonly></td>
			</tr><tr>
				<th>결제 시각</th>
				<td><input type="text" value="${paymentInfoDTO.payTime}" readonly></td>
			</tr><tr>
				<th>변 환</th>
				<td><input type="text" value="${payTime}" readonly></td>
			</tr>
			<tr>
				<th>취소 이유</th>
				<td><textarea rows="15" cols="50" placeholder="취소사유입력" name="cancelReason"></textarea></td> 
			</tr>
			
		</table>
		<input type="submit" value="결제취소신청" >
		</form>
  </body>
</html>
<script type="text/javascript">

</script>