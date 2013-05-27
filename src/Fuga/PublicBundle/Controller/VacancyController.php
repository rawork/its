<?php

namespace Fuga\PublicBundle\Controller;

use Fuga\CommonBundle\Controller\PublicController;

class VacancyController extends PublicController {
	
	public function __construct() {
		parent::__construct('vacancy');
	}
	
	public function indexAction() {
		$items = $this->get('container')->getItems('vacancy_vacancy', 'publish=1');
		
		return $this->get('templating')->render('vacancy/index.tpl', compact('items'));
	}
	
}