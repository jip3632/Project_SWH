/**
 * 
 */


function ajax() {
	word = document.getElementById("wordSearch");
	console.log(word);
	var url = "http://localhost:8085/Project_SWH/mainProduct.ajax?word=" + word;
	$.ajax({
		url : url,
		type : "GET",
		cache : false,
		success : function(data, status){
			if (status == "success") parseJSON(data);
		}
	});
};

function parseJSON(data) {
	$("#productList").html("");
	
	var i;
	var count = data.count;
	var list = data.productList;
	
	var htmlTxt = "";
	for (i = 0; i < count; i++) {
		htmlTxt += "<li class='productInfo'>";
		htmlTxt += "<div class='pd_img'>" + "<img src='" + list[i].pd_img + "'></img>" + "</div>";
		htmlTxt += "<div class='pd_name' onclick='move(" + list[i].pd_uid + ")'>" + list[i].pd_name + "</div>";
		htmlTxt += "<div class='mk_name'>제작자: " + list[i].mk_name + "</div>";
		htmlTxt += "</li>";
	}
	$("#productList").html(htmlTxt);
};

function move(pd_uid) {
	location.href='productView.slime?pd_uid=' + pd_uid;
}