<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<title>FindAccount</title>

<link href="CSS/main.css" rel="stylesheet" type="text/css">
<script src="https://kit.fontawesome.com/02846aab38.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/emailjs-com@2.3.2/dist/email.min.js"></script> <!-- emailjs Api --> 

</head>
<body>
<jsp:include page="nav.jsp"></jsp:include>
<div id = 'wrapper'>

	<jsp:include page="/header.jsp"></jsp:include>
	
	<div id="main">
		<section id="cta" class="main">
		
			<header class="major special">
				<h2>ID/PW 찾기 결과</h2>
			</header>
		</section>
		
		<section class="main special">
			<c:choose>
				<c:when test="${pageType == 1 }">
					<div>
						<h3>아이디 찾기 결과</h3>
						<c:choose>
						<c:when test="${mb_id != null }">	
							<p class="messege">
								아이디 : ${mb_id }
							</p>
						</c:when>
						<c:otherwise>
							<p class="messege">
								가입되지 않은 이메일 입니다.
							</p>
						</c:otherwise>
						</c:choose>
					</div>
				</c:when>
				<c:when test="${pageType == 2 }">
					<div>
						<h3>비밀번호 찾기 결과</h3>
						<c:choose>
						<c:when test="${result != null }">
							<h4>임시비밀번호 : <b>${dto[0].mb_pw }</b></h4>	
							<p class="messege">
								임시비밀번호로 로그인한 뒤<br>꼭 비밀번호를 변경해 주세요
							</p>
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
			<div class="actions fit">
				<div class="col-12"><button style="width:100%; margin-top:5px" class="button primary" onclick="location.href='login.slime'">로그인하기</button></div>
				<div class="col-12"><button style="width:100%; margin-top:5px" class="button primary" onclick="location.href='signUpSelect.slime'">회원가입</button></div>
				<div class="col-12"><button style="width:100%; margin-top:5px" class="button" onclick="history.back()">이전 페이지로</button></div>
			</div>
		</section>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</div>
</body>
</html>