<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>탈퇴</title>
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
	
		<h1>${sessionScope.sId} 탈퇴</h1>
		
		<hr>
		<h1>탈퇴하면어쩌고저쩌고저쩌고</h1>
		<input type="checkbox" id="agree">동의하쉴?
		<input type="button" value="확인" onclick="withdraw()">
	
	</div>
	
	</main>
	
	<footer>
		<jsp:include page="/WEB-INF/views/inc/bottom.jsp"></jsp:include>
	</footer>
	<script type="text/javascript">
		function withdraw() {
			console.log(document.getElementById("agree").checked);
			if(document.getElementById("agree").checked){
				if(confirm("정말로 탈퇴하실?")){
					fetch('/myPage/withdrawFinal', {
				        method: 'POST',
				        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
				    })
				    .then(response => response.text())
				    .then(result => {
				        alert(result); // 서버에서 받은 결과 메시지 표시
				        location.href="/";
				    })
				    .catch(error => {
				        alert("오류 발생: " + error);
				    });
				}
			} else {
				alert("동의해야함");
			}
			
			
		}
	</script>
</body>
</html>
