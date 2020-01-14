<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
<link href="CSS/main.css" rel="stylesheet">
<title>매장 회원 가입</title>
<script src="JS/findAddress.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
	.row button{
		height: 3.3em;
	}
</style>
</head>
<body class="is-preload">
<jsp:include page="/nav.jsp"></jsp:include>
<div id="wrapper">
	<jsp:include page="/header.jsp"></jsp:include>
	<div id="main">
		<section id="intro" class="main special">
			<header class="major">
				<h2>매장 회원 가입</h2>
			</header>
		</section>
		
		<section id="first" class="main">
		<form action="signUpManagerOk.slime" method="post" onsubmit="return chkSubmit()" name="frm">
			<input type="hidden" id="confmKey" name="confmKey" value=""  >

			이름:
			<input type="text" name="user_name" required>
			
			휴대폰번호:
			<input type="text" name="phone_number" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" required>
			
			도로명주소
			<div class="row">
				<div class="col-8">
					<input type="text"  id="roadFullAddr"  name="roadFullAddr" />
				</div>
				<div class="col-4">
					<button class="button fit" type="button" onclick="goPopup();">주소찾기</button>
				</div>
			</div>
			
			아이디: 
			<div class="row">
				<div class="col-6">
					<input type="text" name="user_id" id="user_id" required>
				</div>
				<div class="col-6">
					<button class="button fit" type="button" onclick="ajax();">아이디 중복 확인</button><div id="id_check"></div>
				</div>
			</div>
			
			비밀번호:
				<input type="password" name="user_pw" required>
			
			비밀번호확인: 
				<input type="password" name="user_pw_confirm" required>
			
			이메일: 
				<input type="email" name="user_email" required>
			<br>
			<section class="main special">
				<div class="row aln-center">
					<div class="col-5">
						<button class="button fit" style="width: 100%;" type="reset">초기화</button>
					</div>
					<div class="col-5">
						<button class="button primary fit" style="width: 100%;" type="submit">회원 가입</button>
					</div>
				</div>
			</section>
		</form>
		</section>
	</div>
	<jsp:include page="/footer.jsp"></jsp:include>
</div>
<script src="JS/main.js"></script>
</body>
</html>