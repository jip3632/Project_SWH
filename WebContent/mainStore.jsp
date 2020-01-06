<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Slime Where?House</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>

<script src="JS/mainStore.js"></script>
<body>
<div id="container">
	<nav>
		<div>네비게이션 바</div>
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