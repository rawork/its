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

var isDetailed = false;

var x = 1;
var col = new String();

function blink()
{
    if (x%2) {
        col = "rgb(222,138,39)";
    } else {
        col = "rgb(0,0,0)";
    }

    $('.blink').css('color', col);
    x++;
    if(x>2){
        x=1
    }
    setTimeout("blink()",750);
}

$(document).ready(function(){

    blink();

    $(document).on('mouseenter', 'li.collapsed', function(){
        var pos = $(this).position();
        $(this).children('ul').css({left: pos.left + $(this).children('a').width() + 20, 'margin-top': -20});
        $(this).children('ul').fadeIn(100, 'swing');
    });

    $(document).on('mouseleave', 'li.collapsed', function(){
        $(this).children('ul').fadeOut(100, 'swing');
    });

//    $('li.collapsed').trigger('mouseleave');

   $(document).on('click','.cnc input', function(){
       if ($(this).attr('data-id') == 1) {
           $('.description ul li ul').parent().removeClass('hidden');
       } else {
           $('.description ul li ul').parent().addClass('hidden');
       }

   });

   $(document).on('click', '.feed a', function(e){
       e.preventDefault();
       if (isDetailed){
           return;
       }
       $('#send').attr('disabled', true);
       $('.detail').toggleClass('hidden');
       $('.update').toggleClass('hidden');
       isDetailed = true;
       var that = $(this);
       $('.configurator-title').html(that.attr('title'));
       that.siblings().removeClass('active');
       that.addClass('active');
       $.post("/configurator/detail", {id: that.attr('data-id')},
           function(data){
               if (data.ok) {
                   $('.description').html(data.description);
                   if (data.cnc) {
                       $('.cnc div.radio').remove();
                       for (i in data.cnc) {
                           var input = $('<input type="radio" name="cnc" />').val(data.cnc[i]['name']).attr('data-id', data.cnc[i]['id']);
                           var div = $('<div></div>').addClass('radio').append(input[0].outerHTML).append(data.cnc[i]['name']);
                           $('.cnc').append(div);
                       }
                   }
                   if (data.drive) {
                       $('.drive div.radio').remove();
                       for (i in data.drive) {
                           var input = $('<input type="radio" name="drive" />').val(data.drive[i]['name'])
                           var div = $('<div></div>').addClass('radio').append(input[0].outerHTML).append(data.drive[i]['name']);
                           $('.drive').append(div);
                       }
                   }
                   if (data.chuck) {
                       $('.chuck div.radio').remove();
                       for (i in data.chuck) {
                           var input = $('<input type="radio" name="chuck" />').val(data.chuck[i]['name'])
                           var div = $('<div></div>').addClass('radio').append(input[0].outerHTML).append(data.chuck[i]['name']);
                           $('.chuck').append(div);
                       }
                   }
                   if (data.other) {
                       $('.other div.checkbox').remove();
                       for (i in data.other) {
                           var input = $('<input type="checkbox" name="other" />').val(data.other[i]['name'])
                           var div = $('<div></div>').addClass('checkbox').append(input[0].outerHTML).append(data.other[i]['name']);
                           $('.other').append(div);
                       }
                   }
               } else {
                   alert('Ошибка!');
               }
               isDetailed = false;
               $('input[name=cnc]')[0].checked = true;
               $('input[name=drive]')[0].checked = true;
               $('input[name=chuck]')[0].checked = true;
               $('#send').attr('disabled', false);
               $('.update').toggleClass('hidden');
               $('.detail').toggleClass('hidden');
           }, "json");
   });

   $(document).on('click', '#send', function(){
       var fio = $('input[name=fio]').val();
       var phone = $('input[name=phone]').val();
       if (!fio || !phone) {
           alert('Не заполнены обязательные поля!');
           return;
       }

       var machine = $('.configurator-title').html();

       var email = $('input[name=email]').val();
       var cnc = $('input[name=cnc]:checked').val();
       var drive = $('input[name=drive]:checked').val();
       var chuck = $('input[name=chuck]:checked').val();
       var other = $('input[name=other]:checked');

       var otherValues = other.map(function(){
           return $(this).val();
       }).get();

//       console.log(fio);
//       console.log(phone);
//       console.log(email);
//       console.log(machine);
//       console.log(cnc);
//       console.log(drive);
//       console.log(chuck);
//       console.log(otherValues);

       $.post("/configurator/order", {fio: fio, phone: phone, email: email, machine: machine, cnc: cnc, drive: drive, chuck: chuck, other: otherValues},
       function(data){
           $('input[name=fio]').val('');
           $('input[name=phone]').val('');
           $('input[name=email]').val('');
           alert(data.content);
       }, "json");
   });
   $('input[name=cnc]')[0].checked = true;
   $('input[name=drive]')[0].checked = true;
   $('input[name=chuck]')[0].checked = true;
});