{if count($items)}
<h2><span>Лидеры продаж</span></h2>
<ul class="catalog-product">
{foreach from=$items item=item}
<li>
<a href="{raURL node=catalog method=product prms=$item.id}" title="{$item.name}"><br>
<img src="{$item.foto_small}" width="128" height="96" alt="{$item.name}" title="{$item.name}"><br>
{$item.name}</a>
</li>
{/foreach}
</ul>
<div class="clearfix"></div>
<br>
{/if}
<div class="repair-title">Токарный обрабатывающий центр LSB200/1000S</div>
<br>
<div class="repair-container">
    <div class="repair-foto"><img src="/bundles/public/img/leader.jpg"></div>
    <div class="leader-text-container">
        <div class="texts">
            <div class="text text1"><a href="http://pragati.ru/catalog/10" target="_blank">Приводная <br>револьверная головка DDT-63 <br>PRAGATI /Индия/</a></div>
            <div class="text text2"><a href="http://tdsks.su/tools/21/" target="_blank">Задняя бабка <br>электромеханическая ЭМГ-51<br> /Россия/ </a></div>
            <div class="text text3"><a href="http://tdsks.su/tools/cid128/" target="_blank">ЧПУ FMS3300 <br> Модмаш-Софт /Россия/</a></div>
            <div class="text text4"><a href="http://tdsks.su/tools/cid28/" target="_blank">Коробка<br> 2-х скоростная<br> автоматическая<br> Baruffaldi<br> /Италия/</a></div>
            <div class="text text5"><a href="http://tdsks.su/tools/cid55/" target="_blank">Автоматическая система<br> дозированной смазки<br> направляющих<br> Ilcomatic MRT-200<br> /Италия/</a></div>
            <div class="text text6"><a href="http://tdsks.su/tools/cid16/" target="_blank">ШВП HIWIN<br> /Тайвань/</a></div>
            <div class="text text7"><a href="http://tdsks.su/tools/pid14/" target="_blank">Пневмооборудование<br> PNEUMAX<br> /Италия/</a> </div>
            <div class="text text8"><a href="http://tdsks.su/tools/cid55/" target="_blank">Привод подач<br> BRUSATORI<br> Модмаш-Софт<br> /Россия/</a> </div>
        </div>
    </div>
</div>
<br>