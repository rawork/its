{foreach from=$blocks item=block}
{if count($block.items)}
<h2><span>{$block.name}</span></h2>
<ul class="catalog-contents">
{foreach from=$block.items item=item}
<li>
<a href="{$item.link}" title="{$item.name}"><br>
<img src="{$item.foto}" width="128" height="96" alt="{$item.name}" title="{$item.name}"><br>
{$item.name}</a>
</li>
{/foreach}
</ul>
<div class="clearfix"></div>
<br>
{/if}
{if $block.id == 2}
<div class="configurator-link2"><a class="btn btn-warning btn-large" href="{raURL node=configurator}">Перейти к конфигуратору токарного станка с ЧПУ</a></div>
{/if}
{/foreach}