<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Slime Where?House</title>

<link href="CSS/default.css" rel="stylesheet" type="text/css">
<script src="https://kit.fontawesome.com/02846aab38.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

</head>

<script src="JS/mainStore.js"></script>
<body>
<div id="container">

	<nav>
		<button onclick="location.href='mainStore.slime'">홈버튼</button>
		<c:choose>
			<c:when test="${login == null }">
				<button onclick="location.href='login.slime'">로그인 버튼</button>
			</c:when>
			<c:otherwise>
				<c:choose>
					<c:when test="${mb_type == 1 }">
						<button onclick="location.href='userPage.slime?mb_uid=${mb_uid }'">마이페이지</button>
					</c:when>
					<c:when test="${mb_type == 2 }">
						<button onclick="location.href='managerPage.slime?mb_uid=${mb_uid }'">매장관리</button>
					</c:when>
				</c:choose>
			</c:otherwise>
		</c:choose>
		<button onclick="location.href='reviewList_everyone.slime'">리뷰</button>
		<button onclick=''>고객센터</button>
	</nav>
	
	<header></header>

	<article>
		<div id="searchType">
			<button onclick="location.href='mainStore.slime'">Store</button>
			<button onclick="location.href='mainProduct.slime'">Product</button>
		</div>
		<ul id="buttonList">
			<li><button id = "selectRegion">지역</button></li>
			<li><button class="region" onclick="ajax(1)">서울</button></li>
			<li><button class="region" onclick="ajax(2)">대전</button></li>
			<li><button class="region" onclick="ajax(3)">부산</button></li>
			<li><button class="region">충청도</button></li>
			<li><button class="region">경상도</button></li>
			<li><button class="region">전라도</button></li>
		</ul>
	
		<ul id="storeList">
			
		</ul>
	</article>
	<footer>
	
	</footer>
</div>
</body>
</html>