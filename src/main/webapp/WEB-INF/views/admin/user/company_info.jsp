<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
			<form>
				<div>
					<label>회사명</label>
					<input type="text" value="${company.userName}" name="userName" id="userName" <c:if test="${company.userStatus eq 5}">readonly</c:if>/>
				</div>
				<div>
					<label>아이디</label>
					<input type="text" value="${company.userId}" name="userId" id="userId" <c:if test="${company.userStatus eq 5}">readonly</c:if>/>
				</div>
				<div>
					<label>이메일</label>
					<input type="text" value="${company.userEmail}" name="userEmail" id="userEmail" <c:if test="${company.userStatus eq 5}">readonly</c:if>/>
				</div>
				<div>
					<label>전화번호</label>
					<input type="text" value="${company.userPhoneNumber}" name="userPhoneNumber" id="userPhoneNumber" <c:if test="${company.userStatus eq 5}">readonly</c:if>/>
				</div>
				<div>
					<label>우편번호</label>
					<input type="text" value="${company.userPostcode}" name="userPostcode" id="userPostcode" <c:if test="${company.userStatus eq 5}">readonly</c:if>/>
				</div>
				<div>
					<label>기본 주소</label>
					<input type="text" value="${company.userAddress1}" name="userAddress1" id="userAddress1" <c:if test="${company.userStatus eq 5}">readonly</c:if>/>
				</div>
				<div>
					<label>상세 주소</label>
					<input type="text" value="${company.userAddress2}" name="userAddress2" id="userAddress2" <c:if test="${company.userStatus eq 5}">readonly</c:if>/>
				</div>
				<button type="button" onclick="history.back();">닫기</button>
				<c:choose>
					<c:when test="${company.userStatus eq 5}">
						<button type="submit" name="action" value="approval" 
								formaction="/admin/company/${company.userIdx}/approve" formmethod="post">승인</button>
						<button type="submit" name="action" value="update" 
								formaction="/admin/company/${company.userIdx}/update" formmethod="post">수정</button>
					</c:when>
					<c:otherwise>
						<button type="submit" name="action" value="update" 
								formaction="/admin/company/${company.userIdx}/update" formmethod="post">수정</button>
						<button type="submit" name="action" value="cancel_approval" 
								formaction="/admin/company/${company.userIdx}/cancelApproval" formmethod="post">승인취소</button>
					</c:otherwise>
				</c:choose>
			</form>
		</div>
	</main>
	<footer>
		<jsp:include page="/WEB-INF/views/admin/bottom.jsp"></jsp:include>
	</footer>
</body>
</html>