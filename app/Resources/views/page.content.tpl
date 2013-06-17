<!DOCTYPE html>
<head>
<title>{$title}</title>
{$meta}
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/bundles/bootstrap_new/css/bootstrap.css" type="text/css">
<link rel="stylesheet" href="/bundles/public/css/default.css" type="text/css">
<link href=”/favicon.ico” rel=”icon” type=”image/x-icon” />
<link href=”/favicon.ico” rel=”shortcut icon” type=”image/x-icon” />
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
						<p><a href="/publicatshow">Просмотреть ход выполнения</a></p>
					</div>
				</div>
				<div class="sideblock">
					<div class="title">Прайс-лист</div>
					<div class="content">
					{raMethod path=Fuga:Public:Common:block args='["name":"pricelist"]'}	
					</div>
				</div>
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
							<div><a class="btn btn-danger btn-block" href="javascript:void(0)">Пожаловаться</a></div>
							<div><a class="btn btn-success btn-block" href="javascript:void(0)">Поблагодарить</a></div>
							<div><a class="btn btn-warning btn-block" href="javascript:void(0)">Обратная связь</a></div>
						</p>
					</div>
				</div>
				<div class="clearfix"></div>		
			</div>
			<div class="span9 maincontent">
				{raMethod path=Fuga:Public:Common:breadcrumb}
				<h1><span>{$h1}</span></h1>
				<div class="inner-content">{eval var=$mainbody}</div>
				<br>
				{raMethod path=Fuga:Public:Common:block args='["name":"seo_text"]'}
				<div class="clearfix"></div>
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
			</div>
		</div>
	</div>
	<script type="text/javascript" src="/bundles/public/js/jquery.js"></script>
	<script type="text/javascript" src="/bundles/public/js/functions.js"></script>
</body>
</html>