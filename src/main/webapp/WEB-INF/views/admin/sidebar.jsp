<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/css/admin/sidebar.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/the_best_styles.css" rel="stylesheet" type="text/css">
</head>
<body>
	<nav class="navbar">
	   <a  href="/"><img id="logo" alt="logo" src="${pageContext.request.contextPath}/resources/images/logo4-2.png"></a>
	   <ul>
	   	   <li> <a href="/admin/">main</a></li>
	       <li>
	       		<span>강좌 관리</span>
	       		<ul>
	       			<li>
	       				<a href="/admin/category">카테고리 편집</a>
	       				<a href="/admin/classList">강좌 리스트</a>
	       			</li>
	       		</ul>
	       	</li>
	     	<li>
	           <span>회원 관리</span>
	           <ul>
	             <li>
	               <a href="/admin/user">일반 회원 목록</a>
	               <a href="/admin/company">기업 회원 목록</a>
	             </li>
	           </ul>
			</li>
	   </ul>
	</nav>
</body>
</html>