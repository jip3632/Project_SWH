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
<style>
	.row button{
		height: 3.1em;
	}
</style>
</head>
<body class="is-preload">
<jsp:include page="/nav.jsp"></jsp:include>
<div id="wrapper">
	<jsp:include page="/header.jsp"></jsp:include>
	
	<div id="main">
		<jsp:include page="/nav_swp.jsp"></jsp:include>
	
		<section id="intro" class="main special">
			<header class="major">
				<h2>일반 회원 가입</h2>
			</header>
		</section>
		<section id="section" class="main">
			<form action="signUpUserOk.slime" method="post" onsubmit="return chkSubmit()" name="frm">	
				<input type="hidden" id="confmKey" name="confmKey" value=""  >

			이름:
			<input type="text" name="user_name" required>
			
			휴대폰번호: 
			<input type="text" name="phone_number" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" placeholder="예)010-XXXX-XXXX" required>
			
			도로명주소:
			<div class="row">
				<div class="col-8">
					<input type="text"  id="roadFullAddr"  name="roadFullAddr" readonly/>
				</div>
				<div class="col-4">
					<button class="button fit" type="button" onclick="goPopup();">주소찾기</button>
				</div>
			</div>
			
			아이디:
			<div class="row">
				<div class="col-6">
					<input type="text" name="user_id" id="user_id" placeholder="영문과 숫자 조합 4~12자리" required>
				</div>
				<div class="col-6">
					<button class="button fit" type="button" onclick="ajax();">아이디 중복 확인</button>
				</div>
			</div>
			
			<div class="row">
				<div class="col-12" id="id_check"></div>
			</div>
			
			비밀번호:
				<input type="password" id="user_pw" name="user_pw" placeholder="영문과 숫자 조합 4~12자리" required>
			
			비밀번호확인: 
				<input type="password" id="user_pw_confirm" name="user_pw_confirm" placeholder="영문과 숫자 조합 4~12자리" required>
			<div class="row">
				<div class="col-12" id="pw_check"></div>
			</div>
			
			이메일: 
				<input type="email" id="user_email" name="user_email" placeholder="예)slimewherehouse@gmail.com" required>
					<br>
			<section class="main special">
				<div class="row aln-center">
					<div class="col-5">
						<button class="button fit" style="width: 100%;" type="reset">초기화</button>
					</div>
					<div class="col-5">
						<button id="submit_button" class="button primary fit" style="width: 100%;" type="submit" disabled="true">회원 가입</button>
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