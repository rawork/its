<div class="dwrap">
<div class="dframe">
<div class="dtr dtrtitle">
<table class="ddd" cellpadding="0" cellspacing="0"><tr>
{section name=sss start=1 loop=$weeks+1 step=1}
	<td><div class="dowidth dowidth2">Неделя {$smarty.section.sss.index}</div></td>
{/section}	
</tr></table>
</div>
{foreach from=$items item=item}
<div class="dtr title2">
	<div class="dtrmain"> <strong>№ {$item.doc_num} - {$item.title}</strong><br />{$item.client}<br />
	Инвентарный № {$item.doc_num}
</div>
<table class="ddd" cellpadding="0" cellspacing="0"><tr>	
	{foreach from=$item.photos item=photo name=photos}
	<td><div class="dowidth">
	{if $photo.foto1}
	{assign var=j value=$j+1}
	{assign var=j_prev value=$j-1}
	{assign var=j_next value=$j+1}
	<a id="aname{$item.id}_{$j}" name="aname{$item.id}_{$j}" onclick="openContestWindow('{$photo.foto1}', '{$item.title_for_java}', '{$photo.title}', '{$photo.comment}', '{$j_prev}', '{$j_next}', '{$item.id}', '{$smarty.foreach.photos.index}');return false;" href="javascript:void(0);"><img src="/upload/publicat/{$photo.foto1}.jpg" alt="{$photo.title}" title="{$photo.title}" /></a>
	{else}
	<a id="aname{$item.id}_{$photo.id}_1" name="aname{$item.id}_{$photo.id}_1" href="javascript:void(0);"></a>
	{/if}
	<br />
	{if $photo.foto2}	
	{assign var=j value=$j+1}
	{assign var=j_prev value=$j-1}
	{assign var=j_next value=$j+1}
	<a id="aname{$item.id}_{$j}" name="aname{$item.id}_{$j}" onclick="openContestWindow('{$photo.foto2}', '{$item.title_for_java}', '{$photo.title2}', '{$photo.comment2}', '{$j_prev}', '{$j_next}', '{$item.id}', '{$smarty.foreach.photos.index}');return false;" href="javascript:void(0);"><img src="/upload/publicat/{$photo.foto2}.jpg" alt="{$photo.title2}" title="{$photo.title2}" /></a>
	{else}
	<a id="aname{$item.id}_{$photo.id}_2" name="aname{$item.id}_{$photo.id}_2" href="javascript:void(0);"></a>
	{/if}
	</div></td>
	{/foreach}
	{section name=needmore start=1 loop=$item.needmore+1 step=1} 
	<td><div class='dowidth dowidth3'>&nbsp;</div></td>
	{/section}
</tr></table>
</div>	
{/foreach}
</div>
</div>
{$paginator->render()}