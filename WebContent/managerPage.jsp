<%@page import="beans.StoreDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	StoreDTO[] arr = (StoreDTO[])request.getAttribute("result");
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
<title>매장 관리</title>
</head>
<body>

<article>
	<%-- TODO 매장사진, 매장명, 주소, 연락처, 이메일(표시x 이유:매장이아닌 회원정보mb_email에 담겨있음), 영업시간 표시 
	SL_offstore 테이블에서 
	st_img, st_name, st_address, st_contact, st_email, st_hours 
	가져오기 --%>
	<div>
		매장사진 <%= arr[0].getSt_img()%>
		<br>
		매장명: <%= arr[0].getSt_name()%>
		<br>
		주소: <%= arr[0].getSt_address()%>
		<br>
		연락처: <%= arr[0].getSt_contact()%>
		<br>
		영업시간: <%= arr[0].getSt_hours()%>
		<br>
	</div>
	<div>
		<%-- 매장정보 변경 버튼 --%>
		<button onclick="location.href = ''">회원 정보 변경</button>
		<%-- 매장정보 변경 버튼 --%>
		<button onclick="location.href = 'storeSetting.slime?mb_uid=<%= arr[0].getMb_uid()%>'">매장 정보 변경</button>
		<%-- 제품관리 버튼 --%>
		<button onclick="location.href = 'productList.slime'">제품 관리</button>
		<%-- 이벤트 관리 버튼--%>
		<button onclick="location.href = 'eventList.slime?st_uid=<%= arr[0].getSt_uid()%>'">이벤트 관리</button>
		<%-- 후기 관리 버튼--%>
		<button onclick="location.href = 'reviewList.slime'">후기 관리</button>
	</div>
</article>
</body>
</html>