<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/css/the_best_styles.css" rel="stylesheet" type="text/css">
</head>
<body>
	<header>
		<jsp:include page="/WEB-INF/views/admin/header.jsp"></jsp:include>
	</header>
	<main class="main">
		<jsp:include page="/WEB-INF/views/admin/sidebar.jsp"></jsp:include>
		<div>
			<form action="/admin/user/${user.userIdx}/update" method="post">
				<div>
					<label>이름</label>
					<input type="text" value="${user.userName}" name="userName" id="userName" />
				</div>
				<div>
					<label>닉네임</label>
					<input type="text" value="${user.userRepName}" name="userRepName" id="userRepName" />
				</div>
				<div>
					<label>아이디</label>
					<input type="text" value="${user.userId}" name="userId" id="userId" />
				</div>
				<div>
					<label>생년원일</label>
					<input type="text" value="${user.userBirth}" name="userBirth" id="userBirth" />
				</div>
				<div>
					<label>전화번호</label>
					<input type="text" value="${user.userPhoneNumber}" name="userPhoneNumber" id="userPhoneNumber" />
				</div>
				<div>
					<label>이메일</label>
					<input type="text" value="${user.userEmail}" name="userEmail" id="userEmail" />
				</div>
				<div>
				    <label>성별</label><br/>
				
				    <input type="radio" name="userGender" id="genderM" value="M"
				        <c:if test="${fn :contains(user.userGender, 'M')}">checked</c:if> disabled/>
				    <label for="genderM">남자</label>
				
				    <input type="radio" name="userGender" id="genderF" value="F"
				        <c:if test="${fn :contains(user.userGender, 'F')}">checked</c:if> disabled/>
				    <label for="genderF">여자</label>
				
				    <input type="radio" name="userGender" id="genderN" value="N"
				        <c:if test="${fn :contains(user.userGender, 'N')}">checked</c:if> disabled/>
				    <label for="genderN">선택안함</label>
				</div>
	
				<div>
					<label>우편번호</label>
					<input type="text" value="${user.userPostcode}" name="userPostcode" id="userPostcode" />
				</div>
				<div>
					<label>기본 주소</label>
					<input type="text" value="${user.userAddress1}" name="userAddress1" id="userAddress1" />
				</div>
				<div>
					<label>상세 주소</label>
					<input type="text" value="${user.userAddress2}" name="userAddress2" id="userAddress2" />
				</div>
				<button type="button" onclick="history.back();">닫기</button>
				<button type="submit" name="action" value="update">수정</button>
			</form>
		</div>
	</main>
	<footer>
		<jsp:include page="/WEB-INF/views/admin/bottom.jsp"></jsp:include>
	</footer>
</body>
</html>