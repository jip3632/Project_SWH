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
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<script src="https://kit.fontawesome.com/02846aab38.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="JS/mainProduct.js"></script>

</head>
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
				<div class = "row aln-center" style="margin-bottom:10px;">
					<div class="col-5"><a class="button" style="width:100%" type="button" href="mainStore.slime">매장검색</a></div>
					<div class="col-5"><a class="button primary" style="width:100%" href="mainProduct.slime">슬라임검색</a></div>
				</div>
				</header>
				<div class ="row aln-center">
					<div class="col-6">
						<form method="GET" style="margin:2em 0 2em 0;">
							<input type="text" name="word" id="wordSearch">
						</form>
					</div>
				</div>
				<div class="row aln-center">
					<div class="col-3">
						<button type="button" class="button large primary" onclick="ajax();">검색</button>
					</div>
				</div>
			</section>
			<section class="main special">
				<ul id="product_list" class="features alt">
					<li><p>제품 이름을 검색해주세요 </p></li>
				</ul>
			</section>
		</div>

	<jsp:include page="/footer.jsp"></jsp:include>
	
</div>
</body>
</html>