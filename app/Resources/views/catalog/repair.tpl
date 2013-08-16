{if count($items)}
<h2><span>Ремонт и модернизация</span></h2>
<ul class="catalog-contents">
{foreach from=$items item=item}
<li>
<a href="{raURL node=catalog method=index prms=$item.id}" title="{$item.name}"><br>
<img src="{$item.image_small}" width="128" height="96" alt="{$item.name}" title="{$item.name}"><br>
{$item.name}</a>
</li>
{/foreach}
</ul>
<div class="clearfix"></div>
<br>
{/if}