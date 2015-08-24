<?php

namespace Fuga\PublicBundle\Controller;

use Fuga\CommonBundle\Controller\PublicController;

class SertificateController extends PublicController {
	
	public function __construct() {
		parent::__construct('sertificate');
	}
	
	public function indexAction() {
		$items = $this->get('container')->getItems('sertificate_sertificate', 'publish=1');
		
		return $this->render('sertificate/index.tpl', compact('items'));
	}
	
	public function feedAction() {
		$items = $this->get('container')->getItems('sertificate_sertificate', 'publish=1');

		return $this->render('sertificate/feed.tpl', compact('items'));
	}
}