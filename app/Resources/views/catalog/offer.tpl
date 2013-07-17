{if $item}
<div class="sideblock">
	<div class="title">Спецпредложение</div>
	<div class="content">
		<p align="center">
			<a href="{raURL node=catalog method=product prms=$item.id}"><img src="{$item.foto_small}"></a><br>
			<br>
			<a href="{raURL node=catalog method=product prms=$item.id}">Продается тяжелый горизонтально-расточной станок 2Б660Ф2. Без эксплуатации</a>
		</p>
	</div>
</div>
{/if}