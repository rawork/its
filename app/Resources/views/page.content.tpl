<!DOCTYPE html>
<html>
	<head>
		<title>{$title}</title>
		{$meta}
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link href="/bundles/bootstrap_new/css/bootstrap.css" rel="stylesheet" type="text/css">
		<link href="/bundles/public/css/default.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="/bundles/public/js/jquery.js"></script>
		<script type="text/javascript" src="/bundles/public/js/public.functions.js"></script>
	</head>
	<body>
		<div class="drop-shadow curved curved-hz-1">
			<div class="menu">
				<div class="container">
					<div class="row-fluid">
						<div class="span5">
							<a href="/"><img src="/bundles/public/img/avrora-logo.png" /></a>
						</div>	
						<div class="span7">
							<div class="slogan">{raMethod path=Fuga:Public:Common:block args=["name":"slogan"]}</div>
							<div class="phones">{raMethod path=Fuga:Public:Common:block args=["name":"phones"]}</div>
							<a class="call-order pull-right" href="javascript:toggleBlock('form-call')">Заказать звонок</a>
						</div>
					</div>
					<div class="row-fluid">
						<div class="span12">
							<div class="navbar">
								<div class="navbar-inner">
									<ul class="nav">
										<li><a href="/">Главная</a></li>
										{foreach item=node from=$links}
										<li{if $node.id == $curnode.id} class="active"{/if}><a href="{$node.ref}">{$node.title}</a></li>
										{/foreach}
								    </ul>	
								</div>
							</div>
						</div>
					</div>	
				</div>
			</div>
		</div>
		<div class="drop-shadow curved curved-hz-1">
			<div class="hero">
				<div class="container">
					{raMethod path=Fuga:Public:Common:breadcrumb}	
					<h1>{$h1}</h1>
					<div class="row-fluid">
						<div class="span12 content ramka">
							{eval var=$mainbody}
						</div>
					</div>
				</div>	
			</div>
		</div>
		<div class="footer">
			<div class="container">
				<div class="row-fluid">
					<div class="span6">
						{raMethod path=Fuga:Public:Common:block args=["name":"copyright"]}
					</div>
					<div class="span6">
						<div>
						<form class="form-search" method="get">
							<input type="text" name="text" class="input-middle search-query" placeholder="Поиск на сайте">
							<a class="btn btn-small"><i class="icon-search"></i></a>
						</form>
						</div>	
					</div>
				</div>	
			</div>
		</div>
		<div id="form-call" class="closed ramka-orange">
			<a href="javascript:toggleBlock('form-call')" class="close">&times;</a>
			{raMethod path=Fuga:Public:Calc:callform}
		</div>
	</body>
</html>
