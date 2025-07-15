<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자페이지</title>
<link href="${pageContext.request.contextPath}/resources/css/the_best_styles.css" rel="stylesheet" type="text/css">
</head>
<body>
	<header>
		<jsp:include page="/WEB-INF/views/admin/header.jsp"></jsp:include>
	</header>
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
		   			</div>
		   			<div>
		   				<button onclick="addRow()">추가</button>
		   				<button>삭제</button>
		   				<button onclick="save()">저장</button>
		   			</div>
		   		</div>
		   		<table id="parentTable">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>대분류</th>
                            <th>카테고리 이름</th>
                            <th>카테고리 순서</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="category" items="${parentCategories}">
	                        <tr>
	                        	<td><input type="checkbox"/></td>
	                            <td><input type="text" value="${fn:substringAfter(category.categoryIdx, 'CT_')}"/></td>
	                            <td><input type="text" value="${category.categoryName}"></td>
	                            <td><input type="text" value="${category.sortOrder}"/></td>
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
           			<div>
           				<button>삭제</button>
           				<button>추가</button>
           			</div>
           		</div>
                <table id="">
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
	                        	<td><input type="checkbox"/></td>
	                            <td><input type="text" value="${fn:substringAfter(category.parentIdx, 'CT_')}"/></td>
	                            <c:set var="prefix" value="${category.parentIdx}_"/>
	                            <td><input type="text" value="${fn:substringAfter(category.categoryIdx, prefix)}"/></td>
                      	        <td><input type="text" value="${category.categoryName}" /></td>
	                            <td><input type="text" value="${category.sortOrder}"/></td>
	                        </tr>
                        </c:forEach>
                    </tbody>
                </table>
           </div>
        </div>
	</main>
	<footer>
		<jsp:include page="/WEB-INF/views/admin/bottom.jsp"></jsp:include>
	</footer>
	<script type="text/javascript">
		function save() {
			const form = document.createElement('form');
	        form.method = 'POST';
	        form.action = "/admin/category/save";
	        document.body.appendChild(form);
	        form.submit();
		}
		
		function addRow() {
		    const table = document.getElementById("parentTable").getElementsByTagName('tbody')[0];
		    const newRow = table.insertRow();

		    const cell1 = newRow.insertCell();
		    cell1.innerHTML = "<input type='checkbox' />";

		    const cell2 = newRow.insertCell();
		    cell2.innerHTML = "<input type='text' name='categoryIdx' id='categoryIdx' />";

		    const cell3 = newRow.insertCell();
		    cell3.innerHTML = "<input type='text' name='categoryName' id='categoryName' />";

		    const cell4 = newRow.insertCell();
		    cell4.innerHTML = "<input type='text' name='sortOrder' id='sortOrder' />";
		    
		    const cell5 = newRow.insertCell();
		    cell5.innerHTML = "<input type='hidden' value='1' name='depth' id='depth' />";
		}
	</script>
</body>
</html>