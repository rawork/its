<?php

namespace Fuga\PublicBundle\Controller;

use Fuga\CommonBundle\Controller\PublicController;

class PriceController extends PublicController {
	
	public function __construct() {
		parent::__construct('news');
	}
	
	public function indexAction() {
		$items = $this->get('container')->getItems('price_price', 'publish=1');
		
		return $this->get('templating')->render('price/index.tpl', compact('items'));
	}
	
}