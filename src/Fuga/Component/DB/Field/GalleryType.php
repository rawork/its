<?php

namespace Fuga\Component\DB\Field;

class GalleryType extends ImageType {
	public function __construct(&$params, $entity = null) {
		parent::__construct($params, $entity);
		if (!empty($this->params['sizes'])) {
			$this->params['sizes'] = 'default|50x50,'.$this->params['sizes'];
		} else {
			$this->params['sizes'] = '';
		}	
	}

	public function getStatic() {
		$content = array();
		$sql = "SELECT * FROM system_files WHERE table_name= :table_name AND field_name= :field_name AND entity_id= :entity_id ORDER by created";
		$stmt = $this->get('connection1')->prepare($sql);
		$stmt->bindValue('table_name', $this->getParam('table_name'));
		$stmt->bindValue('field_name', $this->getParam('name'));
		$stmt->bindValue('entity_id', $this->dbId);
		$stmt->execute();
		$files = $stmt->fetchAll();
		$this->get('imagestorage')->setOptions(array('sizes' => $this->params['sizes']));
		foreach ($files as $file) {
			$add_files = $this->get('imagestorage')->additionalFiles($file['name']);
			if (isset($add_files['default'])) {
				$content[] = '<div class="admin-field-gallery"><a target="_blank" href="'.$file['file'].'"><img width="50" src="'.$add_files['default']['path'].'"></a></div>';
			}
		}
		
		return implode('', $content);
	}

	public function getSQLValue($inputName = '') {
		return 0;
	}
	
	public function getInput($value = '', $name = '', $class = '') {
		$name = $name ? $name : $this->getName();
		if ($s = $this->getStatic()) {
			$r = rand(0, getrandmax());
			$s = $s.'&nbsp;<label for="'.$r.'"><input name="'.$name.'_delete" type="checkbox" id="'.$r.'"> удалить</label>';
		}
		return '<input type="hidden" name="'.$name.'_oldValue" value="'.$this->dbValue.'">'.$s.'<input type="file" name="'.$name.'">';
	}

	public function free() {
		$this->get('imagestorage')->remove($this->dbValue);
	}

}
