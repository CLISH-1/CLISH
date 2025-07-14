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
  </head>
  <body>
    <div id="root">
		<h3>
			${from}<br>
			결제 번호 : ${paymentInfoDTO.impUid }<br>
			상품 이름 : ${paymentInfoDTO.classTitle}<br>
			주문 번호 : ${paymentInfoDTO.merchantUid}<br>
			결제 금액 : ${paymentInfoDTO.amount }<br>
			구매 I  D : ${paymentInfoDTO.userId }<br>
			구매 상태 : ${paymentInfoDTO.status }<br>
			요청 시각 : ${paymentInfoDTO.requestTime}<br>
			결제 시각 : ${paymentInfoDTO.payTime}<br>
			  변 환   : ${payTime}<br>
			실패 시각 : ${paymentInfoDTO.failTime }<br>
			  변 환   : ${failTime}<br>
			실패 이유 : ${paymentInfoDTO.failReason }<br>
			결제영수증 : ${paymentInfoDTO.receiptUrl }<br>
			
		</h3>
		<input type="button" value="확인" onclick="window.close()">
    </script>
  </body>
</html>
<script type="text/javascript">
window.onload = function() {
	var from ='${from}'.trim();
	console.log('from', from,'length', from.length);
	for (let i = 0; i < from.length; i++) {
	    console.log(i, from[i], from.charCodeAt(i));
	}
	if (from === '"list"') {
		console.log("리스트");
	    if (window.opener) {
	        window.opener.location.reload();
	    }
	} else if (from === '"detail"') {
		console.log("디테일");
	    if (window.opener) {
	        if (window.opener.opener) {
	            window.opener.opener.location.reload();
	        }
	        window.opener.close(); 
	    }
	}
}
</script>