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
<title>마이페이지</title>
</head>
<body>

<article>
	<div>
		이름: <%= arr[0].getMb_name()%>
		<br>
		아이디: <%= arr[0].getMb_id()%>
		<br>
		비밀번호: <%= arr[0].getMb_pw()%>
		<br>
		주소: <%= arr[0].getMb_address()%>
		<br>
		전화번호: <%= arr[0].getMb_cell()%>
		<br>
		이메일: <%= arr[0].getMb_email()%>
		<br>
	</div>
	<div>
		<button onclick="location.href = #">회원 정보 변경</button>
		<button onclick="location.href = #">찜 정보 확인</button>
		<button onclick="location.href = #">내 리뷰 관리</button>
	</div>
</article>
</body>
</html>