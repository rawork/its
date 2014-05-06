<form method="post">
<div class="configurator-container">
    <div class="feed-title">Выберите модель станка</div>
    <div class="feed">
    {foreach from=$machines item=item}
    <a{if $machine.id == $item.id} class="active"{/if} href="{$item.foto_medium}"
        data-id="{$item.id}" title="{$item.name}"><img src="{$item.foto_small}" alt="{$item.name}"><br>{$item.name}</a>
    {/foreach}

    </div>
    <div class="configurator-title">{$machine.name}</div>
    <div class="update hidden">Подождите, обновляются допустимые параметры конфигурации...</div>
    <div class="detail">
        <div class="group cnc">
            <div class="title">Система ЧПУ</div>
            {foreach from=$cnc item=item}
            <div class="radio"><input type="radio" name="cnc" value="{$item.name}"> {$item.name}</div>
            {/foreach}
        </div>
        <div class="group drive">
            <div class="title">Привод</div>
            {foreach from=$drives item=item}
            <div class="radio"><input type="radio" name="drive" value="{$item.name}"> {$item.name}</div>
            {/foreach}
        </div>
        <div class="group chuck">
            <div class="title">Токарный патрон</div>
            {foreach from=$chucks item=item}
            <div class="radio"><input type="radio" name="chuck" value="{$item.name}"> {$item.name}</div>
            {/foreach}
        </div>
        <div class="group other">
            <div class="title">Оборудование</div>
            {foreach from=$other item=item}
            <div class="checkbox"><input type="checkbox" name="other" value="{$item.name}"> {$item.name}</div>
            {/foreach}
        </div>
        <div class="group">
            <div class="title">Контактное лицо <span class="form-required">*</span></div>
            <div><input type="text" name="fio"></div>
        </div>
        <div class="group">
            <div class="title">Телефон <span class="form-required">*</span></div>
            <div><input type="text" name="phone"></div>
        </div>
        <div class="group">
            <div class="title">E-mail</div>
            <div><input type="text" name="email"></div>
        </div>
        <div><input id="send" class="btn btn-large btn-warning" type="button" value="Запросить стоимость комплектации" /></div>
    </div>
</div>
</form>