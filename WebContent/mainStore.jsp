<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Slime Where?House</title>

<link href="CSS/main.css" rel="stylesheet" type="text/css">
<script src="https://kit.fontawesome.com/02846aab38.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>

<script src="JS/mainStore.js"></script>
<body>


	<jsp:include page="/nav.jsp"></jsp:include>
	
<div id="wrapper">
	
	<header id="header" class="alt">
		<!--<span class="logo"><img src="upload/logo/logo.png" alt="" /></span>-->
		<h1>Slime Where?House</h1>
	</header>
	
	<div id="main">

		<section id="cta" class="main special">
			<header class="major">
				<h2>Search slime</h2>
				<p>원하는 슬라임이나 매장을 빠르고 쉽게 검색하세요<br /></p>
			</header>
			<footer class="major">
				<ul class="actions special">
					<li><a href="mainStore.slime" class="button primary">Store</a></li>
					<li><a href="mainProduct.slime" class="button">Product</a></li>
				</ul>
				<button id = "selectRegion" class="button primary fit">지역선택</button>
				<div id = "regionList" class="">
					<button class="button fit" onclick="ajax(1)">서울</button>
					<button class="button fit" onclick="ajax(2)">대전</button>
					<button class="button fit" onclick="ajax(3)">부산</button>
					<button class="button fit">경기도</button>
					<button class="button fit">충청도</button>
					<button class="button fit">경상도</button>
					<button class="button fit">전라도</button>
					<button class="button fit">강원도</button>
				</div>
			</footer>
		</section>

		<section class="main special">
			<ul id="storeList" class="features alt">
				<li><p>지역을 선택해 주세요</p></li>
			</ul>
		</section>
	</div>

	<jsp:include page="/footer.jsp"></jsp:include>
</div>

</body>
</html>