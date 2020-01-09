<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
<title>ID/PW 찾기</title>
</head>

<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/emailjs-com@2.3.2/dist/email.min.js"></script> <!-- emailjs Api --> 
<script src="JS/findAccount.js"></script>

<body>
<div id = 'container'>
	<nav>
	</nav>

	<article>
	
		<div id='findId'>
			<div>아이디 찾기</div>
			<form name="findIdFrm" action="findAccountResult.slime" method="post">
				<input type="hidden" name="type" value="findId">
				<input type="text" name="email" class="email" value="email"><br>
				<input type="submit" value="Find">
			</form>
		</div>
	</article>
	<article>
		<div id = 'findPW'>
			<div>비밀번호 찾기</div>
			<form name="findPwFrm" action="findAccountResult.slime" method="post">
				<input type="hidden" name="type" value="findPw">
				<input type="text" name="id" class="id" value="id"><br>
				<input type="text" name="email" class="email" value="email"><br>
				<input type="submit" value="Find">
			</form>
		</div>
	</article>
	
	<footer>
	</footer>
</div>
</body>
</html>