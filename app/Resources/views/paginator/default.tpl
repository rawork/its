<div class="nums">
Записи {$currentItems} из {$totalItems}	
<div class="pagination">
  <ul>
<li{if $begin_link == ''} class="disabled"{/if}><a href="{$begin_link}">Начало</a></li>
<li{if $prev_link == ''} class="disabled"{/if}><a href="{$prev_link}">&laquo;</a></li>
{foreach from=$pages key=k item=i}
<li{if $page == $i.name} class="active"{/if}><a href="{$i.ref}">{$i.name}</a></li>
{/foreach}
<li{if $next_link == ''} class="disabled"{/if}><a href="{$next_link}">&raquo;</a></li>
<li{if $end_link == ''} class="disabled"{/if}><a href="{$end_link}">Конец</a></li>
  </ul>
</div></div>