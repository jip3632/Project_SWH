<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>
<body>
<div id="container">

	<nav>
	
	</nav>
	<header>
		Slime Where?House
	</header>
	
	<c:choose>
		<c:when test="${session.login == null }">
		<div>
			<form name="frm" action="loginOk.slime" method="post">
				<div>ID: <input type="text" name="id"></div>
				<div>PASSWORD: <input type="password" name="pw"></div>
				<c:choose>
					<c:when test="${param.existId == 0 }">
						<div>아이디가 존재하지 않습니다.</div>
					</c:when>
					<c:when test="${param.existId == 1 }">
						<div>비밀번호가 옳지 않습니다.</div>
					</c:when>
				</c:choose>
				<input type="submit" value="로그인">
			</form>
		</div>
		<div>
			<button>ID/PW 찾기</button>
			<button>회원가입</button>
		</div>
		</c:when>
		<c:otherwise>
		<div>

		</div>
		</c:otherwise>
	</c:choose>
	<footer>
	
	</footer>

</div>
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