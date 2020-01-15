/*
	Phantom by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
*/

$(document).ready(function(){
	var navPosition = $("div#main").offset().top;
	$(window).on("scroll", function(){
		var position = window.pageYOffset;
		if(navPosition < position){
			$("nav#nav").addClass("alt");
		} else{
			$("nav#nav").removeClass("alt");
		}
	});
	
});