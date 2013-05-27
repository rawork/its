<h3>Задать вопрос</h3>
{if $frmMessage}<div class="alert alert-{$frmMessage[0]}">{$frmMessage[1]}</div>{/if}
<form class="form-horizontal" id="frmfaq" method="post" onsubmit="return checkForm(this)">
	<div class="control-group">
		<label class="control-label" for="inputperson">Контактное лицо&nbsp;<span class="required">*</span></label>
		<div class="controls">
			<input type="text" title="Контактное лицо" id="inputperson" name="person" value="{$person}" placeholder="Контактное лицо">
		</div>
	</div>
	<div class="control-group">
		<label class="control-label" for="inputemail">Эл. почта&nbsp;<span class="required">*</span></label>
		<div class="controls">
			<input type="text" title="Эл. почта" id="inputemail" name="email" value="{$email}" placeholder="Эл. почта">
		</div>
	</div>
	<div class="control-group">
		<label class="control-label" for="inputquestion">Вопрос&nbsp;<span class="required">*</span></label>
		<div class="controls">
			<textarea rows="5" class="span8" title="Вопрос" id="inputquestion" name="question" />{$question}</textarea>
		</div>
	</div>
    <div class="control-group">
		<div class="controls">
			<label>Поля, отмеченные <span class="required">*</span> &ndash; обязательны для заполнения.</label>			
			<input type="submit" class="btn btn-primary" value="Отправить" />
		</div>
	</div>
</form>
<h3>Ответы</h3>
{foreach item=item from=$items}
<div class="faq">
	<div class="question"><strong>{$item.question}</strong> <span>{$item.person}, {$item.created|fdate:"d.m.Y"}</span></div>
	<blockquote class="answer">{$item.answer}</blockqute>
</div>
{/foreach}
<div>{$paginator->render()}</div>