<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="beans.*"%>

<%
	MemberDTO[] arr = (MemberDTO[])request.getAttribute("result");
	int mb_uid = arr[0].getMb_uid();
	String mb_id = arr[0].getMb_id();
	String mb_pw = arr[0].getMb_pw();
	String mb_name = arr[0].getMb_name();
	String mb_address = arr[0].getMb_address();
	String mb_cell = arr[0].getMb_cell();
	String mb_email = arr[0].getMb_email();
	String mb_regdate = arr[0].getMb_regdate();
	int mb_type = arr[0].getMb_type();
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" type="text/css" href="CSS/main.css"/>
<title>회원정보변경</title>
</head>
<script>
	function chkUpdate(){
		var r = confirm("수정하시겠습니까?");
		if(r){ //수정 여부 확인
			var frm = document.forms["frm"];
			var pw = frm.mb_pw.value.trim();
			var pw2 = frm.mb_pw2.value.trim();
			if(pw != pw2){
				alert("비밀번호가 일치하지 않습니다.");
				return false;
			}
			var cell = frm.mb_cell.value.trim();
			var address = frm.mb_address.value.trim();
			var email = frm.mb_email.value.trim();
			
			if(pw == "" || cell == ""|| address == ""|| email == ""){
				alert("모든 정보는 필수 입력란입니다.");
				return false;
			}else{
				return true;
			}
		} else{
			return false;
		}
	};
</script>
<body>
<jsp:include page="/nav.jsp"></jsp:include>
<div id="wrapper">
<jsp:include page="/header.jsp"></jsp:include>
	<div id="main">
	<section id="content" class="main special">
	<header class="major">
		<h2>회원 정보 변경</h2>
	</header>
<form name="frm" action="memberSettingOk.slime" method="post" onsubmit="return chkUpdate()">
	<input type="hidden" name="mb_uid" value="<%= mb_uid%>">
	<div style="text-align:left;">
	<u><strong>이름</strong></u><br> <%= mb_name %> <br><br>
	<u><strong>아이디</strong></u><br> <%= mb_id %> <br><br>
	<u><strong>비밀번호</strong></u><br> <input type="password" name="mb_pw" value="<%= mb_pw %>" required><br>
	<u><strong>비밀번호 확인</strong></u><br> <input type="password" name="mb_pw2" required><br>
	<u><strong>연락처</strong></u><br> <input type="text" name="mb_cell" value="<%= mb_cell %>"><br>
	<u><strong>주소</strong></u><br> <input type="text" name="mb_address" value="<%= mb_address %>"><br>
	<u><strong>이메일</strong></u><br> <input type="text" name="mb_email" value="<%= mb_email %>"><br>
	<u><strong>가입날짜</strong></u><br> <%= mb_regdate %><br>
	<br>
	</div>
	<input type="submit" value="수정">
</form>	
</section>
   	</div>
   <jsp:include page="/footer.jsp"></jsp:include>
</div>

<!-- Scripts -->
			<script src="JS/jquery.min.js"></script>
			<script src="JS/jquery.scrollex.min.js"></script>
			<script src="JS/jquery.scrolly.min.js"></script>
			<script src="JS/browser.min.js"></script>
			<script src="JS/breakpoints.min.js"></script>
			<script src="JS/util.js"></script>
			<script src="JS/main.js"></script>

</body>
</html>