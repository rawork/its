<a href="#price" class="pull-right btn btn-large btn-primary">Запрос стоимости</a>
<div id="catImg">
	<a href="{$node.image_big}"><img src="{$node.image_medium}" width="380"></a>
</div>
<div>{$node.preview}</div>
<div><br>{if $node.description}{$node.description}{else}<p>Информация по этому виду товаров в настоящий момент готовится.</p>{/if}</div>
<div id="priceform" class="hidden alert alert-success"></div>
<form method="post">
	<fieldset>
	  <legend><a name="price">Запрос стоимости</a></legend>
	  <input type="hidden" name="product" value="{$node.id}">
	  <label>Контактное лицо <span class="form-required">*</span></label>
	  <input type="text" name="person" placeholder="Контактное лицо">
	  <label>Телефон <span class="form-required">*</span></label>
	  <input type="text" name="phone" placeholder="Например, +7 (999) 888-88-88">
	  <label>Эл. почта</label>
	  <input type="text" name="email" placeholder="Адрес электронной почты">
	  <label>Описание запроса</label>
	  <div><textarea name="comment"></textarea></div>
	  <input type="button" class="btn" value="Отправить" onclick="priceQuery()" />
	</fieldset>
</form>