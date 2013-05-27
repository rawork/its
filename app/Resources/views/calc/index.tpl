<h3>О заказчике</h3>
{if $frmMessage}<div class="alert alert-{$frmMessage[0]}">{$frmMessage[1]}</div>{/if}
<form class="form-horizontal" method="post" onsubmit="return checkForm(this)">
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
		<label class="control-label" for="inputphone">Телефон</label>
		<div class="controls">
			<input type="text" id="inputphone" name="phone" value="{$phone}" placeholder="Телефон">
		</div>
	</div>	
    <div class="control-group">
		<div class="controls">
			<label>Поля, отмеченные <span class="required">*</span> &ndash; обязательны для заполнения.</label>			
			<input type="submit" class="btn btn-warning btn-large" value="Заказать расчет" /> &nbsp;&nbsp;или <a id="toggle" class="ajax" href="javascript:toggleBlockByLink('toggle', 'calc_extra', 'уточнить детали расчета', 'скрыть детали расчета')">уточнить детали расчета</a>
		</div>
	</div>
<div class="closed" id="calc_extra">		
<h3>О компании</h3>
<div class="container-fluid">
	<div class="row-fluid">
		<div class="span6">
			<div class="control-group">
				<label class="control-label" for="inputcompany">Название</label>
				<div class="controls">
					<input type="text" id="inputcompany" name="company" value="{$company}">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="inputactivity">Вид деятельности</label>
				<div class="controls">
					<input type="text" id="inputactivity" name="activity" value="{$activity}">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="inputfilials">Количество обособленных подразделений и филиалов</label>
				<div class="controls">
					<input type="text" id="inputfilials" name="filials" value="{$filials}">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="inputfea">Внешнеэкономическая деятельность</label>
				<div class="controls">
					<select id="inputexport_import" name="fea">
						{foreach from=$fea_types item=item}
						<option value="{$item}"{if $item eq $fea} selected{/if}>{$item}</option>{/foreach}
					</select>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="inputvat">Система налогообложения</label>
				<div class="controls">
					<select id="inputvat" name="vat">
						{foreach from=$vat_types item=item}
						<option value="{$item}"{if $item eq $vat} selected{/if}>{$item}</option>{/foreach}
					</select>
				</div>
			</div>
		</div>
		<div class="span6">
			<div class="control-group">
				<label class="control-label" for="inputemployee">Численность сотрудников</label>
				<div class="controls">
					<input type="text" id="inputemployee" name="employee" value="{$employee}">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="inputprogram">Ваша программа для ведения б/учета</label>
				<div class="controls">
					<input type="text" id="inputprogram" name="program" value="{$program}">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="inputgoods">Вести учет товаров в разрезе наименований?</label>
				<div class="controls">
					<select type="text" id="inputgoods" name="good_politic">
						{foreach from=$politic_types item=item}
						<option value="{$item}"{if $item eq $good_politic} selected{/if}>{$item}</option>{/foreach}
					</select>
				</div>
			</div>
		</div>
	</div>
</div>
<h3>О документообороте</h3>
<div class="container-fluid">
	<div class="row-fluid">
		<div class="span6">
			<div class="control-group">
				<label class="control-label-wide" for="inputperiod">Расчетный период</label>
				<div class="controls-narrow">
					<select type="text" class="span12" id="inputperiod" name="period">
						{foreach from=$period_types item=item}
						<option value="{$item}"{if $item eq $period} selected{/if}>{$item}</option>{/foreach}
					</select>
				</div>
			</div>
		</div>
	</div>	
	<div class="row-fluid">
		<div class="span6">
			<div class="control-group">
				<label class="control-label-wide" for="inputdoc1">Платежных поручений по рублевым счетам (входящих и исходящих):</label>
				<div class="controls-narrow">
					<input type="text" class="span12" id="inputdoc1" name="doc1" value="{$doc1}">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label-wide" for="inputdoc2">Платежных поручений по валютным счетам (входящих и исходящих):</label>
				<div class="controls-narrow">
					<input type="text" class="span12" id="inputdoc2" name="doc2" value="{$doc2}">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label-wide" for="inputdoc3">Кассовые ордера (на приход и расход наличных д.с.): </label>
				<div class="controls-narrow">
					<input type="text" class="span12" id="inputdoc3" name="doc3" value="{$doc3}">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label-wide" for="inputdoc4">Накладные исходящие (реализация товаров):</label>
				<div class="controls-narrow">
					<input type="text" class="span12" id="inputdoc4" name="doc4" value="{$doc4}">
				</div>
			</div>	
			<div class="control-group">
				<label class="control-label-wide" for="inputdoc5">Акты выполненных работ (реализация услуг):</label>
				<div class="controls-narrow">
					<input type="text" class="span12" id="inputdoc5" name="doc5" value="{$doc5}">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label-wide" for="inputdoc6">Накладные входящие:</label>
				<div class="controls-narrow">
					<input type="text" class="span12" id="inputdoc6" name="doc6" value="{$doc6}">
				</div>
			</div>		
		</div>
		<div class="span6">
			<div class="control-group">
				<label class="control-label-wide" for="inputdoc7">Количество позиций в накладных входящих (указать среднее количество строк):</label>
				<div class="controls-narrow">
					<input type="text" class="span12" id="inputdoc7" name="doc7" value="{$doc7}">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label-wide" for="inputdoc8">Акты выполненных работ входящие:</label>
				<div class="controls-narrow">
					<input type="text" class="span12" id="inputdoc8" name="doc8" value="{$doc8}">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label-wide" for="inputdoc9">Авансовые отчеты (хоз. нужды):
</label>
				<div class="controls-narrow">
					<input type="text" class="span12" id="inputdoc9" name="doc9" value="{$doc9}">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label-wide" for="inputdoc10">Командировки по России:</label>
				<div class="controls-narrow">
					<input type="text" class="span12" id="inputdoc10" name="doc10" value="{$doc10}">
				</div>
			</div>	
			<div class="control-group">
				<label class="control-label-wide" for="inputdoc11">Командировки зарубежные:</label>
				<div class="controls-narrow">
					<input type="text" class="span12" id="inputdoc11" name="doc11" value="{$doc11}">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label-wide" for="inputdoc12">Договора займа (кредита) процентные:</label>
				<div class="controls-narrow">
					<input type="text" class="span12" id="inputdoc12" name="doc12" value="{$doc12}">
				</div>
			</div>
		</div>
	</div>
	<div class="row-fluid">
		<div class="span12">
			<div class="control-group">
				<label class="control-label-wide" for="inputcomment">Прочая информация о не перечисленных выше операциях компании:</label>
				<div class="controls-narrow">
					<textarea rows="5" class="span12" id="inputcomment" name="comment">{$comment}</textarea>
				</div>
			</div>	
			<div class="control-group">
				<div class="controls-narrow">
					<input type="submit" class="btn btn-warning btn-large" value="Заказать расчет" />
				</div>
			</div>
		</div>
	</div>
</div>
</div>
</form>