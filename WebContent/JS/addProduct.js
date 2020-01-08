/**
 * 
 */
var modal = $(".modal-content-market");
function showMarkets(st_uid){
	modal.css("display", "block");
	var url = "http://localhost:8085/Project_SWH/addProduct.ajax?st_uid=" + st_uid;
		 $.ajax({
			url: url,
			type: "GET",
			cache: false,
			success: function(result, status, xhr){
				if(status == "success"){
					parseJSON(result, st_uid);
				}
			}
		 });
}

$(".modal-content-market span.close").click(function(){
	modal.css("display", "none");
});

function parseJSON(jsonObj, st_uid){
	var data = jsonObj.markets;
	var table = "";
	var count = data.length;
	for(i = 0; i < count; i++){
		table += "<div class='market' onclick='showProducts(" + data[i].mk_uid +", " + st_uid + ")'>";
		table += "<img alt='image' src='upload/market/" + data[i].mk_file + "'>";
		table += "<div>" + data[i].mk_name + "</div>";
		table += "<div>" + data[i].mk_insta + "</div>";		
		table += "</div>";
	}
	$(".modal-content-market .modal-body").html(table);
}

function showProducts(mk_uid, st_uid){
	var url = "http://localhost:8085/Project_SWH/addProduct.ajax?st_uid=" + st_uid;
	 $.ajax({
		url: url,
		type: "GET",
		cache: false,
		success: function(result, status, xhr){
			if(status == "success"){
				productList(result, mk_uid);
			}
		}
	 });
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
	}
	count = products.length;
	for(i = 0; i < count; i++){
		table += "<div>";
		table += "<img alt='image' src='upload/product/" + products[i].pd_file + "'>";
		table += "<div>" + products[i].pd_name + "</div>";
		table += "</div>";
	}
	$(".modal-content-product .modal-body").html(table);
}

/////////////////////////////////////////////////////////////////


