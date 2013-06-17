{if count($items)}
<h2><span>Новости</span></h2>
<div class="row-fluid content-block">
{foreach from=$items item=news}
	<div class="span4 news-lenta">
		<p class="date">{$news.created|fdate:"d.m.Y"}</p>
		<p class="title"><a href="{raURL node=$news.node_id_name method=read prms=$news.id}">{$news.name}</a></p>
		{$news.preview}
	</div>
{/foreach}	
</div>
{/if}