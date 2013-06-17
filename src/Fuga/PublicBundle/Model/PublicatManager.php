<?php

namespace Fuga\PublicBundle\Model;

use Fuga\CommonBundle\Model\ModelManager;

class PublicatManager extends ModelManager {
	
	public function dropcav($drop) {
		$wwq = array("'", '"',  ";", ",", ":", "/", "\\", "=", ")", "(", "%", "*", "?", ".");
		
		return str_replace($wwq, "", addslashes($drop)); 
	}
	
}