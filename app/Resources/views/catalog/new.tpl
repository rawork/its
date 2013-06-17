{if $item}
<div class="sideblock">
	<div class="title">Новинка</div>
	<div class="content">
		<p align="center">
			<a href="{raURL node=catalog method=index prms=$item.id}"><img src="{$item.image_small}"></a><br>
			<br>
			<a href="{raURL node=catalog method=index prms=$item.id}">{$item.name}</a>
		</p>
	</div>
</div>
{/if}