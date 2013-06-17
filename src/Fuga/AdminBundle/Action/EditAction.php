<?php

namespace Fuga\AdminBundle\Action;
	
class EditAction extends Action {

	public $item;

	function __construct(&$adminController) {
		parent::__construct($adminController);
		$this->item = $this->dataTable->getItem($this->get('router')->getParam('id')); 
	}

	function getForm() {
		if ($this->get('util')->_postVar('id')) {
			if ($this->get('util')->_postVar('utype')) {
				$path = $_SERVER['HTTP_REFERER'];
				$_SESSION['message'] = ($this->dataTable->updateGlobals() ? 'Обновлено' : 'Ошибка обновления');
				header('location: '.$path);	
			} else {
				$this->messageAction($this->dataTable->updateGlobals() ? 'Обновлено' : 'Ошибка обновления');
			}
		}
		$ret = '';
		$entity = $this->item;
		if (count($entity)) {
			$svalues = explode(';', 'Строка|string;Текст|text;Булево|checkbox;Файл|file;Выбор|select');
			foreach ($svalues as $valueItem) {
				$types[] = explode('|', $valueItem);
			}
			$params = array(
				'entity' => $entity,
				'types' => $types
			);
			$template = 'admin/components/'.$this->get('router')->getParam('module').'.'.$this->get('router')->getParam('table').'.tpl';
			if ($text = $this->render($template, $params, true)) {
				return $ret.$text;
			} else {
				$ret .= '<form enctype="multipart/form-data" method="post" name="frmInsert" id="frmInsert" action="'.$this->fullRef.'/edit">';
				$ret .= '<input type="hidden" name="id" value="'.$entity['id'].'">';
				$ret .= '<input type="hidden" id="utype" name="utype" value="0">';
				$ret .= '<table class="table table-condensed">';
				$ret .= '<thead><tr>';
				$ret .= '<th>Редактирование</th>';
				$ret .= '<th>Запись: '.$entity['id'].'</th></tr></thead>';
				foreach ($this->dataTable->fields as $k => $v) {
					$ft = $this->dataTable->createFieldType($v, $entity);
					$ret .= '<tr><td align="left" width=150><strong>'.$v['title'].'</strong>'.$this->getHelpLink($v).$this->getTemplateName($v).'</td><td>';
					$ret .= !empty($v['readonly']) ? $ft->getStatic() : $ft->getInput();
					$ret .= '</td></tr>';
				}
				$ret .= '</table>
<input type="button" class="btn btn-success" onClick="preSubmit(\'frmInsert\', 0)" value="Сохранить">
<input type="button" class="btn" onClick="preSubmit(\'frmInsert\', 1)" value="Применить">
<input type="button" class="btn" onClick="window.location = \''.$this->fullRef.'\'" value="Отменить"></form>';
			}
		}
		return $ret;
	}

	function getText() {
		$links = array(
			array(
				'ref' => $this->fullRef,
				'name' => 'Список элементов'
			)
		);
		$content = $this->getOperationsBar($links);
		$content .= $this->getForm();
		return $content;
	}
}

