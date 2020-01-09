<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>FindAccount</title>
</head>
<body>
<div id = 'container'>
	<nav>
	</nav>

	<article>
<c:choose>
	<c:when test="${pageType == 1 }">
		<div id="result">
			<h3>아이디 찾기 결과</h3>
			<c:choose>
			<c:when test="${mb_id != null }">	
				<div class="messege">
					아이디 : ${mb_id }
				</div>
			</c:when>
			<c:otherwise>
				<div class="messege">
					가입되지 않은 이메일 입니다.
				</div>
			</c:otherwise>
			</c:choose>
		</div>
	</c:when>
	<c:when test="${pageType == 2 }">
		<div id="result">
			<h3>비밀번호 찾기 결과</h3>
			<c:choose>
			<c:when test="${result != null }">	
				<div class="messege">
					임시비밀번호 : ${dto[0].mb_pw }
				</div>
			</c:when>
			<c:otherwise>
				<div class="messege">
					아이디나 이메일을 다시 확인해 주세요.
				</div>
			</c:otherwise>
			</c:choose>
		</div>
	</c:when>
</c:choose>
	</article>
	
	<footer>
	</footer>
</div>
</body>
</html>