/**

 * 
 */
var modal = $(".modal-content-market");
var modalShowMarket = document.getElementById("modal-showMarket");
var spanShowMarket = document.getElementsByClassName("SM")[0];

var modalShowProduct = document.getElementById("modal-showProduct");
var spanShowProduct = document.getElementsByClassName("SP")[0];

var modalNewMarket = document.getElementById("modal-newMarket");
var spanNewMarket = document.getElementsByClassName("NM")[0];

var modalNewProduct = document.getElementById("modal-newProduct");
var spanNewProduct = document.getElementsByClassName("NP")[0];
var object = "";
/////////////////////////////마켓 찾기 클릭했을때
function showMarkets(st_uid){
	modalShowMarket.style.display = "block";
	var url = "http://localhost:8085/Project_SWH/addProduct.ajax?st_uid=" + st_uid;
		 $.ajax({
			url: url,
			type: "GET",
			cache: false,
			success: function(result, status, xhr){
				if(status == "success"){
					parseJSON(result, st_uid);
					object = result;
				}
			}
		 });
}

spanShowMarket.onclick = function(){
	modalShowMarket.style.display = "none";
}
spanShowProduct.onclick = function(){
	modalShowProduct.style.display = "none";
}
spanNewMarket.onclick = function(){
	modalNewMarket.style.display = "none";
}
spanNewProduct.onclick = function(){
	modalNewProduct.style.display = "none";
}

window.onclick = function(event){
	if(event.target == modalShowMarket) {
		modalShowMarket.style.display = "none";
	}
	if(event.target == modalShowProduct) {
		modalShowProduct.style.display = "none";
	}
	if(event.target == modalNewMarket) {
		modalNewMarket.style.display = "none";
	}
	if(event.target == modalNewProduct) {
		modalNewProduct.style.display = "none";
	}
}

function parseJSON(jsonObj, st_uid){
	var data = jsonObj.markets;
	var table = "";
	var count = data.length;
	for(i = 0; i < count; i++){
		if(data[i].mk_file == "") data[i].mk_file = "unknown.png";
		table += "<section class='market' onclick='showProducts(" + data[i].mk_uid + ", \"" + data[i].mk_file + "\", \"" + data[i].mk_name + "\", \"" + data[i].mk_insta + "\", " + st_uid + ")'>";
		table += "<span class='image fit'><img alt='image' src='upload/market/" + data[i].mk_file + "'></span>";
		table += "<h3>" + data[i].mk_name + "</h3>";
		table += "<h3>" + data[i].mk_insta + "</h3>";		
		table += "</section><hr>";
	}
	$(".modal-content-market .modal-body").html(table);
}

////////////////////////////특정 마켓 클릭했을때
function showProducts(mk_uid, mk_file, mk_name, mk_insta, st_uid){
	modalShowMarket.style.display = "none";
	modalShowProduct.style.display = "block";
	
	var table = "<img alt='" + mk_file + "' src='upload/market/" + mk_file +"'>"
			+ "<div>" + mk_name + "</div>"
			+ "<div>" + mk_insta + "</div>";
	$("#market_detail").html(table);
	$(".modal-content-product-new #mk_uid").val(mk_uid);
	
	productList(object, mk_uid);
}

function productList(jsonObj, mk_uid){
	var data = jsonObj.markets;
	var count = data.length;
	var products;
	var table = "";
	for(i = 0; i < count; i++){
		if(data[i].mk_uid == mk_uid){
			products = data[i].products;
		}
	};
	
	count = products.length;
	for(i = 0; i < count; i++){
		table += "<section class='product' onclick='showDetail(" + products[i].pd_uid + ",\"" + products[i].pd_file + "\", \"" + products[i].pd_name + "\")'>";
		table += "<span class='image fit'><img alt='image' src='upload/product/" + products[i].pd_file + "'></span>";
		table += "<h3>" + products[i].pd_name + "</h3>";
		table += "</section><hr>";
	}
	$(".modal-content-product .modal-body").html(table);
}

//////////////////////특정 제품 클릭했을때 메인페이지로 넘어가고
///////////////////// 제품 정보보여주기
function showDetail(pd_uid, pd_file, pd_name){
	modalShowProduct.style.display = "none";
	table = "<img alt='noImage' src='upload/product/" + pd_file + "'/>"
			+ "<div>" + pd_name + "</div>"
			+ "<div>용량 <input type='text' name='inv_volume' placeholder='용량입력'>ml</div>"
			+ "<div>가격 <input type='text' name='inv_price' placeholder='가격입력'>원</div>"
			+ "<div>재고<input type='text' name='inv_quantity' placeholder='개수입력'>개</div>"
			+ "<input type='hidden' name='pd_uid' value='" + pd_uid + "'>";
	
	$("#product_detail").html(table);
}

//////////////////////매장에 이미 그 제품이있는지 확인
function chkInventory(){
	var frm = document.forms.frm;
	var st_uid = frm.st_uid.value.trim();
	var pd_uid = frm.pd_uid.value.trim();
	var inv_volume = frm.inv_volume.value.trim();
	var inv_price = frm.inv_price.value.trim();
	var inv_quantity = frm.inv_price.value.trim();
	if(inv_volume == "" || inv_price =="" || inv_quantity == ""){
		alert("재고의 상세정보(용량, 가격, 재고)를 입력해주세요");
		return false;
	}
	var inventory = object.inventory;
	var count = object.inventory_count;
	for(i = 0; i < count; i++){
		//제품이 매장에 이미 등록된 경우
		if(inventory[i].pd_uid == pd_uid){
			var r = confirm("이미 등록된 제품입니다. 현재 입력한 값으로 적용하시겠습니까?");
			if(!r){
				return false;
			}else{
				return true;
			}
		}
	}
	return true;
}
//////////////////////////마켓 이미 존재 여부
function chkMarket(){
	var frm = document.forms.newMarket;
	var market = frm.mk_name.value.trim();
	var insta = frm.mk_insta.value.trim();
	if(market == ""){
		alert("마켓 명 입력 필수");
		return false;
	}
	var markets = object.markets;
	var count = markets.length;
	for(i = 0; i < count; i++){
		if(markets[i].mk_name == market){
			alert("마켓 존재, 마켓명 변경해주세요");
			return false;
		} else if(markets[i].mk_insta == mk_insta){
			alert("이미 등록된 인스타그램");
			return false;
		}
	}
	return true;
}

//////////////////////////마켓의 제품 이미 존재 여부
function chkProduct(){
	var frm = document.forms.newProduct;
	var product = frm.pd_name.value.trim();
	if(product == ""){
		alert("제품 명  입력 필수");
		return false;
	}
	var mk_uid = frm.mk_uid.value.trim();
	var markets = object.markets;
	var count = markets.length;
	for(i = 0; i < count; i++){
		if(markets[i].mk_uid == mk_uid){
			var length = markets[i].products.length;
			for(j = 0; j < length; j++){
				if(markets[i].products[j].pd_name == product){
					alert("현재 마켓에 입력한 이름으로 된 제품 존재");
					return false;
				} 
			}
		}
	}
	
	return true;
}

///////////////////////////새 마켓 추가 버튼 눌렀을 때
function createNewMarket() {
	modalShowMarket.style.display = "none";
	modalNewMarket.style.display = "block";
}
function createNewProduct() {
	modalShowProduct.style.display = "none";
	modalNewProduct.style.display = "block";
}
