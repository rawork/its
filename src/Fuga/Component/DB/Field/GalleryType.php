<?php

namespace Fuga\Component\DB\Field;

class GalleryType extends ImageType {
	public function __construct(&$params, $entity = null) {
		parent::__construct($params, $entity);
	}

	public function getStatic() {
		$content = array('<div class="admin-field-gallery" id="'.$this->getParam('name').'">');
		$sql = "SELECT * FROM system_files WHERE table_name= :table_name AND field_name= :field_name AND entity_id= :entity_id ORDER by created";
		$stmt = $this->get('connection1')->prepare($sql);
		$stmt->bindValue('table_name', $this->getParam('table_name'));
		$stmt->bindValue('field_name', $this->getParam('name'));
		$stmt->bindValue('entity_id', $this->dbId);
		$stmt->execute();
		$files = $stmt->fetchAll();
		$this->get('imagestorage')->setOptions(array('sizes' => $this->params['sizes']));
		foreach ($files as $file) {
			$add_files = $this->get('imagestorage')->additionalFiles($file['file']);
			if (isset($add_files['default'])) {
				$content[] = '<div id="file_'.$file['id'].'"><a target="_blank" href="'.$file['file'].'"><img width="50" src="'.$add_files['default']['path'].'"></a><a class="delete" href="javascript:gallerydelete('.$file['id'].')">&times;</a></div>';
			}
		}
		$content[] = '</div><div class="clearfix"></div>';
		
		return implode('', $content);
	}

	public function getSQLValue($inputName = '') {
		$this->get('imagestorage')->setOptions(array('sizes' => $this->params['sizes']));
		$inputName = $inputName ?: $this->getName();
//		var_dump($_FILES);
//		exit;
		if (!empty($_FILES[$inputName]) && !empty($_FILES[$inputName]['name'])) {
			foreach ($_FILES[$inputName]["name"] as $i => $file) {
				if (empty($_FILES[$inputName]['name'][$i])) {
					continue;
				}
				$filename = $this->get('imagestorage')->save($_FILES[$inputName]['name'][$i], $_FILES[$inputName]['tmp_name'][$i]);
				$name = $_FILES[$inputName]['name'][$i];
				$filesize = @filesize($this->get('imagestorage')->realPath($filename));
				$mimetype = $_FILES[$inputName]['type'][$i];
				$width = 0;
				$height = 0;
				if ($fileInfo = @GetImageSize($this->get('imagestorage')->realPath($filename))) {
					$width = $fileInfo[0];
					$height = $fileInfo[1];
				}
				$this->get('connection1')->insert('system_files', array(
					'name' => $name,
					'mimetype' => $mimetype,
					'file' => $filename,
					'width' => $width,
					'height' => $height,
					'filesize' => $filesize, 
					'table_name' => $this->getParam('table_name'),
					'field_name' => $this->getParam('name'),
					'entity_id' => $this->dbId,
					'created' => date('Y-m-d H:i:s')
				));
			}
		}
		return false;
	}
	
	public function getInput($value = '', $name = '', $class = '') {
		if ($this->dbId) {
			$name = $name ?: $this->getName();
			$content = $this->getStatic().'
<div id="'.$name.'_input"><input name="'.$name.'[]" type="file"></div>
<input class="btn btn-mini" onclick="addfilefield(\''.$name.'\')" value="Еще" type="button" />';

			return $content;
		} else {
			return 'Для наполнения галереи требуется сохранить элемент'; 
		}
	}

	public function free() {
		
	}

}
