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
<title>재고 정보 수정</title>
</head>
<body>
	<article>
	<h3>재고 정보 수정</h3>
	
	<%--  --%>
	<form name="frm" action="productSettingOk.slime" method="post" onsubmit="return chkUpdate()">
		<div>
			<img alt="제품 사진" src="">
			<div><%= arr[0].getMk_name()%></div>
			<div><%= arr[0].getPd_name()%>pd_name</div>
			<%-- hidden 값 : st_uid, inv_uid, --%>
			<input type="hidden" name="st_uid" value="<%= arr[0].getSt_uid()%>">		
			<input type="hidden" name="inv_uid" value="<%= arr[0].getInv_uid()%>">		
			
			<div>용량 <input type="text" name="inv_volume" value="<%= arr[0].getInv_volume()%>">ml</div>
			<div>가격 <input type="text" name="inv_price" value="<%= arr[0].getInv_price()%>">원</div>
			<div>재고 <input type="text" name="inv_quantity" value="<%= arr[0].getInv_quantity()%>">개</div>
		</div>
		<input type="submit" value="완료">
	</form>
		<button type="button" onclick="history.back()">취소</button>
	
	
	</article>
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