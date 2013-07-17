<?php

namespace Fuga\Component\Storage;

class FileStorage implements StorageInterface {
	
	private $realpath;
	private $path;
	
	public function __construct() {
		global $PRJ_DIR, $UPLOAD_REF;
		$this->uploadpath = $UPLOAD_REF;
		$this->realpath = $PRJ_DIR;
		$this->path = '';
	}
	
	public function save($filename, $sourcePath) {
		$createFileName = $this->unique($this->createPath().$filename);
		if (is_uploaded_file($sourcePath)) {
			move_uploaded_file($sourcePath, $this->realPath($createFileName));
		} else {
			$this->copy($createFileName, $sourcePath);
		}
		chmod($this->realPath($createFileName), 0666);
		return $this->path($createFileName);
	}
	
	// TODO копирование файла какое то убогое
	public function copy($filename, $sourcePath) {
		copy($sourcePath, $this->realPath($filename));
		return $this->path($filename);
	}
	
	public function remove($filename) {
		if ($filename) {
			@unlink($this->realPath($filename));
		}
		return true;
	}
	
	public function exists($filename) {
		return file_exists($this->realPath($filename));
	}
	
	private function createPath() {
		$date = new \Datetime();
		$path = $this->uploadpath.$date->format('/Y/m/d/');
		@mkdir($this->realpath.$path, 0777, true);
		return $path;
	}
	
	public function realPath($filename){
		return $this->realpath.$filename;
	}
	
	public function path($filename){
		return $this->path.$filename;
	}
	
	public function size($filename, $precision = 2) {
		$bytes = '';
		$units = array('б', 'Кб', 'Мб', 'Гб', 'Тб');
		if ($this->exists($filename)) {
			$bytes = filesize($this->realPath($filename));
			$pow = floor(($bytes ? log($bytes) : 0) / log(1024));
			$pow = min($pow, count($units) - 1);
			$bytes /= pow(1024, $pow);
			$bytes = round($bytes, $precision) . '&nbsp;' . $units[$pow];
		}
		return $bytes;
	}

	private function unique($filename, $counter = null) {
		if (!$counter) {
			$filename = strtolower($this->translit($filename));
			if (!$filename) {
				throw new Exception('Пустое имя сохраняемого файла');
			}
		}	
		$pathParts = pathinfo($filename);
		$pathParts['filename'] .= $counter ? '_'.$counter : '';
		$filename = $pathParts['dirname'].DIRECTORY_SEPARATOR.$pathParts['filename'].(isset($pathParts['extension']) ? '.'.$pathParts['extension'] : '');

		return $this->exists($filename) ? $this->unique($filename, ++$counter) : $filename;
	}
	
	private function translit($str) {
		// Сначала заменяем "односимвольные" фонемы.
		$cirilica = array(
			"а", "б", "в", "г", "д", "е", "ё", "ж", "з", "и", 
			"й", "к", "л", "м", "н", "о", "п", "р", "с", "т", 
			"у", "ф", "х", "ц", "ч", "ш", "щ", "ъ", "ы", "ь", 
			"э", "ю", "я", "_", " ", ",", 
			"А", "Б", "В", "Г", "Д", "Е", "Ё", "Ж", "З", "И", 
			"Й", "К", "Л", "М", "Н", "О", "П", "Р", "С", "Т", 
			"У", "Ф", "Х", "Ц", "Ч", "Ш", "Щ", "Ъ", "Ы", 'Ь', 
			"Э", "Ю", "Я");
		$latinica = array(
			"a", "b", "v", "g", "d", "e", "e", "zh", "z", "i", 
			"y", "k", "l", "m", "n", "o", "p", "r", "s", "t", 
			"u", "f", "h", "ts", "ch", "sh", "shch", "-", "i", "-", 
			"e", "yu", "ya", "-", "-", "", 
			"A", "B", "V", "G", "D", "E", "E", "ZH", "Z", "I", 
			"Y", "K", "L", "M", "N", "O", "P", "R", "S", "T", 
			"U", "F", "H", "TS", "CH", "SH", "SHCH", "-", "I", "-",
			"E", "YU", "YA");
		
		return str_replace($cirilica, $latinica, $str);
	}
}

