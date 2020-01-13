<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="beans.MemberDTO"%>
<% 
	MemberDTO[] arr = (MemberDTO[])request.getAttribute("list"); 
	int uid = arr[0].getMb_uid();
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>매장 등록</title>
<script src="JS/findAddress.js"></script>
<script>
function goPopup(){
    var pop = window.open("storeAddressPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
}
function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn
		, detBdNmList, bdNm, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn, buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno
		, emdNo, entX, entY){
	document.getElementById("roadFullAddr").value = roadFullAddr;
	document.getElementById("entX").value = entX;
	document.getElementById("entY").value = entY;
}
</script>
</head>
<body>
	<form name="frm" action="signUpStoreOk.slime" method="post" onsubmit="return chkUpdate()" enctype="Multipart/form-data">
		
		매장이름<br>
		<input type="text" id="st_name" name="st_name" required>
		
		<%-- hidden mb_uid --%>
		<input type="hidden" name="mb_uid" value="<%= uid%>">
		
		<%-- 매장 주소 표시/변경--%>
		<div>
		매장주소<br><input type="button"  value="주소검색" onclick="goPopup();">
		<input type="text" id="roadFullAddr" name="st_address" required><br>
		</div>
		
		<%-- 매장 연락처 표시/변경--%>
		<div>
		매장 연락처<br>
		<input type="tel" id="st_contact" name="st_contact" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" required><br>
		</div>
		
		<%-- 매장 영업시간 표시/변경 (input 2개 start 과 end)--%>
		<div>
		매장 영업시간<br>
		<input type="text" id="st_start" name="st_start" required> - 
		<input type="text" id="st_end" name="st_end" required><br>
		</div>
		
		<%-- 매장 사업자 등록증 번호--%>
		사업자 등록증 번호<br>
		<input type="text" id="st_valid_key" name="st_valid_key" required><br>
		
		<%-- 매장 사업자 등록증 사진 --%>
		사업자 등록증 사진파일<br>
		<input type="file" name="upload" required><br>
		
		<%-- 위도 경도 --%>
		<input type="hidden" id="entX" name="st_longitude">
		<input type="hidden" id="entY" name="st_latitude">
		
		
		<%-- 제출 Submit --%>
		<input type="submit" value="수정">
	</form>
</body>
<script>
function chkSubmit(){
	frm = document.forms["frm"];
	
	var name = frm["st_name"].value.trim();
	var number = frm["st_contact"].value.trim();
	var address = frm["roadFullAddr"].value.trim();
	var start = frm["st_start"].value.trim();
	var end = frm["st_end"].value.trim();
	var key = frm["st_valid_key"].value.trim();
	
	if(name == ""){
		alert("이름 란은 반드시 입력해야 합니다");
		frm["st_name"].focus();
		return false;
	}
	if(number == ""){
		alert("번호는 반드시 작성해야 합니다");
		frm["st_contact"].focus();
		return false;
	}
	if(address == ""){
		alert("주소는 반드시 작성해야 합니다");
		frm["roadFullAddr"].focus();
		return false;
	}
	if(start == ""){
		alert("시작시간은 반드시 작성해야 합니다");
		frm["st_start"].focus();
		return false;
	}
	if(end == ""){
		alert("끝나는 시간은 반드시 작성해야 합니다");
		frm["st_end"].focus();
		return false;
	}
	if(key == ""){
		alert("사업자 등록증 번호는 반드시 작성해야 합니다");
		frm["st_valid_key"].focus();
		return false;
	}
	return true;
	
}
</script>
</html>