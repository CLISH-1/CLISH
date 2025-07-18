<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원가입</title>
</head>
<body>
	<h2>회원가입</h2>
	
	<form name="joinForm" action="${pageContext.request.contextPath}/user/register" method="post" enctype="multipart/form-data">
		<table border="1" style="width: 100%; text-align: left;">
			<!-- 기업인증영역 -->
			<c:if test="${sessionScope.userType == 2}">
				<tr>
					<th>사업자등록번호</th>
					<td>
						<input type="text" name="bizRegNo" required>
					</td>
				</tr>
				<tr>
					<th>사업자등록증 업로드</th>
					<td>
						<input type="file" name="bizFile" accept=".jpg,.jpeg,.png,.pdf" required>
						<button type="button" onclick="confirmBizFileUpload()">[파일 등록]</button>
						<span id="biz-file-result" style="margin-left: 10px; color: green;"></span>
					</td>
				</tr>
			</c:if>
	
			<!-- 공통 입력 영역 -->
			<tr>
				<th>이메일</th>
				<td>
					<input type="email" name="userEmail" required>
					<button type="button" onclick="confirmEmailAuth()">[이메일 인증]</button>
					<span id="email-auth-result" style="margin-left: 10px; color: green;"></span>
				</td>
			</tr>
			<tr>
				<th><label for="userName"><c:if test="${sessionScope.userType == 1}">회원이름</c:if><c:if test="${sessionScope.userType == 2}">회사명</c:if></label></th>
				<td><input type="text" name="userName" id="userName" required></td>
			</tr>
	
			<tr>
				<th><label for="userRepName"><c:if test="${sessionScope.userType == 1}">닉네임</c:if><c:if test="${sessionScope.userType == 2}">대표관리자명</c:if></label></th>
				<td><input type="text" name="userRepName" id="userRepName"></td>
			</tr>
	
			<tr>
				<th><label for="userBirth"><c:if test="${sessionScope.userType == 1}">생년월일</c:if><c:if test="${sessionScope.userType == 2}">설립일</c:if></label></th>
				<td><input type="date" name="userBirth" id="userBirth" required></td>
			</tr>
	
			<c:if test="${sessionScope.userType == 1}">
				<tr>
					<th><label for="userGender">성별</label></th>
					<td>
						<select name="userGender" id="userGender" required>
							<option value="">선택</option>
							<option value="M">남자</option>
							<option value="F">여자</option>
						</select>
					</td>
				</tr>
			</c:if>
	
			<tr>
				<th><label for="userId">아이디</label></th>
				<td><input type="text" name="userId" id="userId" required></td>
			</tr>
	
			<tr>
			    <th><label for="userPassword">비밀번호</label></th>
			    <td>
			    	<input type="password" name="userPassword" id="userPassword" required>
			   		<div id="checkPasswdResult" style="margin-top: 5px;"></div>
			    </td>
			</tr>

			<tr>
			    <th><label for="userPasswordConfirm">비밀번호 확인</label></th>
			    <td>
			        <input type="password" id="userPasswordConfirm" name="userPasswordConfirm" required>
			        <span id="pw-match-msg" style="margin-left: 10px;"></span>
			        <div id="checkPasswd2Result" style="margin-top: 5px;"></div>
			    </td>
			</tr>
			
			<tr>
				<th><label for="userPhoneNumber"><c:if test="${sessionScope.userType == 1}">휴대폰번호</c:if><c:if test="${sessionScope.userType == 2}">기업전화번호</c:if></label></th>
				<td><input type="text" name="userPhoneNumber" id="userPhoneNumber" required></td>
			</tr>
	
			<tr>
				<th><label for="userPhoneNumberSub"><c:if test="${sessionScope.userType == 1}">비상연락망</c:if><c:if test="${sessionScope.userType == 2}">대표관리자번호</c:if></label></th>
				<td><input type="text" name="userPhoneNumberSub" id="userPhoneNumberSub"></td>
			</tr>
	
			<tr>
				<th>주소</th>
				<td>
					<input type="text" name="userPostcode" id="userPostcode" placeholder="우편번호" required readonly style="width: 150px;">
					<input type="button" value="주소검색" id="btnSearchAddress"><br>
					<input type="text" name="userAddress1" id="userAddress1" placeholder="기본주소" required readonly style="width: 70%;"><br>
					<input type="text" name="userAddress2" id="userAddress2" placeholder="상세주소" required style="width: 70%;">
				</td>
			</tr>
		</table>
		<input type="hidden" name="userType" value="${sessionScope.userType}"/>
		<p><button type="submit">회원가입</button></p>
	</form>
	
</body>
<script src="${pageContext.request.contextPath}/resources/js/user/join_form.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</html>
