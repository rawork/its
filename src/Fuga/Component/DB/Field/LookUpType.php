<?php

namespace Fuga\Component\DB\Field;

class LookUpType extends Type {
	public function __construct(&$params, $entity = null) {
		parent::__construct($params, $entity);
	}

	public function getSearchSQL() {
		if ($value = $this->getSearchValue()) {
			return $this->getName().'='.$value;
		} else {
			return '';
		}
	}

	public function getSQL() {
		return $this->getName().' int(11) NOT NULL default 0';
	}

	public function getValue($name = '') {
		$name = $name ? $name : $this->getName();
		$value = isset($_REQUEST[$name]) ? intval($_REQUEST[$name]) : 0;
		return $value;
	}

}
