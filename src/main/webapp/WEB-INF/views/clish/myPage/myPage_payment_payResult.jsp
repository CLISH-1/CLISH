<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <link rel="icon" type="image/png" href="/favicon.png" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>결제완료</title>
    <script src="https://cdn.portone.io/v2/browser-sdk.js" async defer></script>
  </head>
  <body>
    <div id="root">
    <h1>결제완료</h1>
		<h3>
			결제 번호 : ${paymentInfoDTO.impUid }<br>
			상품 이름 : ${paymentInfoDTO.classTitle}<br>
			주문 번호 : ${paymentInfoDTO.reservationIdx}<br>
			결제 금액 : ${paymentInfoDTO.amount }<br>
			구매 I  D : ${paymentInfoDTO.userName }<br>
			구매 상태 : ${paymentInfoDTO.status }<br>
			요청 시각 : ${paymentInfoDTO.requestTime}<br>
			  변 환   : ${requestTime}<br>
			결제 시각 : ${paymentInfoDTO.payTime}<br>
			  변 환   : ${payTime}<br>
			결제영수증 : ${paymentInfoDTO.receiptUrl }<br>
			
		</h3>
		<input type="button" value="확인" onclick="window.close()">
    </script>
  </body>
</html>
<script type="text/javascript">
window.onload = function() {
	if (window.opener && window.opener.opener) {
		    window.opener.opener.location.reload();      
		} else if (window.opener) {                      
		    window.opener.location.reload();             
		}
}
</script>