/*
	Phantom by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
*/

$(document).ready(function(){
	//div#main top 위치
	var navPosition = $("div#main").offset().top;
	$(window).on("scroll", function(){
		//브라우저 top위치
		var position = window.pageYOffset;
		if(navPosition < position){ //div#main top이 브라우저 위로 올라갔을때
			$("nav#nav").addClass("alt");
		} else{
			$("nav#nav").removeClass("alt");
		}
	});
	
});