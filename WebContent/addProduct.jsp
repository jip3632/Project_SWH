<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	int st_uid = Integer.parseInt(request.getParameter("st_uid"));
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<link href="CSS/main.css" rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
	.modal{
		display: none; /* Hidden by default */
		position: fixed; /* Stay in place */
		z-index: 1; /* Sit on top */
		padding-top: 100px; /* Location of the box */
		left: 0;
		top: 0;
		width: 100%; /* Full width */
		height: 100%; /* Full height */
		overflow: auto; /* Enable scroll if needed */
		background-color: rgb(0,0,0); /* Fallback color */
		background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
	}
	
	.modal-content-market, .modal-content-market-new, .modal-content-product, .modal-content-product-new{
		position: relative;
		background-color: #fefefe;
		margin: auto;
		padding: 0;
		border: 1px solid #888;
		width: 80%;
		box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);
		-webkit-animation-name: animatetop;
		-webkit-animation-duration: 0.4s;
		animation-name: animatetop;
		animation-duration: 0.4s
	}
	
	.close{
		color: #aaa;
		float: right;
		font-size: 28px;
		font-weight: bold;
	}
	
	.close:hover, .close:focus{
		color: black;
		text-decoration: none;
		cursor: pointer;
	}
	
	.market, .product{
		width: 66.66%;
		margin: auto;
	}
	.market:hover, .market:focus, .product:hover, .product:focus{
		cursor: pointer;
	}
@-webkit-keyframes animatetop {
  from {top:-300px; opacity:0} 
  to {top:0; opacity:1}
}

@keyframes animatetop {
  from {top:-300px; opacity:0}
  to {top:0; opacity:1}
}
</style>
<title>제품 등록</title>
</head>
<body>
<jsp:include page="/nav.jsp"></jsp:include>
<div id="wrapper">


		<div id="main">
		<%-- submit했을 때 --%>
		<%-- INSERT INTO sl_inventory (st_uid, pd_uid, inv_volume, inv_price, inv_quantity) VALUES (?, ?, ?); --%>
		<%-- MODAL에서 정보 받아올때 --%>
		<%-- javascript로 구현 --%>
			<section id="intro" class="main special">
				<button	class="button primary fit" type="button" onclick="showMarkets(<%=st_uid%>)">마켓 찾기</button>
				<form action="addProductOk.slime" name="frm" method="post" onsubmit="return chkInventory()">
					<input type="hidden" name="st_uid" value="<%= st_uid%>">
					<div id="market_detail">
					</div>
					<div id="product_detail">
					</div>
				</form>	
			</section>
		
			<div id="modal-showMarket" class="modal">
				<%-- 마켓 선택 --%>
				<%-- SELECT mk_uid, mk_img, mk_name, mk_insta FROM sl_market WHERE mk_uid = ?; --%>
				<div class="modal-content-market">
					<section class="main special">
						<div class="modal-header">
							<header>
							<span class="close SM">&times;</span>
							<h2><b>마켓 찾기</b></h2>
							</header>
						</div>
						<div class="modal-body">
						</div>
						<div class="modal-footer right">
						   <button type="button" onclick="createNewMarket()">새마켓 추가</button>
						</div>
					</section>
				</div>
			</div>
		
			<div id="modal-showProduct" class="modal">
				<%-- 마켓의 제품 선택 --%>
				<section class="main special">
					<div class="modal-content-product">
						<div class="modal-header">
							<span class="close SP">&times;</span>
							<h2><b>제품 찾기</b></h2>
						</div>
						<div class="modal-body">
						</div>
						<div class="modal-footer right">
						<button type="button" onclick="createNewProduct()">새제품 추가</button>
						</div>
					</div>
				</section>
			</div>
				
			<div id="modal-newMarket" class="modal">
				<%-- 새 마켓 추가 --%>
				<%-- INSERT INTO sl_market (mk_img, mk_name, mk_insta) VALUES (?, ?, ?); --%>
				<section class="main special">
					<div class="modal-content-market-new">
						<div class="modal-header">
							<span class="close NM">&times;</span>
							<h4><b>새 마켓 추가</b></h4>
						</div>
						<div class="modal-body">
							<form action="newMarketOk.slime?st_uid=<%=st_uid %>" name="newMarket" method="post" enctype="Multipart/form-data" onsubmit="return chkMarket()">
								<div><input type="file" name="mk_img" value=""></div>
								<div>마켓명 <input type="text" name="mk_name" placeholder="마켓 이름"></div>
								<div>instagram <input type="text" name="mk_insta" placeholder="마켓 인스타 ID"></div>
								<div class="right"><input type="submit" value="마켓 추가"></div>
							</form>
						</div>
						<div class="modal-footer">
						</div>
					</div>
				</section>
			</div>
				
			<div id="modal-newProduct" class="modal">
				<%-- 새 제품 추가 --%>
				<%-- INSERT INTO sl_product (pd_img, pd_name, pd_description, mk_uid) VALUES (?, ?, ?, ?); --%>
				<section class="main special">
					<div class="modal-content-product-new">
						<div class="modal-header">
							<span class="close NP">&times;</span>
							<h4><b>새 제품 추가</b></h4>
						</div>
						<div class="modal-body">
							<form action="newProductOk.slime?st_uid=<%=st_uid %>" name="newProduct" method="post" enctype="Multipart/form-data" onsubmit="return chkProduct()">
								<input id="st_uid" type="hidden" name="st_uid" value="<%=st_uid%>">
								<input id="mk_uid" type="hidden" name="mk_uid" value="">
								<div><input type="file" name="pd_img" value="pd_img"></div>
								<div>제품명 <input type="text" name="pd_name" placeholder="제품 이름"></div>
								<div>제품 설명 <input type="text" name="pd_description" placeholder="제품 설명"></div>
								<div class="right"><input type="submit" value="제품 추가"></div>
							</form>
						</div>
						<div class="modal-footer">
						</div>
					</div>
				</section>
			</div>
		</div>
		<jsp:include page="/footer.jsp"></jsp:include>
</div>
</body>
<script src="JS/addProduct.js"></script>
</html>