<%@page import="beans.ProductInStoreDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ProductInStoreDTO[] arr = (ProductInStoreDTO[])request.getAttribute("result");
	if(arr.length != 1 || arr == null) return;
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<link href="CSS/main.css" rel="stylesheet">

<title>재고 정보 수정</title>
</head>
<body>
<div id="wrapper">
	<nav id="nav" class="alt">
		<div>네비게이션 바</div>
	</nav>
	
	<div id="main">
		<section id="intro" class="main">
			<div class="spotlight content">
				<h3>재고 정보 수정</h3>
			</div>
		</section>
		<section id="first" class="main special">
		<form name="frm" action="productSettingOk.slime" method="post" onsubmit="return chkUpdate()">
			<div>
				<div>매장: <%= arr[0].getMk_name()%></div>
				<div>제품: <%= arr[0].getPd_name()%></div>
				<%-- hidden 값 : st_uid, inv_uid, --%>
				<input type="hidden" name="st_uid" value="<%= arr[0].getSt_uid()%>">		
				<input type="hidden" name="inv_uid" value="<%= arr[0].getInv_uid()%>">		
				
				<div>용량(ml)</div>
				<div class="col-6 col-12-xsmall"><input type="text" name="inv_volume" value="<%= arr[0].getInv_volume()%>"></div>
				<div>가격(원)</div>
				<div class="col-6 col-12-xsmall"><input type="text" name="inv_price" value="<%= arr[0].getInv_price()%>"></div>
				<div>재고(개)</div>
				<div class="col-6 col-12-xsmall"><input type="text" name="inv_quantity" value="<%= arr[0].getInv_quantity()%>"></div>
			</div>
			<input type="submit" value="완료">
		</form>
			<button type="button" onclick="history.back()">취소</button>
		
		
		</section>
	</div>
</div>
</body>
<script>
	function chkUpdate(){
		var r = confirm("수정하시겠습니까?");
		if(r){ //수정 여부 확인
			var frm = document.forms["frm"];
			var inv_volume = frm.inv_volume.value.trim();
			var inv_price = frm.inv_price.value.trim();
			var inv_quantity = frm.inv_quantity.value.trim();
			if(inv_volume == "" || inv_price == "" || inv_quantity == ""){
				alert("모든 입력란은 필수");
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