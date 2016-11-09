<ul class="feedback-list">
    {foreach from=$items item=item}
    <li>
        <a href="{$item.foto_medium}"><img src="{$item.foto_small}">
        <div class="title">{$item.name}</div></a>
    </li>
    {/foreach}
</ul>