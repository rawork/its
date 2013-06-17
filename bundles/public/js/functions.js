$(window).resize(function() {
	resizeHandle();
});

$(document).ready(function() {
	resizeHandle();
});

function resizeHandle() {
	width = $(window).width();
	left = 290;
	if (width <= 430) {
		left = left - (615-430);
	}
	if (width < 615 && width > 430) {
		left = left - (615-width);
	}
	if (width > 767) {
		left = 70;
	}
	if (width > 979) {
		left = 180;
	}
	if (width > 1199) {
		left = 290;
	}	
	
	
	$("#cool-man").css('left', left);
}