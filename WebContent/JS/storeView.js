/**
 * 
 */

var rest_key = "fe6a0fbeb319156a4140c720d11dd798";

function getMap(st_address) {
	var address = st_address;
	
	var i = address.indexOf(',');
	if (i == -1) {
		i = address.indexOf('(');
	}
	
	if (i != -1) {
		address = address.substring(0, i);
	}
	
	
	var url = "https://dapi.kakao.com/v2/local/search/keyword.json?query=" + address;
	var rest_key = "KakaoAK fe6a0fbeb319156a4140c720d11dd798";
	
	$.ajax({
		url: url,
		headers: {'Authorization' : rest_key},
		type: "GET",
		cache: false,
		dataType: "json",
		success: function(data, status){
			if(status == "success"){
				moveKakao(data);
			}
		}
	});
}

function moveKakao(data) {
	var itemId = data.documents[0].id;
	var mapUrl = "https://map.kakao.com/link/map/" + itemId;
	
	window.open(mapUrl);
}
