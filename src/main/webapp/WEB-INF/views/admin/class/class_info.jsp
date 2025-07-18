<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/css/admin/modal.css" rel="stylesheet" type="text/css">
</head>
<style>
	
</style>
<body>
	<header>
		<jsp:include page="/WEB-INF/views/admin/header.jsp"></jsp:include>
	</header>
	<div class="modal">
		<div class="modal_body">
			<h3>강좌 반려</h3>
			<form action="/admin/class/${classInfo.classIdx}/reject" method="post">
				<div>
					<label>강좌명</label>
					<input type="text" value="${classInfo.classTitle}" readonly/>
				</div>
				<div>
					<label>반려사유</label>
					<textarea rows="10" cols="20" name="content"></textarea>
				</div>
				<button type="button" onclick="closeModal()">닫기</button>
				<button type="submit">반려하기</button>
			</form>
		</div>
	</div>
	<main class="main">
	<jsp:include page="/WEB-INF/views/admin/sidebar.jsp"></jsp:include>
		<div>
			<form id="classForm">
				<input type="hidden" name="userIdx" id="userIdx" value="${classInfo.userIdx}"/>
				<div>
					<label>강좌 이름</label>
					<input type="text" value="${classInfo.classTitle}" name="classTitle" id="classTitle" />
				</div>
				<div>
					<label>정원</label>
					<input type="text" value="${classInfo.classMember}" name="classMember" id="classMember" />
				</div>
				<div>
					<label>가격</label>
					<input type="text" value="${classInfo.classPrice}" name="classPrice" id="classPrice" />
				</div>
				<div>
					<label>시작날짜</label>
						<input type="date" value="${classInfo.startDate}" name="startDate" id="startDate"/>
				</div>
				<div>
					<label>종료날짜</label>
						<input type="date" value="${classInfo.endDate}" name="endDate" id="endDate"/>
				</div>
				<div>
					<label>수업요일</label>
					<input type="checkbox" class="day-checkbox" value="1"
						<c:if test="${fn:contains(classInfo.classDayNames, '월')}">checked</c:if>/>월
					<input type="checkbox" class="day-checkbox" value="2"
						<c:if test="${fn:contains(classInfo.classDayNames, '화')}">checked</c:if>/>화
					<input type="checkbox" class="day-checkbox" value="4"
						<c:if test="${fn:contains(classInfo.classDayNames, '수')}">checked</c:if>/>수
					<input type="checkbox" class="day-checkbox" value="8"
						<c:if test="${fn:contains(classInfo.classDayNames, '목')}">checked</c:if>/>목
					<input type="checkbox" class="day-checkbox" value="16"
						<c:if test="${fn:contains(classInfo.classDayNames, '금')}">checked</c:if>/>금
					<input type="checkbox" class="day-checkbox" value="32"
						<c:if test="${fn:contains(classInfo.classDayNames, '토')}">checked</c:if>/>토
					<input type="checkbox" class="day-checkbox" value="64"
						<c:if test="${fn:contains(classInfo.classDayNames, '일')}">checked</c:if>/>일
					<input type="hidden" name="classDays" id="classDays"/>
				</div>
				<div>
					<label>수업장소</label>
					<input type="text" value="${classInfo.location}" name="location" id="location" />
				</div>
				<div>
					<div>
						<div>대분류</div>
						<select>
							<c:forEach var="category" items="${parentCategories}">
								<option value="${category.categoryIdx}"
									 <c:if test="${selectedParentCategory != null && category.categoryIdx == selectedParentCategory.categoryIdx}">selected</c:if>>
									 ${category.categoryName}
								</option>
							</c:forEach>
						</select>
					</div>
					<div>
						<div>소분류</div>
						<select name="categoryIdx">
							<c:forEach var="category" items="${childCategories}">
								<option value="${category.categoryIdx}"
									 <c:if test="${selectedChildCategory != null && category.categoryIdx == selectedChildCategory.categoryIdx}">selected</c:if>>
									 ${category.categoryName}
								</option>
							</c:forEach>
						</select>
					</div>
				</div>
				<c:if test="${classInfo.classStatus != 1}">
					<div>
						<span>공개상태</span>
						<select name="classStatus">
							<option value="2"  <c:if test="${classInfo.classStatus == 2}">selected</c:if>>오픈</option>
							<option value="3"  <c:if test="${classInfo.classStatus == 3}">selected</c:if>>마감</option>
						</select>
					</div>
				</c:if>
				<button type="button" onclick="history.back();">닫기</button>
				<c:choose>
					<c:when test="${classInfo.classStatus == 1}">
						<button type="submit" name="action" value="approval"
							formaction="/admin/class/${classInfo.classIdx}/approve" formmethod="post">
							승인
						</button>
						<button type="button" onclick="onModal()">반려</button>
					</c:when>
					<c:otherwise>
						<button type="submit" name="action" value="update"
							formaction="/admin/class/${classInfo.classIdx}/update" formmethod="post">
							수정
						</button>
					</c:otherwise>
				</c:choose>
			</form>
		</div>
	</main>
	<footer>
		<jsp:include page="/WEB-INF/views/admin/bottom.jsp"></jsp:include>
	</footer>
	<script type="text/javascript">
		function onModal() {
			const modal = document.querySelector('.modal');
			modal.classList.add("on");
		}
		
		function closeModal() {
			const modal = document.querySelector('.modal');
			modal.classList.remove("on");
		}
		
		function calculateClassDays() {
			let total = 0;
			document.querySelectorAll(".day-checkbox:checked").forEach(cb => {
				total += parseInt(cb.value);
			});
			document.getElementById('classDays').value = total;
		}
		
		document.getElementById("classForm").addEventListener("submit", function (e) {
			calculateClassDays();
		});
	</script>
</body>
</html>