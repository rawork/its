{foreach from=$items item=news}
<div class="news-content">
	<div class="news-title-inner"><a href="{raURL node=$news.node_id_name method=read prms=$news.id}">{$news.name}</a></div>
	<div class="news-date">{$news.created|fdate:"d.m.Y"}</div>
	<div class="news-text">{$news.preview}</div>
</div>
{/foreach}
<div>{$paginator->render()}</div>