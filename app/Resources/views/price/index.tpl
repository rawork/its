<ul class="price-list">
{foreach from=$items item=item}
	<li>&mdash; <a href="#price_{$item.id}">{$item.service_id_name}</a></li>
{/foreach}
</ul>
{foreach from=$items item=item}
<div class="price-item">
	<h3><a name="price_{$item.id}">{$item.service_id_name}</a></h3>
	<div>{$item.pricelist}</div>
</div>
{/foreach}