// doc.ready 위치 정보 가져오기
var lati;
var longi;
$(function() {
	if (navigator.geolocation) {
		navigator.geolocation.getCurrentPosition(function(pos){
			lati = pos.coords.latitude;
			longi = pos.coords.longitude;
		});
	} else {
		alert('현재 브라우저/기기는 GPS를 지원하지 않습니다')
		lati = 0;
		longi = 0;
	}
	
});


function ajax(regionCode) {
	var url = "http://localhost:8085/Project_SWH/store.ajax?region=" + regionCode + "&lati=" + lati + "&longi=" + longi;
	if (regionCode != 0) {
		$.ajax({
			url : url,
			type : "GET",
			cache : false,
			success : function(data, status){
				if (status == "success") parseJSON(data);
			}
		});
	}
};

function parseJSON(data) {
	$("#sotreList").html("");
	
	var i;
	var count = data.count;
	var list = data.storeList;
	
	var htmlTxt = "";
	for (i = 0; i < count; i++) {
		htmlTxt += "<li class='storeInfo'>";
		htmlTxt += "<div class='str_img'>" + "<img src='" + list[i].st_img + "'></img>" + "</div>";
		htmlTxt += "<div class='st_name' onclick='move(" + list[i].st_uid + ")'>" + list[i].st_name + "</div>";
		htmlTxt += "<div class='st_address'>" + list[i].st_address + "</div>";
		htmlTxt += "<div class='st_contact'>" + list[i].st_contact + "</div>";
		htmlTxt += "<div class='st_hours'>" + list[i].st_hours + "</div>";
		htmlTxt += "<div class='st_dist'>" + list[i].st_dist + "km" + "</div>";
		htmlTxt += "</li>";
	}
	$("#storeList").html(htmlTxt);
};

function move(st_uid) {
	location.href='storeView.slime?st_uid=' + st_uid;
}