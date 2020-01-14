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
<link rel="stylesheet" href="CSS/main.css" />
<style>
	.row button{
		height: 3.2em;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
function goPopup(){
    var pop = window.open("storeAddressPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
}
function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn
						, detBdNmList, bdNm, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn, buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno
						, emdNo, entX, entY){
	document.getElementById("roadFullAddr").value = roadFullAddr;
	convertCall(entX, entY);
}
function convertCall(entX, entY){
	var x = entX;
	var y = entY;
	var url ="https://dapi.kakao.com/v2/local/geo/transcoord.json?x=" + x + "&y=" + y + "&input_coord=UTM&output_coord=WGS84";
	$.ajax({
		url: url,
		headers: {'Authorization' : 'KakaoAK 241e9154c601bbf9fb3d6d3a33e4af25'},
		type: "GET",
		cache: false,
		dataType: "json",
		success: function(data, status){
			if(status == "success"){
				parseJSON(data);
			}
		}
	});
}
function parseJSON(data) {	
	var list = data.documents
	
	var entX = list[0].x;
	var entY = list[0].y;
	document.getElementById("entX").value = entX;
	document.getElementById("entY").value = entY;
}
</script>
</head>
<body class="is-preload">
<jsp:include page="/nav.jsp"></jsp:include>
<div id="wrapper">
	<jsp:include page="/header.jsp"></jsp:include>
	<div id="main">
		<section id="intro" class="main special">
			<header class="major">
				<h2>매장 등록</h2>
			</header>
		</section>
		<section id="section" class="main">
			<form name="frm" action="signUpStoreOk.slime" method="post" onsubmit="return chkSubmit()" enctype="Multipart/form-data">
		
				매장이름<br>
				<input type="text" id="st_name" name="st_name">
				<br>
				<%-- hidden mb_uid --%>
				<input type="hidden" name="mb_uid" value="<%=uid%>">
		
				<%-- 매장 주소 표시/변경--%>
				도로명주소
				<div class="row">
					<div class="col-8">
						<input type="text"  id="roadFullAddr"  name="roadFullAddr" readonly/>
					</div>
					<div class="col-4">
						<button class="button fit" type="button" onclick="goPopup();">주소찾기</button>
					</div>
				</div>
				<br>
				<%-- 매장 연락처 표시/변경--%>
				<div>
				매장 연락처<br>
				<input type="text" id="st_contact" name="st_contact" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}"><br>
				</div>
				
				<%-- 매장 영업시간 표시/변경 (input 2개 start 과 end)--%>
				<div>
				매장 영업시간<br>
				<div class="row aln-center">
					<div class="col-5 col-5-xsmall">
						<select id="st_start" name="st_start" id="demo-category">
							<option value="09:00">09:00</option>
							<option value="09:30">09:30</option>
							<option value="10:00">10:00</option>
							<option value="10:30">10:30</option>
							<option value="11:00">11:00</option>
							<option value="11:30">11:30</option>
						</select>
					</div>
					<div>-</div> 
					<div class="col-5 col-5-xsmall"> 
						<select id="st_end" name="st_end" id="demo-category">
							<option value="20:00">20:00</option>
							<option value="20:30">20:30</option>
							<option value="21:00">21:00</option>
							<option value="21:30">21:30</option>
							<option value="22:00">22:00</option>
							<option value="22:30">22:30</option>
						</select>
					</div>
				</div>
				</div>
				<br>
				<%-- 매장 사업자 등록증 번호--%>
				사업자 등록증 번호
				<input type="text" id="st_valid_key" name="st_valid_key"><br>
		
				<%-- 매장 사업자 등록증 사진 --%>
				사업자 등록증 사진
				<input type="file" name="upload"><br><br>
		
				<%-- 위도 경도 --%>
				<input type="hidden" id="entY" name="st_latitude">
				<input type="hidden" id="entX" name="st_longitude">
		
		
				<%-- 제출 Submit --%>
				<button id="submit_button" class="button primary fit" style="width: 100%;" type="submit">등록</button>
				</form>
			</section>
	</div>
	<jsp:include page="/footer.jsp"></jsp:include>
</div>
<script src="JS/main.js"></script>
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
		alert("사업자등록번호는 반드시 작성해야 합니다");
		frm["st_valid_key"].focus();
		return false;
	}
	return true;
	
}
</script>

</html>