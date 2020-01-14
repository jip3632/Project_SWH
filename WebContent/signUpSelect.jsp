<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />

<title>회원 유형 선택</title>
<link rel="stylesheet" href="CSS/main.css" />
<style>
	ul.statistics:hover{
		cursor: pointer;
		color: black;
	}
</style>

</head>
<body class="is-preload">
<jsp:include page="/nav.jsp"></jsp:include>
<div id="wrapper">
	<jsp:include page="/header.jsp"></jsp:include>
	
	<div id="main">
		<header id="header"><h2>회원가입 유형을 선택하세요</h2></header>
		<section id="first" class="main" onclick="location.href = 'signUpUser.slime'">
			<ul class ="statistics">
				<li class="style1">
					<div>일반회원 가입</div>
				</li>

			</ul>
		</section>
		<section id="second" class="main" onclick="location.href = 'signUpManager.slime'">
			<ul class="statistics">
				<li class="style2">
					<div>매장회원 가입</div>
				</li>
			</ul>
		</section>
	</div>

	
	<footer>
	
	</footer>
</div>
<script src="JS/main.js"></script>
</body>
</html>