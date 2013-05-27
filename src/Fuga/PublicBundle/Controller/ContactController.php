<?php

namespace Fuga\PublicBundle\Controller;

use Fuga\CommonBundle\Controller\PublicController;

class ContactController extends PublicController {
	
	public function __construct() {
		parent::__construct('contact');
	}
	
	public function indexAction() {
		$items = $this->get('container')->getItems('contact_address', 'publish=1');
		
		return $this->get('templating')->render('contact/index.tpl', compact('items'));
	}
	
}