<div class="sertificate-container">
    <div class="slider-wrapper">
        <div class="jcarousel">
            <ul>
                {foreach from=$items item=item}
                <li><a href="/sertifikats"><img src="{$item.foto_small}"></a></li>
                {/foreach}
            </ul>
        </div>
        <a href="#" class="jcarousel-control-prev slider-prev slider-small"><i class="icon-chevron-left"></i></a>
        <a href="#" class="jcarousel-control-next slider-next slider-small"><i class="icon-chevron-right"></i></a>
    </div>
    <div><a class="btn btn-warning" href="/sertifikats">Подробнее</a></div>
</div>