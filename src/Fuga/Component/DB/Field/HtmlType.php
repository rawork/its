<?php

namespace Fuga\Component\DB\Field;

class HtmlType extends Type {
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
		if ($search){
			return '<input type="text" id="'.($name ? $name : $this->getName()).'" name="'.($name ? $name : $this->getName()).'" style="width:100%" value="'.htmlspecialchars($value).'">';
		}
		$value = !$value ? $this->dbValue : $value;
		$name = !$name ? $this->getName() : $name;
		$r_ = rand(0, getrandmax());
		$field = '<input type="checkbox" id="'.$r_.'" checked onClick="controlEditor(this, \''.$name.'\')"><label for="'.$r_.'" style="position:relative; top:-2px;">Редактор</label>';
		$field .= '<textarea class="mceEditor" id="'.$name.'" name="'.$name.'" rows="3" cols="40" style="width:95%;height:300px">
'.htmlspecialchars($value).'</textarea>';
		return $field;
	}

	public function getSQLValue($name = '') {
	global $PCRE_RES_REF;
		$text = $this->getValue($name);
		if (preg_match_all('/href="'.$PCRE_RES_REF.'\/[\S]*\.(jpg|gif|png)+"/', $text, $matches)){
			foreach ($matches[0] as $m){
				$tmp = substr($m, 6, strlen($m)-7);
				$width = 50;
				$height = 50;
				if (file_exists($_SERVER['DOCUMENT_ROOT'].$tmp)){
					$size = getImagesize($_SERVER['DOCUMENT_ROOT'].$tmp);
					$width = $size[0];
					$height = $size[1];					
				}
				$text = str_replace($m, 'href="#" onClick="newWin(\''.$tmp.'\','.$width.','.$height.'); return false;"',$text);
			}
		}
		if (preg_match_all('/href="'.$PCRE_RES_REF.'\/[\S]*\.(html)"/', $text, $matches)){
			preg_replace('/onclick=".+; return false;"/', '', $text);
			foreach ($matches[0] as $m){
				$tmp = substr($m, 6, strlen($m)-7);
				$width = 640;
				$height = 480;
				$text = str_replace($m, 'href="#" onClick="newWinHtml(\''.$tmp.'\','.$width.','.$height.'); return false;"',$text);
			}
		}
		return str_replace('&amp;', '&', $text);
	}
}
