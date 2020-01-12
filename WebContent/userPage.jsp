<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="beans.*"%>
<%
	MemberDTO[] arr = (MemberDTO[])request.getAttribute("result");
%>
<%
	if(arr == null || arr.length == 0){
%>
		<script>
		alert("로그인 하세요");
		</script>
<%
		return;
	}
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<link href="CSS/main.css" rel="stylesheet">
<style>
	#first .features li{
	}
		@media screen and (max-width: 0px) {

			#nav {
				display: none;
			}

				#nav + #main {
					padding-top: 0;
				}

		}
</style>
<title>마이페이지</title>
</head>
<body>
<div id="wrapper">
	<nav id="nav" class="alt">
			<div>네비게이션 바</div>
	</nav>

	<div id="main">
		<section id="intro" class="main">
		이름: <%= arr[0].getMb_name()%>
		<br>
		아이디: <%= arr[0].getMb_id()%>
		<br>
		주소: <%= arr[0].getMb_address()%>
		<br>
		전화번호: <%= arr[0].getMb_cell()%>
		<br>
		이메일: <%= arr[0].getMb_email()%>
		<br>
		</section>
		<section id="first" class="main special">
		<ul class="features">
			<%-- 회원정보 변경 버튼 --%>
			<li>
			<button class="button primary fit" type="button" onclick="location.href = 'memberSetting.slime?mb_uid=<%= arr[0].getMb_uid() %>'">회원 정보 변경</button>
			</li>

			<li>
			<%-- 내 리뷰 관리 버튼--%>
			<button class="button primary fit" type="button" onclick="location.href = 'reviewListU.slime?mb_uid=<%= arr[0].getMb_uid() %>&page=1'">내 리뷰 관리</button>
			</li>

			<li>
			<%-- 로그아웃 버튼 --%>
			<button class="button fit" type="button" onclick="location.href = 'logout.slime'">로그아웃</button>
			</li>
		</ul>
	</section>
</div>
	<jsp:include page="/footer.jsp"></jsp:include>
</div>
</body>
</html>