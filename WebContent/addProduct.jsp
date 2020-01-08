<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>제품 등록</title>
</head>
<body>
<%--  --%>


	<article>
	<%-- submit했을 때 --%>
	<%-- INSERT INTO sl_inventory (st_uid, pd_uid, inv_volume, inv_price, inv_quantity) VALUES (?, ?, ?); --%>
	<%-- MODAL에서 정보 받아올때 --%>
	<%-- javascript로 구현 --%>
	<form name="frm" method="post" action="" onsubmit="">
		<div>
			<img alt="mk_img" src="">
			<div>mk_name</div>
			<div>mk_insta</div>
		</div>
		
		<div>
			<img alt="pd_img" src="">
			<div>pd_name</div>
			<div>용량 <input type="text" name="inv_volume" value="inv_volume">ml</div>
			<div>가격 <input type="text" name="inv_price" value="inv_price">원</div>
			<div>재고 <input type="text" name="inv_quantity" value="inv_quantity">개</div>
		</div>
		<input type="submit" value="완료">
	</form>	
		
	</article>
	
	<%-- 마켓 선택 --%>
	<%-- SELECT mk_uid, mk_img, mk_name, mk_insta FROM sl_market WHERE mk_uid = ?; --%>
  <div class="modal-content-market">
    <div class="modal-header">
      <span class="close">&times;</span>
      <h2><input type="text" name="mk_name" value="mk_name"></h2>
    </div>
    <div class="modal-body">
      <div onclick="">mk_img, mk_name, mk_insta</div>
      <div onclick="">mk_img, mk_name, mk_insta</div>
      <div onclick="">mk_img, mk_name, mk_insta</div>
      <div onclick="">mk_img, mk_name, mk_insta</div>
    </div>
    <div class="modal-footer">
      <div onclick="">새마켓 추가</div>
    </div>
  </div>
  
  <%-- 새 마켓 추가 --%>
  <%-- INSERT INTO sl_market (mk_img, mk_name, mk_insta) VALUES (?, ?, ?); --%>
  <div class="modal-content-market-new">
    <div class="modal-header">
      <span class="close">&times;</span>
    </div>
    <div class="modal-body">
    	<form>
    		<div><input type="file" name="mk_img" value=""></div>
    		<div>마켓명 <input type="text" name="mk_name" value="mk_name"></div>
    		<div>instagram <input type="text" name="mk_insta" value="mk_insta"></div>
    	</form>
    </div>
    <div class="modal-footer">
      <div onclick="">추가</div>
    </div>
  </div>

<%-- 마켓의 제품 선택 --%>
  <div class="modal-content-product">
    <div class="modal-header">
      <span class="close">&times;</span>
      <h2><input type="text" name="pd_name" value="pd_name"></h2>
    </div>
    <div class="modal-body">
      <div></div>
      <div onclick="">pd_img, pd_name</div>
      <div onclick="">pd_img, pd_name</div>
      <div onclick="">pd_img, pd_name</div>
    </div>
    <div class="modal-footer">
      <div onclick="">새제품 추가</div>
    </div>
  </div>
  
  <%-- 새 제품 추가 --%>
  <%-- INSERT INTO sl_product (pd_img, pd_name, pd_description, mk_uid) VALUES (?, ?, ?, ?); --%>
  <div class="modal-content-product-new">
    <div class="modal-header">
      <span class="close">&times;</span>
    </div>
    <div class="modal-body">
    	<form>
    		<div><input type="file" name="pd_img" value="pd_img"></div>
    		<div>제품명 <input type="text" name="pd_name" value="pd_name"></div>
    		<div>제품 설명 <input type="text" name="pd_description" value="pd_description"></div>
    	</form>
    </div>
    <div class="modal-footer">
      <div onclick="">추가</div>
    </div>
  </div>
  
</body>
</html>