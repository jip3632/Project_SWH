/**
 * 
 */


function ajax() {
	word = document.getElementById("wordSearch").value;
	word = "%" + word+ "%";
	console.log("ajax 실행전");
	var url = "http://localhost:8085/Project_SWH/mainProduct.ajax?word=" + encodeURI(word);
	//document.write(url);
	$.ajax({
		url : url,
		type : "GET",
		cache : false,
		success : function(data, status){
			if (status == "success") parseJSON(data);
		}
	});
}

function parseJSON(data) {
	$("#product_list").html("");
	
	var i;
	var count = data.count;
	var list = data.productList;
	console.log("json 생성중");
	var htmlTxt = "";
	for (i = 0; i < count; i++) {
		htmlTxt += "<li class='productInfo'>";
		htmlTxt += "<img src='upload/product/" + list[i].pd_img + "' alt=''/>";
		htmlTxt += "<div class='pd_name' onclick='move(" + list[i].pd_uid + ")'>" + list[i].pd_name + "</div>";
		htmlTxt += "<div class='mk_name'>제작자: " + list[i].mk_name + "</div>";
		htmlTxt += "</li>";
	}
	$("#product_list").html(htmlTxt);
}

function move(pd_uid) {
	location.href='productView.slime?pd_uid=' + pd_uid;
}









