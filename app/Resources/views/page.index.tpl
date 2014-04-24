<!DOCTYPE html>
<head>
<title>{$title}</title>
{$meta}
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="/bundles/bootstrap_new/css/bootstrap.css" type="text/css">
<link rel="stylesheet" href="/bundles/public/css/default.css" type="text/css">
<link href="/favicon.ico” rel=”icon” type=”image/x-icon” />
<link href="/favicon.ico” rel=”shortcut icon” type=”image/x-icon” />
</head>
<body>
	<div class="container">
		<div class="row-fluid" id="header">
			<div class="span6 logo">
				<div class="title"><a href="/" title="Ивтехсервис - металлорежущие станки с ЧПУ"><img src="/bundles/public/img/logo.jpg"></a></div>
			</div>
			<div class="span6">
				<div>
					<div class="pull-right">
						<ul id="other-menu">
							<li class="item1"><a href="/" title="На главную">На главную</a></li>
							<li class="item2"><a href="mailto:its@ivtexservis.ru" title="Электронная почта">Электронная почта</a></li>
							<li class="item3"><a href="/sitemap" title="Карта сайта">Карта сайта</a></li>
						</ul>
						
					</div>
					<div class="clearfix"></div>
					<div class="contacts pull-right">
						<p class="phone">{raMethod path=Fuga:Public:Common:block args='["name":"phone"]'}</p>
						{raMethod path=Fuga:Public:Common:block args='["name":"address"]'}
					</div>
					<div class="cool-man-container"><div id="cool-man"></div></div>
				</div>
			</div>
		</div>
		<div class="row-fluid">
			<div class="span3 menu">
				<div class="sideblock">
					<div class="title">Навигация</div>
					<div class="content">
						<ul class="menu">
						<li class="leaf"><a href="/" class="active">Главная</a></li>
						{foreach item=node from=$links}
						<li class="{$node.class}"><a href="{$node.ref}">{$node.title}</a></li>
						{/foreach}
						</ul>
					</div>
				</div>
				<div class="sideblock">
					<div class="title">Выполнение заказов</div>
					<div class="content">
						<h3><strong><a href="/publicatshow">Просмотреть ход выполнения</a></strong></h3>
					</div>
				</div>
				{*<div class="sideblock">*}
					{*<div class="title">Прайс-лист</div>*}
					{*<div class="content">*}
						{*{raMethod path=Fuga:Public:Common:block args='["name":"pricelist"]'}*}
					{*</div>*}
				{*</div>*}
				{raMethod path=Fuga:Public:Catalog:offer}
				{raMethod path=Fuga:Public:Catalog:new}
				<div class="sideblock">
					<div class="title">Поиск</div>
					<div class="content">
						<form method="get" action="/search">
							<input type="text" name="text" class=" search-query">
							<input type="submit" value="Поиск" class="btn btn-mini btn-info" />
						</form>
					</div>
				</div>	
				<div class="sideblock">
					<div class="title">Обратная связь</div>
					<div class="content">
						<p class="buttons">
							<div><a class="btn btn-danger btn-block" href="javascript:feedbackOpen(1)">Пожаловаться</a></div>
							<div><a class="btn btn-success btn-block" href="javascript:feedbackOpen(2)">Поблагодарить</a></div>
							<div><a class="btn btn-warning btn-block" href="javascript:feedbackOpen(3)">Обратная связь</a></div>
						</p>
					</div>
				</div>
				<div class="sideblock">
					<div class="title">Активно участвуем</div>
					<div class="content">
					{raMethod path=Fuga:Public:Common:block args='["name":"community"]'}	
					</div>
				</div>
				<div class="sideblock">
					<div class="title">Инструкции</div>
					<div class="content">
						{raMethod path=Fuga:Public:Common:block args='["name":"instruction"]'}
					</div>
				</div>
						
			</div>
			<div class="span9 maincontent">
				<h1><span>Компания &laquo;Ивтехсервис&raquo;<br> <strong>Сильнее стали!</strong></span></h1>
				{raMethod path=Fuga:Public:Common:block args='["name":"welcome"]'}
				
				{raMethod path=Fuga:Public:Catalog:leaders}
				{raMethod path=Fuga:Public:Catalog:repair}
				{raMethod path=Fuga:Public:Catalog:blocks}
				<br>
				{$mainbody}
				<br>
				{raMethod path=Fuga:Public:News:lenta}
				<h2><span>Наши сайты</span></h2>
				<div class="content-block">
					<p><a target="_blank" href="http://pragati.ru/"><img alt="Pragati" src="/files/ban1.jpg" /></a>
						&nbsp;
					<a target="_blank" href="http://tdsks.su/"><img alt="СтанКомплектСервис" src="/files/ban2.jpg" /></a></p>
				</div>
				<h2><span>Наши партнеры</span></h2>
				<div class="content-block partners">
					<ul>
						<li><a href="/partners#thomas" title=""><img src="/files/u1/p-thomas.jpg" width="130" height="28" /></a></li>
						<li><a href="/partners/#omron" title=""><img src="/files/u1/p-omron.jpg" width="119" height="28" /></a></li>
						<li><a href="http://pragati.ru/" title=""><img src="/files/u1/p-pragati.jpg" width="148" height="28" /></a></li>
					</ul>
					<div class="clearfix"></div>
				</div>
				{raMethod path=Fuga:Public:Common:block args='["name":"seo_text"]'}
			</div>
		</div>
		<div class="prefooter"><div class="pull-right"></div></div>
		<div class="row-fluid">
			<div class="span12 footer">
				<div class="copy pull-left">{raMethod path=Fuga:Public:Common:block args='["name":"copyright"]'}</div>
				<ul class="bottom-menu">
					<li><a href="/" class="active">Главная</a></li>
					{foreach item=node from=$links}
					<li><a href="{$node.ref}">{$node.title}</a></li>
					{/foreach}
				</ul>
				<div class="clearfix"></div>
				<div class="counters">
					{include file='counters.tpl'}
				</div>
				<div class="counters">{raMethod path=Fuga:Public:Common:block args='["name":"counters"]'}</div>
			</div>
		</div>
	</div>
	<div id="myModal" class="modal hide fade">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			<h3 id="feedback-title"></h3>
		</div>
		<div class="modal-body">
			<div id="feedbackform" class="hidden alert alert-success"></div>
			<form name="feedbackform" method="post">
				<fieldset>
				  <input type="hidden" name="feedback_type" value="3">
				  <label>Контактное лицо <span class="form-required">*</span></label>
				  <input type="text" name="feedback_person" class="span6" placeholder="Контактное лицо">
				  <label>Телефон <span class="form-required">*</span></label>
				  <input type="text" name="feedback_phone" class="span6" placeholder="Например, +7 (999) 888-88-88">
				  <label>Эл. почта <span class="form-required">*</span></label>
				  <input type="text" name="feedback_email" class="span6" placeholder="Адрес электронной почты">
				  <label>Сообщение</label>
				  <div><textarea name="feedback_comment" class="span6"></textarea></div>
				</fieldset>
			</form>
		</div>
		<div class="modal-footer">
		  <a href="javascript:feedbackSend()" class="btn btn-primary">Отправить</a>
		</div>
	</div>
	<script type="text/javascript" src="/bundles/public/js/jquery.js"></script>
	<script type="text/javascript" src="/bundles/bootstrap_new/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="/bundles/public/js/functions.js"></script>
</body>
</html>