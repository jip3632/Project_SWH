<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />

<title>일반 유저 회원 가입</title>
<script src="JS/findAddress.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="CSS/main.css" />

</head>
<body class="is-preload">
<div id="wrapper">
	<nav>
		<div>네비게이션 바</div>
	</nav>
	
	<header id="header"><h2>일반 회원 가입</h2></header>
	
	<div id="main">
		<section id="section" class="main">
			<form action="signUpUserOk.slime" method="post" onsubmit="return chkSubmit()" name="frm">	
					이름: <input type="text" name="user_name" required><br>
					휴대폰번호: <input type="text" name="phone_number" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" required><br>
					<input type="hidden" id="confmKey" name="confmKey" value=""  >
					
					도로명주소:<input type="text"  id="roadFullAddr"  name="roadFullAddr" /><button type="button" onclick="goPopup();">주소찾기</button><br> 
					아이디: 
					
					<input type="text" name="user_id" id="user_id" required><div id="id_check"></div><br>
					
					
					<button type="button" onclick="ajax();">아이디 중복 확인</button>
					
					비밀번호: <input type="password" name="user_pw" required><br>
					비밀번호확인: <input type="password" name="user_pw_confirm" required><br>
					이메일: <input type="email" name="user_email" required><br>
					
					<input type="reset" class="button">
					<input type="submit" class="button primary">
			</form>	
		</section>
	</div>
	
	
	
	<footer>
	
	</footer>
</div>

</body>
</html>