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
			<div>로그인 완료</div>
			<!-- 회원 타입에따라 아래 버튼 변경 -->
			<button>마이페이지</button>
			<button>로그아웃</button>
		</div>
		</c:otherwise>
	</c:choose>
	
	<footer>
	
	</footer>

</div>
</body>
</html>