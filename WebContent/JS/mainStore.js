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
		htmlTxt += "<li class='store' onclick='move(" + list[i].st_uid + ")'>"
		htmlTxt += "<div class='spotlight' style='margin-bottom:0'>";
		htmlTxt += "<span class='image'>" + "<img src='upload/offstore/" + list[i].st_img + "' style='width:7em;'/>" + "</span>";
		htmlTxt += "</div>";
		htmlTxt += "<h4 style='margin:0'>" + '매장명 : <b>' + list[i].st_name + "</b><h4>";
		htmlTxt += "<p style='margin:0'>" + '주소 : ' +list[i].st_address + "</p>";
		htmlTxt += "<p style='margin:0'>" + '연락처 : ' + list[i].st_contact + "</p>";
		htmlTxt += "<p style='margin:0'>" + '영업시간 : ' + list[i].st_hours + "</p>";
		htmlTxt += "<p style='margin:0'>" + '거리 : ' + list[i].st_dist + "km" + "</p>";
		htmlTxt += "</li>";
	}
	$("#storeList").html(htmlTxt);
};

function move(st_uid) {
	location.href='storeView.slime?st_uid=' + st_uid;
}