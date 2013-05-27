<?php

namespace Fuga\PublicBundle\Controller;

use Fuga\CommonBundle\Controller\PublicController;

class ServiceController extends PublicController {
	
	public function __construct() {
		parent::__construct('news');
	}
	
	public function indexAction() {
		$node = $this->getManager('Fuga:Common:Page')->getCurrentNode();
		$items = $this->get('container')->getItems('service_service', 'publish=1 AND node_id='.$node['id']);
		
		return $this->get('templating')->render('service/index.tpl', compact('items'));
	}
	
	public function serviceAction($params) {
		$node = $this->getManager('Fuga:Common:Page')->getCurrentNode();
		if (!isset($params[0])) {
			throw $this->createNotFoundException('Несуществующая страница');
		}
		$item = $this->get('container')->getItem('service_service', 'id='.$params[0].' AND publish=1 AND node_id='.$node['id']);
		if (!$item) {
			throw $this->createNotFoundException('Несуществующая страница');
		}
		$item['price'] = $this->get('container')->getItem('price_price', 'publish=1 AND service_id='.$item['id']);
		$this->get('container')->setVar('title', $item['name']);
		$this->get('container')->setVar('h1', $item['name']);
		
		return $this->get('templating')->render('service/service.tpl', compact('item'));
	}
	
	public function linksAction($params) {
		$accounting = $this->get('container')->getItems('service_service', 'publish=1 AND node_id=145');
		$jure = $this->get('container')->getItems('service_service', 'publish=1 AND node_id=146');
		
		return $this->get('templating')->render('service/links.tpl', compact('accounting', 'jure'));
	}
}