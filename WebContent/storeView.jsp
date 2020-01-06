<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<div id="contatiner">
	<nav>
		<div>네비게이션 바</div>
	</nav>
	
	<header>
		<div>${storeInfo[0].st_name }</div>
		<div>${storeInfo[0].st_contact }</div>
		<div>${storeInfo[0].st_hours }</div>
		<div>전화아이콘</div>
	</header>
	
	<article>
		<ul>
			<li>이벤트 리스트</li>
			<c:forEach var="event" items="eventList">
			</c:forEach>
		</ul>
		<div>
			${storeInfo[0].st_address }
		</div>
		
		<!-- 아래로 제품 -->
	</article>
	
	<footer>
	
	</footer>
</div>
</body>
</html>