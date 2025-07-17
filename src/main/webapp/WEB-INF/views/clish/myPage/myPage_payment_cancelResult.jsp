<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>포트원 결제연동 샘플</title>
    <script src="https://cdn.portone.io/v2/browser-sdk.js" async defer></script>
    <link href="${pageContext.request.contextPath}/resources/css/the_best_styles.css" rel="stylesheet" type="text/css">
    
  </head>
  <body>
		<h3>
 	${message } <br>
 	${paymentCancel.impUid } <br>
<%--  	${paymentCancel.merchantUid }<br> --%>
 	${paymentCancel.amount }<br>
 	${paymentCancel.cancelAmount }<br>
 	${paymentCancel.status }<br>
 	${paymentCancel.cancelReason }<br>
 	${paymentCancel.cancelledAt }<br>
 	${cancelTime}
 	${paymentCancel.userName }<br>
 	${paymentCancel.payMethod }<br>
 	${paymentCancel.cancelRequestTime}<br>
 	${paymentCancel.receiptUrl }<br>
 	${paymentCancel.cancelReceiptUrl }<br>
 	</h3>
  </body>
</html>
<script type="text/javascript">
window.onload = function() {
	var message = "${message}";
	if(message != null){
		alert(message);
	}	
}
</script>