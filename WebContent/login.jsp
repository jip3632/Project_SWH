<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<title>Login</title>
</head>

<link href="CSS/main.css" rel="stylesheet" type="text/css">
<script src="https://kit.fontawesome.com/02846aab38.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script src="JS/main.js"></script>

<jsp:include page="nav.jsp"></jsp:include>
<div id="wrapper">
	
	<jsp:include page="/header.jsp"></jsp:include>
	
	<div id="main">
		<jsp:include page="/nav_swp.jsp"></jsp:include>

		<section id="cta" class="main">
			<header class="major special">
				<h2>Login</h2>
			</header>
		</section>
	
		<section class="main">
		<c:choose>
			<c:when test="${session.login == null }">
				<form name="frm" action="loginOk.slime" method="post">
				<div class="row gtr-unifom">
					<div class="col-12 col-12-xsmall">ID: <input type="text" name="id"></div>
					<div class="col-12 col-12-xsmall">PASSWORD: <input type="password" name="pw"></div>
					<c:choose>
						<c:when test="${param.existId == 0 }">
							<div class="col-12" style="color:red">아이디가 존재하지 않습니다.</div>
						</c:when>
						<c:when test="${param.existId == 1 }">
							<div class="col-12" style="color:red">비밀번호가 옳지 않습니다.</div>
						</c:when>
					</c:choose>
					<div class="col-12"><input class="button primary" type="submit" value="로그인" style="width:100%; margin-top:5px;"></div>
				</div>
					
					<div class = "row" style="margin-top:5px">
						<div class="col-6"><button class="button fit" style="width:100%" type="button" onclick="location.href='findAccount.slime'">ID/PW 찾기</button></div>
						<div class="col-6"><button class="button fit" style="width:100%" type="button" onclick="location.href='signUpSelect.slime'">회원가입</button></div>
					</div>
				</form>
			</c:when>
			<c:otherwise>
			<div>
	
			</div>
			</c:otherwise>
		</c:choose>
		</section>
	
	</div>

	<jsp:include page="footer.jsp"></jsp:include>

</div>
	<script src="JS/main.js"></script>
</body>
</html>


<!--
<c:choose>
	<c:when test="${session.login == null }">
		<script>
			location.href = 'login.slime';
		</script>
	</c:when>
	<c:otherwise>
		
		
	</c:otherwise>
</c:choose>
-->