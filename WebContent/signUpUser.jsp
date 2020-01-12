<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
<title>일반 유저 회원 가입</title>
<script src="JS/findAddress.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

</head>
<body>
<div class="container">
	<nav>
		<div>네비게이션 바</div>
	</nav>
	
	<header></header>
	<h2>일반 회원 가입</h2>
	<form action="signUpUserOk.slime" method="post" onsubmit="return chkSubmit()" name="frm">
		이름: <input type="text" name="user_name" required><br>
		휴대폰번호: <input type="tel" name="phone_number" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" required><br>
		<input type="hidden" id="confmKey" name="confmKey" value=""  >
		<button type="button" onclick="goPopup();">주소찾기</button>
		도로명주소<input type="text"  id="roadFullAddr"  name="roadFullAddr" /><br> 
		아이디: <input type="text" name="user_id" id="user_id" required><button type="button" onclick="ajax();">아이디 중복 확인</button><div id="id_check"></div><br>
		비밀번호: <input type="password" name="user_pw" required><br>
		비밀번호확인: <input type="password" name="user_pw_confirm" required><br>
		이메일: <input type="email" name="user_email" required><br>
		
		<button type="reset">초기화</button>
		<input type="submit">
	</form>
	
	<footer>
	
	</footer>
</div>

</body>
</html>