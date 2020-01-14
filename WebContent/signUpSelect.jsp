<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />

<title>회원 유형 선택</title>
<link rel="stylesheet" href="CSS/main.css" />
<script src="https://kit.fontawesome.com/02846aab38.js" crossorigin="anonymous"></script>
</head>
<body class="is-preload">
	<jsp:include page="/nav.jsp"></jsp:include>
	<div id="wrapper">
		<jsp:include page="/header.jsp"></jsp:include>		
		<div id="main">
			<section class="main special">
				<header class="major">
					<h2>회원 유형 선택</h2>
				</header>
			</section>
			<section id="first" class="main">
				<ul class ="statistics">
					<li class="style1">
						<a href="signUpUser.slime">일반회원 가입</a>
					</li>
				</ul>
			</section>
			<section id="second" class="main">
				<ul class="statistics">
					<li class="style2">
						<a href="signUpManager.slime">매장회원 가입</a>
					</li>
				</ul>
			</section>
		</div>
	</div>
	<jsp:include page="/footer.jsp"></jsp:include>
	<script src="JS/main.js"></script>
	
</body>
</html>