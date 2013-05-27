<?php

namespace Fuga\Component\DB\Field;

class TextType extends Type {
	public function __construct(&$params, $entity = null) {
		parent::__construct($params, $entity);
	}

	public function getStatic() {
		return $this->get('util')->cut_text(parent::getStatic());
	}

	public function getSearchInput() {
		return $this->getInput($this->getSearchValue(), $this->getSearchName(), true);
	}

	public function getInput($value = '', $name = '', $search = false) {
		$ret = '';
		if ($search){
			$ret = '<input type="text" id="'.$name.'" name="'.$name.'" value="'.htmlspecialchars($value).'">';
		} else {
			$value = $value ? $value : $this->dbValue;
			$name = $name ? $name : $this->getName();
			$ret = '<textarea id="'.$name.'" name="'.$name.'" style="width:95%;height:150px" rows="3" cols="40">'.htmlspecialchars($value).'</textarea>';
		}
		return $ret;
	}

	public function getSQLValue($name = '') {
		return addslashes($this->getValue());

	}
}
