{if count($items)}
<h2>Новости</h2>
<div class="row-fluid">
	{foreach from=$items item=news}
	<div class="span4 news ramka">
		<div class="news-title"><a href="{raURL node=$news.node_id_name method=read prms=$news.id}">{$news.name}</a></div>
		<div class="news-date">{$news.created|fdate:"d.m.Y"}</div>
		<div class="news-text">{$news.preview}</div>
	</div>
	{/foreach}
</div>
<div class="pull-right news-all"><a href="{raURL node=news}">Все новости</a></div>	
{/if}