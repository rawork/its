<div class="row-fluid">
	<div class="span6">
		<h2 class="orange">Бухгалтерские услуги</h2>
	</div>
	<div class="span6">
		<h2>Юридические услуги</h2>
	</div>
</div>
<div class="row-fluid">
	<div class="span12">
		<div class="row-fluid">
			<div class="span6 ">
				<div class="orange ramka-orange">
					<ul class="service-links">
						{foreach from=$accounting item=item}
						<li><a href="{raURL node=$item.node_id_name method=service params=$item.id}">{$item.name}</a></li>
						{/foreach}
						<li><a href="{raURL node=accounting}">Другие услуги</a></li>
					</ul>
					<div class="buttons"><input type="button" onclick="window.location = '{raURL node=calc}'" class="btn btn-warning btn-large" value="Расчитать стоимость услуг" /></div>
				</div>
			</div>
			<div class="span6">
				<div class="blue ramka">
					<ul class="service-links">
						{foreach from=$jure item=item}
						<li><a href="{raURL node=$item.node_id_name method=service params=$item.id}">{$item.name}</a></li>
						{/foreach}
						<li><a href="{raURL node=jure}">Другие услуги</a></li>
					</ul>
					<div class="buttons"><input type="button" onclick="window.location = '{raURL node=order}'" class="btn btn-primary btn-large" value="Заказать услугу" /></div>
				</div>
			</div>
		</div>
	</div>
</div>