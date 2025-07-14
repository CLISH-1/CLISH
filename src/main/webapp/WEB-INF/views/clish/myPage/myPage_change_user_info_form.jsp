<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/css/the_best_styles.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/myPage.css" rel="stylesheet" type="text/css">

</head>
<body>
	<header>
		<jsp:include page="/WEB-INF/views/inc/top.jsp"></jsp:include>
	</header>
	
	<main id="container">
	
	<jsp:include page="/WEB-INF/views/clish/myPage/side.jsp"></jsp:include>
	
	<div id="main">
	
		<h1>${sessionScope.sId} 정보변경</h1>
		
		<hr>
		
		<form action="/clish/myPage/change_user_info" method="post" class="form" name="modifyForm">
			<table border="solid" >
				<tr>
					<th>ID</th>
					<td>${sessionScope.sId }</td>
				</tr>
				<tr>
					<th>닉네임</th>
					<td>
						<input type="text" name="userName" value="${user.userName }">
						<input type="button" value="중복확인">
					</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>
						<input type="text" name="userEmail" value="${user.userEmail }" > 
						<input type="button" value="인증요청"><br>
						<input type="text" name="autho" placeholder="인증번호">
						<input type="button" value="확인">
					</td>
					
				</tr>
				<tr>
					<th>핸드폰번호</th>
					<td><input type="text" name="userPhoneNumber" value="${user.userPhoneNumber }"></td>
				</tr>
				<tr>
					<th>우편번호</th>
					<td><input type="text" name="userPostCode" value="${user.userPostCode }"></td>
				</tr>
				<tr>
					<th>상세주소</th>
					<td><input type="text" name="userAddress1" value="${user.userAddress1 }"><br>
						<input type="text" name="userAddress2" value="${user.userAddress2 }"></td>
				</tr>
				<tr>
					<th>새 비밀번호</th>
					<td><input type="text" name="new_password1" id="newpw1"></td>
				</tr>
				<tr>
					<th>새 비밀번호 확인</th>
					<td><input type="text" name="new_password2" id="newpw2"><br>
					<div id="checkPasswd2Result"></div></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
					<input type="button" value="돌아가기" onclick="history.back()">
					<input type="reset" value="초기화">
					<input type="submit" value="수정완료" id="submitBtn">
					</td>
				</tr>
					
			</table>
		</form>
	
	</div>
	
	</main>
	
	<footer>
		<jsp:include page="/WEB-INF/views/inc/bottom.jsp"></jsp:include>
	</footer>
</body>
</html>
<script type="text/javascript">
	const submitBtn = document.getElementById("submitBtn");
	const form = document.forms["modifyForm"];
	function checkPasswordMatch() {
	    const newpw1 = form.new_password1.value;
	    const newpw2 = form.new_password2.value;
	    let message = "";
	    let color = "";

	    // 새 비밀번호를 입력하지 않았으면 항상 버튼 활성화
	    if (newpw1.length === 0 && newpw2.length === 0) {
	        submitBtn.disabled = false;
	        document.getElementById("checkPasswd2Result").innerText = "";
	        return;
	    }

	    // 새 비밀번호를 입력한 경우에만 일치 여부 체크
	    if (newpw1 === newpw2) {
	        submitBtn.disabled = false;
	        message = "비밀번호 일치";
	        color = "BLUE";
	    } else {
	        submitBtn.disabled = true;
	        message = "비밀번호 불일치";
	        color = "RED";
	    }
	    document.getElementById("checkPasswd2Result").innerText = message;
	    document.getElementById("checkPasswd2Result").style.color = color;
	}

	// 새 비밀번호 입력란에 이벤트 연결
	form.new_password1.oninput = checkPasswordMatch;
	form.new_password2.oninput = checkPasswordMatch;
</script>
