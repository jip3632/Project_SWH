<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="beans.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
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
<jsp:include page="/nav.jsp"></jsp:include>
<div id="wrapper">
<jsp:include page="/header.jsp"></jsp:include>
	<div id="main">
	<section id="content" class="main special">
	<header class="major">
		<h2>마이페이지</h2>
	</header>
<div style="text-align:left;">
		<u><strong>이름</strong></u><br> <%= arr[0].getMb_name()%>
		<br><br>
		<u><strong>아이디</strong></u><br> <%= arr[0].getMb_id()%>
		<br><br>
		<u><strong>주소</strong></u><br> <%= arr[0].getMb_address()%>
		<br><br>
		<u><strong>전화번호</strong></u><br> <%= arr[0].getMb_cell()%>
		<br><br>
		<u><strong>이메일</strong></u><br> <%= arr[0].getMb_email()%>
		<br><br>
</div>
		<ul class="features">
			<%-- 회원정보 변경 버튼 --%>
			<li>
			<button class="button primary fit" type="button" onclick="location.href = 'memberSetting.slime?mb_uid=<%= arr[0].getMb_uid() %>'">회원 정보 변경</button>
			</li>
			<c:if test="${mb_type != 2 }">
				<li>
				<%-- 내 리뷰 관리 버튼--%>
				<button class="button primary fit" type="button" onclick="location.href = 'reviewListU.slime?mb_uid=<%= arr[0].getMb_uid() %>&page=1'">내 리뷰 관리</button>
				</li>
			</c:if>

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