{if $is_cat}
	{if $cats}
	<ul{if $node.is_list != 1} class="catalog-contents"{/if}>
	{foreach from=$cats item=item}
	<li><a href="{raURL node=catalog method=index prms=$item.id}">{if $node.is_list != 1}<img src="{if $item.image_small}{$item.image_small}{else}/bundles/public/img/no_photo.gif{/if}" width="128" alt="{$item.name}" title="{$item.name}">{/if}{$item.name}</a></li>
	{/foreach} 
	</ul>
	{/if}
	{if $products}
	<ul{if $node.is_list != 1} class="catalog-contents"{/if}>
	{foreach from=$products item=item}
	<li><a href="{raURL node=catalog method=index prms=$item.id}">{if $node.is_list != 1}<img src="{if $item.image_small}{$item.image_small}{else}/bundles/public/img/no_photo.gif{/if}" width="128" alt="{$item.name}" title="{$item.name}">{/if}{$item.name}</a></li>
	{/foreach} 
	</ul>
	{/if}
	<div class="clearfix"></div>
	<div>{$node.preview}</div>
	<div>{$node.description}</div>
{elseif $is_product}
	<div id="catImg">
		<a href="{$node.image_big}"><img src="{$node.image_medium}" width="380"></a>
	</div>
	<div>{$node.preview}</div>
	<div>{if $node.description}{$node.description}{else}<p>Информация по этому виду товаров в настоящий момент готовится.</p>{/if}</div>
	<form method="post">
		<fieldset>
		  <legend>Запрос стоимости</legend>
		  <input type="hidden" name="product" value="{$node.name}">
		  <label>Контактное лицо <span class="form-required">*</span></label>
		  <input type="text" name="person" placeholder="Контактное лицо">
		  <label>Телефон <span class="form-required">*</span></label>
		  <input type="text" name="phone" placeholder="Например, +7 999 888-88-88">
		  <label>Эл. почта</label>
		  <input type="text" name="email" placeholder="Адрес электронной почты">
		  <label>Описание запроса</label>
		  <div><textarea name="comment"></textarea></div>
		  <input type="submit" class="btn" value="Отправить" />
		</fieldset>
	</form>
	
{else}
	{if $cats}
	<ul class="catalog-contents">
	{foreach from=$cats item=item}
	<li><a href="{raURL node=catalog method=index prms=$item.id}"><img src="{if $item.image_small}{$item.image_small}{else}/bundles/public/img/no_photo.gif{/if}" width="128" alt="{$item.name}" title="{$item.name}">{$item.name}</a></li>
	{/foreach} 
	</ul>
	{/if}
{/if}
<div class="clearfix"></div>