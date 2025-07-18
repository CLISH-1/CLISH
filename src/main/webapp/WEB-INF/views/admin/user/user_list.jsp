<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자페이지</title>
<link
	href="${pageContext.request.contextPath}/resources/css/the_best_styles.css"
	rel="stylesheet" type="text/css">
</head>
<body>
	<div class="container">
		<div class="sidebar">
			<jsp:include page="/WEB-INF/views/admin/sidebar.jsp"></jsp:include>
		</div>
		<div class="main">
			<div class="navbar-expand">
				<h4 class="pageSubject">CLISH 관리자 대시보드</h4>
				<div>관리자</div>
			</div>
			<div class="main_container">
				<div class="bg-light">
					<div>
						<div>
							<h5 class="sub-title">일반 회원 목록</h5>
						</div>
						<div class="form" >
							<select>
								<option>전체</option>
								<option>최신가입순</option>
								<option>오래된가입순</option>
								<option>신고</option>
							</select>
							<input type="text" />
							<button>검색</button>
						</div>
					</div>
					<div>
						<div>
							<table class="table">
								<thead>
									<tr>
										<th>회원번호</th>
										<th>회원아이디</th>
										<th>이름</th>
										<th>연락처</th>
										<th>이메일</th>
										<th>성별</th>
										<th>가입일</th>
										<th colspan="2"></th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="user" items="${users}">
										<tr onclick="location.href='/admin/user/${user.userIdx}'">
											<td>${user.userIdx}</td>
											<td>${user.userId}</td>
											<td>${user.userName}</td>
											<td>${user.userPhoneNumber}</td>
											<td>${user.userEmail}</td>
											<td>${user.userGender}</td>
											<td>${user.userRegDate}</td>
											<td>
												<button onclick="location.href=`/admin/user/${user.userIdx}">수정</button>
											</td>
											<td>
												<c:choose>
													<c:when test="${user.userStatus == 3}">
														<button class="gray-button" disabled>탈퇴회원</button>
													</c:when>
													<c:otherwise>
														<button type="button"
															onclick="event.stopPropagation(); withdraw('${user.userIdx}')">
															탈퇴</button>
													</c:otherwise>
												</c:choose>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		function withdraw(userIdx) {
			if (confirm("탈퇴 처리하시겠습니까?")) {
		        const form = document.createElement('form');
		        form.method = 'POST';
		        form.action = "/admin/user/" + userIdx + "/withdraw";
		        document.body.appendChild(form);
		        form.submit();
			}
		}
	</script>
</body>
</html>