<br>
{if $frmMessage}<div class="alert alert-{$frmMessage[0]}">{$frmMessage[1]}</div>{/if}
<form class="form-horizontal" name="frm{$dbform.name}" id="frm{$dbform.name}" action="{$action}" method="post" onsubmit="return checkForm(this)" enctype="multipart/form-data">
    {foreach from=$items key=myId item=i}
	{if $i.type eq 'hidden'}<input type="hidden" name="{$i.name}" value="{$i.value}">{/if}
	{/foreach}  
	{foreach from=$items key=myId item=i}
	<div class="control-group">
		<label class="control-label" for="input{$i.name}">{$i.title}{if $i.not_empty}&nbsp;<span class="required">*</span>{/if}</label>
		<div class="controls">
			{if $i.type eq 'string'}
			<input type="text" title="{if $i.not_empty}{$i.title}{/if}" id="input{$i.name}" name="{$i.name}" value="{$i.value}" placeholder="{$i.title}">
			{elseif $i.type eq 'text'}
			<textarea rows="5" class="span8" title="{if $i.not_empty}{$i.title}{/if}" id="input{$i.name}" name="{$i.name}" />{$i.value}</textarea>
			{elseif $i.type eq 'checkbox'}
			<input type="checkbox" title="{if $i.not_empty}{$i.title}{/if}" id="input{$i.name}" name="{$i.name}" {if $i.value}checked{/if} />
			{elseif $i.type eq 'file'}
			<input type="file" title="{if $i.not_empty}{$i.title}{/if}" id="input{$i.name}" name="{$i.name}" />
			{elseif $i.type eq 'password'}
			<input type="password" id="input{$i.name}" placeholder="{$i.title}">
			{elseif $i.type eq 'select'}
			<select title="{if $i.not_empty}{$i.title}{/if}" id="input{$i.name}" name="{$i.name}"{$i.more}> 
			<option value="0">...</option>
			{foreach from=$i.select_values item=op}
			<option value="{$op.value}"{$op.sel}>{$op.name}</option>
			{/foreach}
			</select>
			{elseif $i.type eq 'enum'}
			<select title="{if $i.not_empty}{$i.title}{/if}" id="input{$i.name}" name="{$i.name}"{$i.more}> 
			<option value="0">...</option>
			{foreach from=$i.select_values item=op}
			<option value="{$op.value}"{$op.sel}>{$op.name}</option>
			{/foreach}
			</select>
			{/if}
		</div>
	</div>
	{if $i.is_check}
	<div class="control-group">
		<label class="control-label" for="input{$i.name}{$again_postfix}">{$i.title} еще раз</label>
		<div class="controls">
			<input type="{if $i.type eq 'password'}password{else}text{/if}" id="input{$i.name}{$again_postfix}" id="{$i.name}{$again_postfix}">
		</div>
	</div>
	{/if}
	{/foreach}  
	{if $dbform.is_defense}
	<div class="control-group">
		<label class="control-label" for="inputSecure">Введите цифры <span class="required">*</span></label>
		<div class="controls">
			<input type="text" id="inputSucure" title="Код безопасности" name="securecode">
			<div><img id="secure_image" src="/secureimage/?{$session_name}={$session_id}"> <a href="#" onclick="document.getElementById('secure_image').src='/secureimage/?rnd='+Math.random()+'&{$session_name}={$session_id}';return false"><img src="/bundles/public/img/reload.gif" alt="обновить код" /></a></div>
		</div>
	</div>
    {/if}
	<div class="control-group">
		<div class="controls">
			{if $dbform.not_empty}<label>Поля, отмеченные <span class="required">*</span> &ndash; обязательны для заполнения.</label>{/if}
			<input type="submit" class="btn btn-primary" value="{$dbform.submit_text}" />
		</div>
	</div>
</form>
