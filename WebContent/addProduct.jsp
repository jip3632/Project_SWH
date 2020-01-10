<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	int st_uid = Integer.parseInt(request.getParameter("st_uid"));
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>제품 등록</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
<%--  --%>


	<article>
	<%-- submit했을 때 --%>
	<%-- INSERT INTO sl_inventory (st_uid, pd_uid, inv_volume, inv_price, inv_quantity) VALUES (?, ?, ?); --%>
	<%-- MODAL에서 정보 받아올때 --%>
	<%-- javascript로 구현 --%>
	<button id="find_market" type="button" onclick="showMarkets(<%=st_uid%>)">마켓 찾기</button>
	<form action="addProductOk.slime" name="frm" method="post" onsubmit="return chkInventory()">
		<input type="hidden" name="st_uid" value="<%= st_uid%>">
		<div id="market_detail">
		</div>
		<div id="product_detail">
		</div>
		<input type="submit" value="완료">
	</form>	
		
	</article>
	
	<%-- 마켓 선택 --%>
	<%-- SELECT mk_uid, mk_img, mk_name, mk_insta FROM sl_market WHERE mk_uid = ?; --%>
  <div class="modal-content-market" style="background-color: grey;">
  	<div class="content">
    <div class="modal-header">
      <span class="close">&times;</span>
    </div>
    <div class="modal-body">

    </div>
    <div class="modal-footer">
      <button type="button" onclick="">새마켓 추가</button>
    </div>
    </div>
  </div>

<%-- 마켓의 제품 선택 --%>
  <div class="modal-content-product" style="background-color: lightgrey;">
    <div class="modal-header">
      <span class="close">&times;</span>
    </div>
    <div class="modal-body">
    </div>
    <div class="modal-footer">
      <button type="button" onclick="">새제품 추가</button>
    </div>
  </div>
  
  <%-- 새 마켓 추가 --%>
  <%-- INSERT INTO sl_market (mk_img, mk_name, mk_insta) VALUES (?, ?, ?); --%>
  <div class="modal-content-market-new" style="background-color: grey;">
    <div class="modal-header">
      <span class="close">&times;</span>
    </div>
    <div class="modal-body">
    	<form action="newMarketOk.slime?st_uid=<%=st_uid %>" name="newMarket" method="post" enctype="Multipart/form-data" onsubmit="return chkMarket()">
    		<div><input type="file" name="mk_img" value=""></div>
    		<div>마켓명 <input type="text" name="mk_name" placeholder="마켓 이름"></div>
    		<div>instagram <input type="text" name="mk_insta" placeholder="마켓 인스타 ID"></div>
    		<div><input type="submit" value="마켓 추가"></div>
    		
    	</form>
    </div>
    <div class="modal-footer">
     
    </div>
  </div>
  
  <%-- 새 제품 추가 --%>
  <%-- INSERT INTO sl_product (pd_img, pd_name, pd_description, mk_uid) VALUES (?, ?, ?, ?); --%>
  <div class="modal-content-product-new" style="background-color: lightgrey;">
    <div class="modal-header">
      <span class="close">&times;</span>
    </div>
    <div class="modal-body">
    	<form action="newProductOk.slime?st_uid=<%=st_uid %>" name="newProduct" method="post" enctype="Multipart/form-data" onsubmit="return chkProduct()">
    		<input id="mk_uid" type="hidden" name="mk_uid" value="">
    		<div><input type="file" name="pd_img" value="pd_img"></div>
    		<div>제품명 <input type="text" name="pd_name" placeholder="제품 이름"></div>
    		<div>제품 설명 <input type="text" name="pd_description" placeholder="제품 설명"></div>
    		<div><input type="submit" value="제품 추가"></div>
    	</form>
    </div>
    <div class="modal-footer">
    </div>
  </div>
  
</body>
<script type="text/javascript" src="JS/addProduct.js"></script>
</html>