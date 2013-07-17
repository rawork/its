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
	<li><a href="{raURL node=catalog method=product prms=$item.id}">{if $node.is_list != 1}<img src="{if $item.foto_small}{$item.foto_small}{else}/bundles/public/img/no_photo.gif{/if}" width="128" alt="{$item.name}" title="{$item.name}">{/if}{$item.name}</a></li>
	{/foreach} 
	</ul>
	{/if}
	<div class="clearfix"></div>
	<div>{$node.preview}</div>
	<div>{$node.description}</div>
{elseif $is_product}
	
{else}
	<p>Для получения дополнительной информации, выберите одну из вложенных категорий.</p>
	{foreach from=$cats item=block}
	{if count($block.children)}
	<h2><span>{$block.name}</span></h2>
	<ul class="catalog-contents">
	{foreach from=$block.children item=item}
	<li>
	<a href="{if $item.link}{$item.link}{else}{raURL node=catalog method=index prms=$item.id}{/if}" title="{$item.name}"><br>
	<img src="{if $item.image_small}{$item.image_small}{else}/bundles/public/img/no_photo.gif{/if}" width="128" height="96" alt="{$item.name}" title="{$item.name}"><br>
	{$item.name}</a>
	</li>
	{/foreach}
	</ul>
	<div class="clearfix"></div>
	<br>
	{/if}
	{/foreach}
{/if}
<div class="clearfix"></div>