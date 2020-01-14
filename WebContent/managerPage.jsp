<%@page import="beans.FileDTO"%>
<%@page import="beans.StoreDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	StoreDTO[] arr = (StoreDTO[])request.getAttribute("result");
	FileDTO[] farr = null;
	farr = (FileDTO[]) request.getAttribute("image");

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
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<style>
	@media screen and (max-width: 736px){
		.features li {
			margin-top: 1em;
		}
		.features li:nth-child(2) {
			margin-top: 1em;
		}
		.features li:nth-child(3) {
			margin-top: 1em;
		}
	}

</style>
<title>매장 관리</title>
</head>
<body>
<jsp:include page="/nav.jsp"></jsp:include>
<div id="wrapper">
	<jsp:include page="/header.jsp"></jsp:include>
	
	<div id="main">
	<%-- TODO 매장사진, 매장명, 주소, 연락처, 이메일(표시x 이유:매장이아닌 회원정보mb_email에 담겨있음), 영업시간 표시 
	SL_offstore 테이블에서 
	st_img, st_name, st_address, st_contact, st_email, st_hours 
	가져오기 --%>
		<section id="intro" class="main special">
			<div class="spotlight">
				<div class="content">
					<header class="major">
						<h2><%= arr[0].getSt_name()%></h2>
					</header>
					<div>
					주소: <%= arr[0].getSt_address()%>
					</div>
					<div>
					연락처: <%= arr[0].getSt_contact()%>
					</div>
					<div>
					영업시간: <%= arr[0].getSt_hours()%>
					</div>
				</div>
				<span class="image">
					<img src="upload/offstore/<%=farr[0].getFile()%>" alt="<%=farr[0].getFile()%>"/>
				</span>
			</div>
		</section>
		<section id="first" class="main special">
			<ul class="features">
				<%-- 매장정보 변경 버튼 --%>
				<li>
				<button class="button primary fit" type="button" onclick="location.href = 'userPage.slime?mb_uid=<%= arr[0].getMb_uid()%>'">마이 페이지</button>
				</li>

				<li>
				<%-- 매장정보 변경 버튼 --%>
				<button class="button primary fit" type="button" onclick="location.href = 'storeSetting.slime?mb_uid=<%= arr[0].getMb_uid()%>'">매장 정보 변경</button>
				</li>

				<li>
				<%-- 제품관리 버튼 --%>
				<button class="button primary fit" type="button" onclick="location.href = 'productList.slime?st_uid=<%= arr[0].getSt_uid()%>'">제품 관리</button>
				</li>

				<li>
				<%-- 이벤트 관리 버튼--%>
				<button class="button primary fit" type="button" onclick="location.href = 'eventList.slime?st_uid=<%= arr[0].getSt_uid()%>&page=1'">이벤트 관리</button>
				</li>

				<li>
				<%-- 후기 관리 버튼--%>
				<button class="button primary fit" type="button" onclick="location.href = 'reviewListM.slime?st_uid=<%= arr[0].getSt_uid()%>&page=1'">후기 관리</button>
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