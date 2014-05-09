{if count($items)}
<h2><span><a href="{raURL node=catalog method=index prms=639}">Ремонт и модернизация</a></span></h2>

<div class="repair-title">Модернизация токарного станка c ЧПУ модели 16А20Ф3</div>
<div class="repair-container">
    <div class="repair-foto"><img src="/bundles/public/img/repair.jpg"></div>
    <div class="repair-text-container">
        <div class="texts">
            <div class="text text1"><a href="http://pragati.ru/catalog/9" target="_blank">Револьверная головка<br> фирмы PRAGATI<br> (Индия)</a></div>
            <div class="text text2"><a href="http://tdsks.su/tools/cid128/" target="_blank">ЧПУ FMS-3000 фирмы<br> Модмаш-Софт (Россия)</a></div>
            <div class="text text3"><a href="http://tdsks.su/tools/cid128/" target="_blank">Привод подач и главного движения<br> фирмы YASKAWA<br> (Япония)</a></div>
            <div class="text text4"><a href="http://tdsks.su/tools/cid51/" target="_blank">Насос<br> циркуляционной<br> смазки фирмы<br> CAPRONI (Болгария)</a></div>
            <div class="text text5"><a href="http://tdsks.su/tools/cid22/" target="_blank">Кожух защитный<br> ШВП оси &laquo;Z&raquo;</a></div>
            <div class="text text6"><a href="http://tdsks.su/tools/cid16/" target="_blank">ШВП<br> фирмы KSK<br> (Чехия)</a></div>
            <div class="text text7"><a href="http://tdsks.su/tools/cid55/" target="_blank">Автоматическая<br> система<br> дозированной<br> смазки направляющих,<br> ШВП и подшипников<br> опор винтов продольной<br> и поперечной подач<br> (комплектующие<br> производства Италия)</a> </div>
        </div>
    </div>
</div>
<ul class="catalog-contents">
{foreach from=$items item=item}
<li>
<a href="{raURL node=catalog method=index prms=$item.id}" title="{$item.name}"><br>
<img src="{$item.image_small}" width="128" height="96" alt="{$item.name}" title="{$item.name}"><br>
{$item.name}</a>
</li>
{/foreach}
</ul>
<div class="clearfix"></div>
<br>
{/if}