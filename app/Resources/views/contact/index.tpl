<script src="http://api-maps.yandex.ru/2.0/?load=package.standard&mode=debug&lang=ru-RU" type="text/javascript"></script>
{foreach item=item from=$items}
<div class="contact">
	<h3>{$item.name}</h3>
	<strong>Адрес:</strong> {$item.address}<br>
	<strong>Телефон:</strong> {$item.phone}<br>
	<strong>Эл. почта:</strong> <a href="mailto:{$item.email}">{$item.email}</a><br>
	<h4>Схема проезда</h4>
	<div class="description">{$item.description}</div>
	<div class="map" id="ymap_{$item.id}"></div>
	<script type="text/javascript">
		createMap({$item.id}, {$item.latitude}, {$item.longitude}, '{$item.name}', '{$item.address}<br>{$item.phone}');
	</script>
</div>
{/foreach}