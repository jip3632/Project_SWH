<%@page import="beans.StoreDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	StoreDTO[] arr = (StoreDTO[])request.getAttribute("result");
	int mb_uid = arr[0].getMb_uid();
	String st_name = arr[0].getSt_name();
	String st_address = arr[0].getSt_address();
	String st_contact = arr[0].getSt_contact();
	String st_hours = arr[0].getSt_hours();
	String[] st_hour = new String[2];
	st_hour = st_hours.split("[-]");
	String st_start = st_hour[0];
	String st_end = st_hour[1];
	String st_description = arr[0].getSt_description();
	String st_img = arr[0].getSt_img();
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>매장정보변경</title>
</head>
<body>
<article>
<%-- "매장 정보 변경"표시 --%>
<h3>매장 정보 변경</h3>
<%-- 매장 이름 표시 --%>
<h4><%=st_name %></h4>
<form name="frm" action="storeSettingOk.slime" method="post" onsubmit="return chkUpdate()">
	<%-- hidden mb_uid --%>
	<input type="hidden" name="mb_uid" value="<%= mb_uid%>">
	
	<%-- 매장 주소 표시/변경--%>
	매장주소<br>
	<input type="text" name="st_address" value="<%= st_address%>"><br>
	
	<%-- 매장 연락처 표시/변경--%>
	매장 연락처<br>
	<input type="text" name="st_contact" value="<%=st_contact %>"><br>
	
	<%-- 매장 영업시간 표시/변경 (input 2개 start 과 end)--%>
	매장 영업시간<br>
	<input type="text" name="st_start" value="<%=st_start %>"> - 
	<input type="text" name="st_end" value="<%=st_end %>"><br>
	
	<%-- 매장 설명 표시/변경--%>
	매장 설명<br>
	<textarea rows="10" cols="20" name="st_description"><%=st_description %></textarea><br>
	
	<%-- 매장 사진 변경 --%>
	매장 사진<br>
	<input type="image" name="st_img" value="<%=st_img%>"><br>
	
	<%-- 제출 Submit --%>
	<input type="submit" value="수정">
</form>
</article>	

</body>
<script>
	function chkUpdate(){
		var r = confirm("수정하시겠습니까?");
		if(r){ //수정 여부 확인
			var frm = document.forms["frm"];
			var st_address = frm.st_address.value.trim();
			var st_contact = frm.st_contact.value.trim();
			var st_start = frm.st_start.value.trim();
			var st_end = frm.st_end.value.trim();
			if(st_address == "" || st_contact == "" || st_start == "" || st_end == ""){
				alert("설명과 사진 이외의 모든 정보는 필수 입력란입니다.");
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