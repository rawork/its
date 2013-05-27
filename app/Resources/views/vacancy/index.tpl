<ul class="vacancy-list">
	{foreach item=item from=$items}
	<li>&mdash; <a href="#vacancy_{$item.id}">{$item.name}</a></li>
	{/foreach}	
</ul>
{foreach item=item from=$items}
<div class="vacancy">
	<h3><a name="vacancy_{$item.id}">{$item.name}</a></h3>
	<p><strong>Описание:</strong></p>
	<p>{$item.description}</p>
	<p><strong>Требования:</strong></p>
	<p>{$item.requirements}</p>
	<p><strong>Условия:</strong></p>
	<p>{$item.conditions}</p>
</div>
{/foreach}	