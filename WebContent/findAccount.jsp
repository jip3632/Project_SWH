<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<title>ID/PW 찾기</title>
</head>

<link href="CSS/main.css" rel="stylesheet" type="text/css">
<script src="https://kit.fontawesome.com/02846aab38.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/emailjs-com@2.3.2/dist/email.min.js"></script> <!-- emailjs Api --> 

<body class="is-preload">
<jsp:include page="nav.jsp"></jsp:include>
<div id = 'wrapper'>
	
	
	<jsp:include page="/header.jsp"></jsp:include>
	
	<div id="main">
		<jsp:include page="/nav_swp.jsp"></jsp:include>
		<section id="cta" class="main">
			<header class="major special">
				<h2>ID/PW 찾기</h2>
			</header>
		</section>
	
		<section class="main">
		
			<div id='findId'>
				<h3>아이디 찾기</h3>
				<form name="findIdFrm" action="findAccountResult.slime" method="post">
					<div><input type="hidden" name="type" value="findId"></div>
					<div>email:<input type="text" name="email" class="email"></div><br>
					<div><input class="button primary" type="submit" value="Find"></div>
				</form>
			</div>
		</section>
		<section class="main">
			<div id = 'findPW'>
				<h3>비밀번호 찾기</h3>
				<form name="findPwFrm" action="findAccountResult.slime" method="post">
					<div><input type="hidden" name="type" value="findPw"></div>
					<div>id:<input type="text" name="id" class="id"></div>
					<div>email:<input type="text" name="email" class="email"></div><br>
					<div><input class="button primary" type="submit" value="Find"></div>
				</form>
			</div>
		</section>
	</div>
	
	<jsp:include page="footer.jsp"></jsp:include>
</div>
<script src="JS/main.js"></script>
</body>
</html>