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

function priceQuery() {
	var errorList = [];
	product = $('input[name=product]').val();;
	person = $('input[name=person]').val();
	if ('' === person) {
		errorList.push('Не указано Контактное лицо');
	}
	phone = $('input[name=phone]').val();
	if ('' === phone) {
		errorList.push('не указан Телефон');
	}
	if (errorList.length) {
		var errorMsg = "При заполнении формы допущены следующие ошибки:\n\n";
		for (i = 0; i < errorList.length; i++) {
			errorMsg += errorList[i] + "\n";
		}
		alert(errorMsg);
		return false;
	}	
	email = $('input[name=email]').val();
	comment = $('textarea[name=comment]').val();
	$.post("/catalog/price", {product: product, person: person, phone: phone, email: email, comment: comment},
	function(data){
		$('#priceform').removeClass('hidden');
		$('#priceform').html(data.content);
		$('input[name=person]').val('');
		$('input[name=phone]').val('');
		$('input[name=email]').val('');
		$('textarea[name=comment]').val('');
	}, "json");
}

function feedbackOpen(type) {
	if (type === 1) {
		$('#feedback-title').html('Обращение с жалобой');
	} else if (type === 2) {
		$('#feedback-title').html('Обращение с благодарностью');
	} else if (type === 3) {
		$('#feedback-title').html('Обратная связь');
	}
	$('input[name=feedback_type]').val(type);
	$('#feedbackform').addClass('hidden');
	$('#myModal').modal('show');
}

function feedbackSend() {
	var errorList = [];
	type = $('input[name=feedback_type]').val();;
	person = $('input[name=feedback_person]').val();
	if ('' === person) {
		errorList.push('Не указано Контактное лицо');
	}
	phone = $('input[name=feedback_phone]').val();
	if ('' === phone) {
		errorList.push('Не указан Телефон');
	}
	email = $('input[name=feedback_email]').val();
	if ('' === email) {
		errorList.push('Не указан Адрес электронной почты');
	}
	if (errorList.length) {
		$('#feedbackform').addClass('alert-error');
		$('#feedbackform').removeClass('alert-success');
		$('#feedbackform').removeClass('hidden');
		$('#feedbackform').html(errorList.join('<br>'));
		return false;
	}
	comment = $('textarea[name=feedback_comment]').val();
	$.post("/catalog/feedback", {type: type, person: person, phone: phone, email: email, comment: comment},
	function(data){
		$('#feedbackform').removeClass('alert-error');
		$('#feedbackform').addClass('alert-success');
		$('#feedbackform').removeClass('hidden');
		$('#feedbackform').html(data.content);
		$('input[name=feedback_person]').val('');
		$('input[name=feedback_phone]').val('');
		$('input[name=feedback_email]').val('');
		$('textarea[name=feedback_comment]').val('');
	}, "json");
}