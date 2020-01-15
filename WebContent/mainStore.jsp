<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<title>Slime Where?House</title>
<style type="text/css">
	li.store:hover {
		cursor:pointer;
		border-radius:10%;
		border:1px solid pink;
	}
</style>
<link href="CSS/main.css" rel="stylesheet" type="text/css">
<script src="https://kit.fontawesome.com/02846aab38.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

</head>

<script src="JS/mainStore.js"></script>
<body class="is-preload">
	
	<%-- *************모바일 내비게이션  --%>
	<jsp:include page="/nav.jsp"></jsp:include>
	
<div id="wrapper">
	
	<jsp:include page="/header.jsp"></jsp:include>

	<div id="main">
		<%-- *********추가할것***웹 내비게이션 --%>
		<jsp:include page="/nav_swp.jsp"></jsp:include>
		<section id="cta" class="main special">
			<header class="major">
				<h2>Search slime</h2>
				<p>원하는 슬라임이나 매장을 빠르고 쉽게 검색하세요<br /></p>
				<div class = "row aln-center" style="margin-bottom:10px;">
					<div class="col-5"><a class="button primary" style="width:100%" type="button" href="mainStore.slime">매장검색</a></div>
					<div class="col-5"><a class="button" style="width:100%" href="mainProduct.slime">제품검색</a></div>
				</div>
			</header>
			
			<footer class="major">

				<div class="row aln-center">
					<div class="col-10">
						<select name="regionSelect" id="regionSelect" onchange="ajax($(this).val())">
							<option value="0">-지역 선택-</option>
							<option value="1">서울</option>
							<option value="2">대전</option>
							<option value="3">부산</option>
						</select>
					</div>
				</div>
			</footer>
		</section>

		<section class="main special">
			<ul id="storeList" class="features">
				<li>
					<p>검색을 원하시는 지역을 선택해 주세요.<br>
					검색결과는 거리순으로 정렬됩니다.<br>
					<b>슬라임검색</b> 버튼을 누르면<br>
					<b>슬라임명</b>으로 검색할 수 있습니다.
					</p>
				</li>
			</ul>
		</section>
	</div>

	<jsp:include page="/footer.jsp"></jsp:include>
</div>
	<script src="JS/main.js"></script>
</body>
</html>


