<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
                <h5>기업 회원 목록</h5>
           </div>
           <div class="filter" style="border: 1px solid black;">
               <select>
                    <option>전체</option>
                    <option>최신가입순</option>
                    <option>오래된가입순</option>
                    <option>승인대기</option>
                    <option>승인완료</option>
               </select> 
               <div>
                    <input type="text"/>
               </div>
           </div>
           <div>
                <table class="table">
                    <thead>
                        <tr>
                            <th>회원번호</th>
                            <th>회원아이디</th>
                            <th>이름</th>
                            <th>연락처</th>
                            <th>이메일</th>
                            <th>가입일</th>
                            <th colspan="2">승인여부</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="company" items="${companys}">
	                        <tr onclick="location.href='/admin/company/${company.userIdx}'">
	                            <td>${company.userIdx}</td>
	                            <td>${company.userId}</td>
	                            <td>${company.userName}</td>
	                            <td>${company.userPhoneNumber}</td>
	                            <td>${company.userEmail}</td>
	                            <td>${company.userRegDate}</td>
	                            <td>
                            	    <c:choose>
								        <c:when test="${company.userStatus == 1}">
								            승인
								        </c:when>
								        <c:otherwise>
								            승인대기
								        </c:otherwise>
								    </c:choose>
	                            </td>
	                            <td><button onclick="location.href=`/admin/company/${company.userIdx}">수정</button></td>
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
</body>
</html>