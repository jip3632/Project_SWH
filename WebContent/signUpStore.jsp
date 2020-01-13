<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>매장 등록</title>
</head>
<body>
	<form name="frm" action="SignUpStoreOk.slime" method="post" onsubmit="return chkUpdate()" enctype="Multipart/form-data">
		
		매장이름<br>
		<input type="text" name="st_name">
		
		<%-- hidden mb_uid --%>
		<input type="hidden" name="mb_uid">
		
		<%-- 매장 주소 표시/변경--%>
		<div>
		매장주소<br>
		<input type="text" name="st_address"><br>
		</div>
		
		<%-- 매장 연락처 표시/변경--%>
		<div>
		매장 연락처<br>
		<input type="text" name="st_contact"><br>
		</div>
		
		<%-- 매장 영업시간 표시/변경 (input 2개 start 과 end)--%>
		<div>
		매장 영업시간<br>
		<input type="text" name="st_start"> - 
		<input type="text" name="st_end"><br>
		</div>
		
		<%-- 매장 사업자 등록증 번호--%>
		<input type="text" name="st_valid_key"><br>
		
		<%-- 매장 사업자 등록증 사진 --%>
		<input type="file" name="upload"><br>
		
		<%-- 위도 경도 --%>
		<input type="hidden" name="st_latitude">
		<input type="hidden" name="st_longitude">
		
		
		<%-- 제출 Submit --%>
		<input type="submit" value="수정">
	</form>
</body>
<script>
function chkSubmit(){
	frm = document.forms["frm"];
	
	var name = frm["user_name"].value.trim();
	var number = frm["phone_number"].value.trim();
	var address = frm["roadFullAddr"].value.trim();
	var id = frm["user_id"].value.trim();
	var pw = frm["user_pw"].value.trim();
	var email = frm["user_email"].value.trim();
	
	if(name == ""){
		alert("이름 란은 반드시 입력해야 합니다");
		frm["name"].focus();
		return false;
	}
	if(number == ""){
		alert("번호는 반드시 작성해야 합니다");
		frm["phone_number"].focus();
		return false;
	}
	if(address == ""){
		alert("주소는 반드시 작성해야 합니다");
		frm["roadFullAddr"].focus();
		return false;
	}
	if(id == ""){
		alert("아이디는 반드시 작성해야 합니다");
		frm["user_id"].focus();
		return false;
	}
	if(pw == ""){
		alert("비밀번호는 반드시 작성해야 합니다");
		frm["user_pw"].focus();
		return false;
	}
	if(email == ""){
		alert("이메일은 반드시 작성해야 합니다");
		frm["user_email"].focus();
		return false;
	}
	return true;
	
}
</script>
</html>