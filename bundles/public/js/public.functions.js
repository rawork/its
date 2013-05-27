function newWin(nameImg,width,height){
	LeftPosition = (screen.width) ? (screen.width-width)/2 : 0;
 	TopPosition = (screen.height) ? (screen.height-height)/2 : 0;
	win=open("","",'height='+height+',width='+width+',top='+TopPosition+',left='+LeftPosition);
	win.document.write('<body leftmargin=0 topmargin=0 marginwidth=0 marginheight=0><table cellpadding=0 cellspacing=0 border=0><tr><td><img src="'+nameImg+'" style="cursor:hand;" onclick="window.close();" alt=""></td></tr></table></body></html>');
  	win.document.close();
}

function newWinHtml(urlHtml,width,height){
	LeftPosition = (screen.width) ? (screen.width-width)/2 : 0;
 	TopPosition = (screen.height) ? (screen.height-height)/2 : 0;
	win=open(urlHtml,"",'height='+height+',width='+width+',top='+TopPosition+',left='+LeftPosition);
}

function open_window(link,w,h) {
 LeftPosition = (screen.width) ? (screen.width-w)/2 : 0;
 TopPosition = (screen.height) ? (screen.height-h)/2 : 0;
 var win = 'height='+h+',width='+w+',top='+TopPosition+',left='+LeftPosition+',menubar=no,location=no,scrollbars=yes,resizable=yes';
 newWin = window.open(link,'newWin'+w+h,win);
}

function procFocus(ob, txt) {
	if (ob.value == txt) {
		ob.value = '';
	}	
}

function procBlur(ob, txt) {
	if (ob.value == '') {
		ob.value = txt;
	}	
}

document.onkeydown = register;

function register(e) {
	if (!e) e = window.event;
	var k = e.keyCode;
	if (e.ctrlKey) {
		var tagName = (e.target || e.srcElement).tagName;
		if (tagName != 'INPUT' && tagName != 'TEXTAREA') {
			var d;
			if (k == 37) {
				d = $('#previous_page');
			}
			if (k == 39) {
				d = $('#next_page');
			}
			if (d) location.href = d.attr('href');
		}
	}
}

/* start ajax */
function callForm() {
	person = $('#inputperson1').val();
	phone = $('#inputphone1').val();
	if (!person || !phone) {
		return;
	}
	$.post('/calc/call', {person: person, phone: phone},
	function(data){
		if (data.status) {
			$('#form-call-content').html(data.message);
		}
	}, "json");
	
}
/* end ajax */

function checkForm(form) {
	// Заранее объявим необходимые переменные
	var el, // Сам элемент
	elName, // Имя элемента формы
	value, // Значение
	type; // Атрибут type для input-ов
	// Массив списка ошибок, по дефолту пустой
	var errorList = [];
	// Хэш с текстом ошибок (ключ - ID ошибки)
	var errorText = {
	1 : "Не заполнено поле 'Имя'",
	2 : "Не заполнено поле 'E-mail'",
	3 : "Не заполнено поле 'Телефон'",
	4 : "Неизвестная ошибка"
	}
	// Получаем семейство всех элементов формы
	// Проходимся по ним в цикле
	//form = document.getElementById(frm);
	for (var i = 0; i < form.elements.length; i++) {
	el = form.elements[i];
	elName = el.nodeName.toLowerCase();
	value = el.value;
	if (elName == "input") { // INPUT
	// Определяем тип input-а
	type = el.type.toLowerCase();
	// Разбираем все инпуты по типам и обрабатываем содержимое
	switch (type) {
	case "text" :
	if (el.title != "" && value == "") errorList.push("Не заполнено поле: "+el.title+"");
	break;
	case "file" :
	//if (value == "") errorList.push(3);
	break;
	case "checkbox" :
	// Ничего не делаем, хотя можем
	break;
	case "radio" :
	// Ничего не делаем, хотя можем
	break;
	default :
	// Сюда попадают input-ы, которые не требуют обработки
	// type = hidden, submit, button, image
	break;
	}
	} else if (el.title != "" && elName == "textarea") { // TEXTAREA
	if (value == "") errorList.push("Не заполнено поле '"+el.title+"'");
	} else if (el.title != "" && elName == "select") { // SELECT
	if (value == 0) errorList.push("Не выбран элемент в поле '"+el.title+"'");
	} else {
	// Обнаружен неизвестный элемент ;)
	}
	}
	// Финальная стадия
	// Если массив ошибок пуст - возвращаем true
	if (!errorList.length) {
		return true;
	}
	// Если есть ошибки - формируем сообщение, выовдим alert
	// и возвращаем false
	var errorMsg = "При заполнении формы допущены следующие ошибки:\n\n";
	for (i = 0; i < errorList.length; i++) {
	errorMsg += errorList[i] + "\n";
	}
	alert(errorMsg);
	return false;
}

function popUp(name) { //default name = pop_up 
	$.dimScreen(500, 0.4, function() {$('#'+name).fadeIn('fast')});
}

var closePopupTimer;
var mdelay = 2000;

function closePopUpTime(time, name) {
	if (time == 0) {
		time = mdelay;
	}
	closePopupTimer = setTimeout('closePopUp(\''+name+'\')', time);
}

function closePopUp(name) {  // default name = pop_up
	clearTimeout(closePopupTimer);
	$('#'+name).css('display', 'none');
	$.dimScreenStop();
	return false;
}

$(window).resize(function(){
	$('#__dimScreen').css({
            height: $(document).height() + 'px'
            ,width: $(document).width() + 'px'
    });
});

function trim(str)
{
	return str.replace(/^[\s\xA0]+/, '').replace(/[\s\xA0]+$/, '').replace(/ +$/, '').replace(/^ +/, '');
}

function isEmail(email)
{
	var pattern = /^[-._A-Za-z0-9]{1,}@[-._A-Za-z0-9]{1,}\.[A-Za-z]{2,4}$/;
	return pattern.test(email);
}

function isPhone(phone)
{
	var pattern = /^([+])?[0-9\s\(\)-]{10,}$/;
	return pattern.test(phone);
}


function toggleBlockByLink(element, block, showText, hideText) {
	$('#'+block).toggleClass('closed');
	if ($('#'+block).hasClass('closed')) {
		$('#'+element).html(showText);
	} else {
		$('#'+element).html(hideText);
	}
}

function createMap(id, latitude, longitude, title, address) {
	var myMap;
	ymaps.ready(function () { 
		myMap = new ymaps.Map("ymap_"+id, {
				// Центр карты
				center: [latitude, longitude],
				// Коэффициент масштабирования
				zoom: 15,
				behaviors: ["default", "scrollZoom"]
//				type: "yandex#satellite"
			}
		);
		
		myMap.balloon.open(
			// Позиция балуна
			[latitude, longitude], {
				// Свойства балуна
				contentHeader: title,
				contentBody: address
			}, {
				// Опции балуна. В данном примере указываем, что балун не должен иметь кнопку закрытия.
				closeButton: false
			});
    });
}

function toggleBlock(element_id) {
	if ('form-call' === element_id) {
		pos = $('.call-order').position();
		width = $('.call-order').outerWidth();
		width2 = $('#'+element_id).outerWidth();
		left = pos.left + width - width2;
		$('#'+element_id).css({left: left});
	}
	$('#'+element_id).toggleClass('closed');
}

