<div class="map{$block}_links">
{foreach from=$nodes item=node}
<a href="{$node.ref}"><span>&gt;</span> {$node.title}</a>
{$node.sub}
{/foreach}
</div>