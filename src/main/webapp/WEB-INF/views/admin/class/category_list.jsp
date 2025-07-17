<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자페이지</title>
<link href="${pageContext.request.contextPath}/resources/css/admin/modal.css" rel="stylesheet" type="text/css">
</head>
<body>
	<header>
		<jsp:include page="/WEB-INF/views/admin/header.jsp"></jsp:include>
	</header>
	<div class="modal" id="add_category">
		<div class="modal_body">
			<h3>카테고리 등록</h3>
			<form action="/admin/category/add" method="post">
				<div>
					<label>카테고리 이름</label>
					<input type="text"  name="categoryName"/>
				</div>
				<div>
					<span>대분류</span>
					<select name="parentIdx">
						<option value="no_parent">없음</option>
						<c:forEach var="category" items="${parentCategories}">
							<option value="${fn:substringAfter(category.categoryIdx, 'CT_')}">${fn:substringAfter(category.categoryIdx, 'CT_')}</option>
						</c:forEach>
					</select>
					<span>1차 카테고리는 없음 선택</span>
				</div>
				<div>
					<label>카테고리 순서</label>
					<input type="number" name="sortOrder"/>
				</div>
				<button type="button" onclick="closeAddModal()">닫기</button>
				<button type="submit">등록하기</button>
			</form>
		</div>
	</div>
	<main class="main">
		<jsp:include page="/WEB-INF/views/admin/sidebar.jsp"></jsp:include>
		<div class="main_container">
			<div style="border: 1px solid black;">
				<h5>카테고리 편집</h5>
			</div>
			<div style="border: 1px solid black;">
				<div>
					<div>
						<h3>대분류</h3>
						<button type="button" onclick="onAddModal()">추가</button>
					</div>
				</div>
				<table id="parentTable">
					<thead>
						<tr>
							<th>#</th>
							<th>대분류</th>
							<th>카테고리 이름</th>
							<th>카테고리 순서</th>
							<th colspan="2"></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="category" items="${parentCategories}">
							<tr>
								<td><input type="checkbox" /></td>
								<td><input type="text"
									value="${fn:substringAfter(category.categoryIdx, 'CT_')}" /></td>
								<td><input type="text" value="${category.categoryName}"></td>
								<td><input type="text" value="${category.sortOrder}" /></td>
								<td>
									<button type="button" onclick="onModifyModal('${category.categoryIdx}')">수정</button>
									<button type="button" onclick="deleteCategory('${category.categoryIdx}', ${category.depth})">삭제</button>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div>
				<div>
					<div>
						<h3>소분류</h3>
					</div>
				</div>
				<table id="childTable">
					<thead>
						<tr>
							<th>#</th>
							<th>대분류</th>
							<th>소분류</th>
							<th>카테고리 이름</th>
							<th>카테고리 순서</th>
							<th colspan="2"></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="category" items="${childCategories}">
							<tr>
								<td><input type="checkbox" /></td>
								<td><input type="text"  value="${fn:substringAfter(category.parentIdx, 'CT_')}"/></td>
								<c:set var="prefix" value="${category.parentIdx}_" />
								<td><input type="text"
									value="${fn:substringAfter(category.categoryIdx, prefix)}" /></td>
								<td><input type="text" value="${category.categoryName}" /></td>
								<td><input type="text" value="${category.sortOrder}" /></td>
								<td>
									<button type="button" onclick="onModifyModal('${category.categoryIdx}')">수정</button>
									<button type="button" onclick="deleteCategory('${category.categoryIdx}', ${category.depth})">삭제</button>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		<div class="modal" id="modify_category">
			<div class="modal_body">
				<h3>카테고리 수정</h3>
				<form action="/admin/category/update" method="post">
					<input type="hidden" name="categoryIdx"/>
					<div>
						<label>카테고리 이름</label>
						<input type="text"  name="categoryName"/>
					</div>
					<div>
						<span>대분류</span>
						<select name="parentIdx">
							<option value="no_parent">없음</option>
						    <c:forEach var="p" items="${parentCategories}">
						        <option value="${fn:substringAfter(p.categoryIdx, 'CT_')}"
						            <c:if test="${fn:substringAfter(p.categoryIdx, 'CT_')}">selected</c:if>
						        >
						            ${fn:substringAfter(p.categoryIdx, 'CT_')}
						        </option>
						    </c:forEach>
						</select>
						<span>1차 카테고리는 없음 선택</span>
					</div>
					<div>
						<label>카테고리 순서</label>
						<input type="number" name="sortOrder"/>
					</div>
					<button type="button" onclick="closeModifyModal()">닫기</button>
					<button type="submit">저장</button>
				</form>
			</div>
		</div>
	</main>
	<footer>
		<jsp:include page="/WEB-INF/views/admin/bottom.jsp"></jsp:include>
	</footer>
	<script type="text/javascript">
		function onAddModal() {
			const modal = document.querySelector('#add_category');
			modal.style.display = "block";
		}
		
		function closeAddModal() {
			const modal = document.querySelector('#add_category');
			modal.style.display = "none";
		}
		
		function onModifyModal(categoryIdx) {
		    fetch(`/admin/category/modify?cId=` + categoryIdx )
		        .then(response => response.json())
		        .then(data => {
		            document.querySelector('#modify_category input[name="categoryName"]').value = data.categoryName;
		            document.querySelector('#modify_category select[name="parentIdx"]').value = data.parentIdx === null ? 'no_parent' : data.parentIdx.replace('CT_', '');
		            document.querySelector('#modify_category input[name="sortOrder"]').value = data.sortOrder;
		            document.querySelector('#modify_category input[name="categoryIdx"]').value = data.categoryIdx;
		            document.querySelector('#modify_category').style.display = 'block';
		        });
		}
		
		function closeModifyModal() {
			const modal = document.querySelector('#modify_category');
			modal.style.display = "none";
		}
		
		function deleteCategory(categoryIdx, depth) {
			if (confirm("해당 카테고리를 삭제하시겠습니까?")) {
				location.href = "/admin/category/delete?cId=" + categoryIdx + "&depth=" + depth;
			}
		}
		
	</script>
</body>
</html>