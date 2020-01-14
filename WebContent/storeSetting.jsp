<%@page import="beans.FileDTO"%>
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
	
	FileDTO[] farr = (FileDTO[]) request.getAttribute("image");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<meta charset="UTF-8">
<link href="CSS/main.css" rel="stylesheet">
<title>매장정보변경</title>
<style>
	.spotlight .image{
		margin-left: 0;
		margin: auto;
	}
</style>
</head>
<body class="is-preload">
<jsp:include page="/nav.jsp"></jsp:include>
<div id="wrapper">
	<jsp:include page="/header.jsp"></jsp:include>
	
	<div id="main">
		<%-- "매장 정보 변경"표시 --%>
		<section id="intro" class="main special">
			<header class="major">
				<h2>매장 정보 변경</h2>
			</header>
		</section>
		<%-- 매장 이름 표시 --%>
		<section id="first" class="main special">	
			<h4>매장: <%=st_name %></h4>
			<form name="frm" action="storeSettingOk.slime" method="post" onsubmit="return chkUpdate()" enctype="Multipart/form-data">
				<%-- hidden mb_uid --%>
				<input type="hidden" name="mb_uid" value="<%= mb_uid%>">
				
				<%-- 매장 주소 표시/변경--%>
				<div class="left">매장주소</div>
				<div class="col-6 col-12-xsmall">
					<input type="text" name="st_address" value="<%= st_address%>"><br>
				</div>
				<%-- 매장 연락처 표시/변경--%>
				<div>매장 연락처</div>
				<div class="col-6 col-12-xsmall">
					<input type="text" name="st_contact" value="<%=st_contact %>"><br>
				</div>
				
				<%-- 매장 영업시간 표시/변경 (input 2개 start 과 end)--%>
				<div>매장 영업시간</div>
				<div class="row aln-center">
					<div class="col-5 col-5-xsmall">
						<select name="st_start" id="demo-category">
							<option value="<%=st_start %>"><%=st_start %></option>
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
						<select name="st_end" id="demo-category">
							<option value="<%=st_end%>"><%=st_end%></option>
							<option value="20:00">20:00</option>
							<option value="20:30">20:30</option>
							<option value="21:00">21:00</option>
							<option value="21:30">21:30</option>
							<option value="22:00">22:00</option>
							<option value="22:30">22:30</option>
						</select>
					</div>
				</div>
				<%-- 매장 설명 표시/변경--%>
				<br>
				<div>매장 설명</div>
				<div  class="col-6 col-12-xsmall">
					<textarea rows="10" cols="20" name="st_description"><%=st_description %></textarea><br>
				</div>
				
				<%-- 매장 사진 변경 --%>
				<div>매장 사진</div>
				<div class="row aln-center">
					<div class="col-10">
						<div class='spotlight'>
							<span class="image">
								<img alt="<%=farr[0].getFile()%>" src="upload/offstore/<%=farr[0].getFile()%>">
							</span>
						</div>
					</div>
					<div class="col-10">
						<input type="file" name="upload">
					</div>
				</div>
				
				<br>
				<%-- 제출 Submit --%>
				<div class="row aln-center">
					<div class="col-5">
						<button class="button primary fit" type="submit">수정</button>
					</div>
					<div class="col-5">
						<button class="button fit" type="button" onclick="history.back()">이전</button>
					</div>
				</div>
			</form>
		</section>
	</div>
	<jsp:include page="/footer.jsp"></jsp:include>
</div>
<script src="JS/main.js"></script>
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