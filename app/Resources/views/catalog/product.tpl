<a href="#price" class="pull-right btn btn-large btn-primary">Запрос стоимости</a>
<div id="catImg">
	<a href="{$node.foto_big}"><img src="{$node.foto_medium}" width="380"></a>
</div>
{if $node.producer_id_name}<div class="producer"><span>Производитель:</span> {$node.producer_id_name}</div>{/if}
{if $node.analog}<div class="analog"><span>Аналог станка:</span> {$node.analog}</div>{/if}
<div>{$node.preview}</div>
<div><br>{if $node.description}{$node.description}{elseif !$gallery}<p>Информация по этому виду товаров в настоящий момент готовится.</p>{/if}</div>
{if $gallery}
{*<h3><span>Галерея</span></h3>*}
<div id="galleria">
	{foreach from=$gallery item=foto}
	<a href="{$foto.foto_medium}">
		<img 
			src="{$foto.foto_small}"
			data-big="{$foto.foto_big}"
			data-title="{$node.name}"
			data-description=""
		>
	</a>
	{/foreach}
</div>
{/if}
<div id="priceform" class="hidden alert alert-success"></div>
<form method="post">
	<fieldset>
	  <legend><a name="price">Запрос стоимости</a></legend>
	  <input type="hidden" name="product" value="{$node.id}">
	  <label>Контактное лицо <span class="form-required">*</span></label>
	  <input type="text" name="person" placeholder="Контактное лицо">
	  <label>Телефон <span class="form-required">*</span></label>
	  <input type="text" name="phone" placeholder="Например, +7 (999) 888-88-88">
	  <label>Эл. почта</label>
	  <input type="text" name="email" placeholder="Адрес электронной почты">
	  <label>Описание запроса</label>
	  <div><textarea name="comment"></textarea></div>
	  <input type="button" class="btn" value="Отправить" onclick="priceQuery()" />
	</fieldset>
</form>