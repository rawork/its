<!DOCTYPE html>
<html>
  <head>
    <title>Восстановление пароля - {$prj_name}.{$prj_zone}</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="/bundles/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="/bundles/admin/css/login.css" rel="stylesheet">
	<script src="/bundles/public/js/jquery.js"></script>
    <script src="/bundles/bootstrap/js/bootstrap.min.js"></script>
  </head>
  <body>
	{if $message}
	<div class="login-message">
		<div class="alert alert-{$message.type}">
			{$message.text}
		</div>
	</div>{/if}
	<div class="well login-form-container">
		<div class="login-title">
		<img src="{$theme_ref}/img/icons/icon_key.gif"> Запрос пароля
		</div>
		<div class="dotted-line"></div>
		<div class="login-form">
		<form class="form-horizontal" method="post">
		<div class="control-group">
			<label class="control-label" for="inputLogin">Логин или эл. почта</label>
			<div class="controls">
			<input type="text" id="inputLogin" name="_user">
			</div>
		</div>
		<div class="control-group">
			<div class="controls">
			<button type="submit" class="btn">Отправить</button>
			</div>
		</div>
		</form>
		<div class="dotted-line"></div>	
		<div>
		Если вы забыли пароль, введите ваш Логин или адрес Электронной почты, указанный при регистрации. 
		Новый пароль будет выслан вам по электронной почте.<br>
        Вернуться на <a href="/admin/">форму авторизации</a>.
		</div>

	</div> 
	  
  </body>
</html>