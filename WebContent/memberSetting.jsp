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
<title>회원정보변경</title>
</head>
<body>
<div id="container">
   <nav>
      <div>네비게이션 바</div>
   </nav>

<h3>회원 정보 변경</h3>
<form name="frm" action="memberSettingOk.slime" method="post" onsubmit="return chkUpdate()">
	<input type="hidden" name="mb_uid" value="<%= mb_uid%>">
	
	이름 : <%= mb_name %> <br>
	아이디 : <%= mb_id %> <br>
	비밀번호 : <input type="password" name="mb_password" value="<%= mb_pw %>"><br>
	연락처 : <input type="text" name="mb_cell" value="<%= mb_cell %>"><br>
	주소 : <input type="text" name="mb_address" value="<%= mb_address %>"><br>
	이메일 : <input type="text" name="st_start" value="<%= mb_email %>"><br>
	가입날짜 : <%= mb_regdate %>"><br>

	<input type="submit" value="수정">
</form>	
   <footer>
   
   </footer>
</div>
</body>
<script>
	function chkUpdate(){
		var r = confirm("수정하시겠습니까?");
		if(r){ //수정 여부 확인
			var frm = document.forms["frm"];
			var pw = frm.mb_pw.value.trim();
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
</html>