<div class="Gorky">Страницы:
{if $prev_link}<a href="{$prev_link}">Предыдущая</a> | {/if}
{foreach from=$pages item=i}
<a{if $page == $i.name} class="apush"{/if} href="{$i.ref}">{$i.name} стр.</a> | 
{/foreach}
{if $next_link}<a href="{$next_link}">Следующая</a>{/if}
</div>