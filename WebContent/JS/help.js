
$(function(){
	var btnHowTo = $("#btnHowTo");
	var btnFeedback = $("#btnFeedback");
	
	btnFeedback.click(function(){
		
		$("#howTo").hide();
		$("#feedback").show();
		
		btnFeedback.addClass("primary");
		btnHowTo.removeClass("primary");
	});
	
	btnHowTo.click(function(){
		$("#howTo").show();
		$("#feedback").hide();
		
		btnFeedback.removeClass("primary");
		btnHowTo.addClass("primary");
	});
	
});

function askTypeChange(e) {
	var i = e.value;
	if (i == 2) {
		$("#manager").show();
		$("#user").hide();
	} else {
		$("#user").show();
		$("#manager").hide();
	}
};