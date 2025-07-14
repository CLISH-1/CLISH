<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<link href="${pageContext.request.contextPath}/resources/css/the_best_styles.css" rel="stylesheet" type="text/css">

<hr>
<div id="footer_area">
	<%-- img 태그 사용하여 webapp/resources/images 디렉토리의 logo.png 파일 표시하기 --%>
<!-- 	<img src="/resources/images/logo.png"> -->
	<%-- http://localhost:8081/resources/images/logo.png --%>
	
	<%--
	주의! 클라이언트가 실행하는 HTML 태그 상에서 상대경로로 루트(/) 지정 시
	프로젝트 상의 루트가 아닌 서버 상의 루트를 요청하게 되므로 실제 요청 주소는 다음과 같다.
	http://localhost:8081/resources/images/logo.png
	=> 현재 프로젝트 컨텍스트 루트가 mvc_board 이므로 이 경로 생략 시 존재하지 않는 경로로 404 에러 발생!
	=> 프로젝트 컨텍스트 루트를 실제 루트(/)로 설정시에는 정상적으로 동작하게 됨(아직 배우지 않음)
	--%>
	<%-- 해결책1) /resources 앞에 컨텍스트루트 경로명을 명시 : /mvc_board/resources/images/logo.png  --%>
<!-- 	<img src="/mvc_board/resources/images/logo.png"> -->
	<%-- 해결책2) /resources 앞에 현재 프로젝트 컨텍스트루트명을 자동으로 입력(ex. /test2) --%>
	<%--          EL 활용하여 pageContext 객체의 request 객체 내의 contextPath 값 활용 --%>
	<h1> 바텀메뉴 </h1>
</div>

















