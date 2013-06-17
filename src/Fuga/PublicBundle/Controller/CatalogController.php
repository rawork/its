<?php

namespace Fuga\PublicBundle\Controller;

use Fuga\CommonBundle\Controller\PublicController;

class CatalogController extends PublicController {
	
	public function __construct() {
		parent::__construct('catalog');
	}
	
	public function indexAction($params) {
		$is_cat = false;
		$is_product = false;
		$item = null;
		$cats = null;
		$products = null;
		if (isset($params[0])) {
			$node = $this->get('container')->getItem('catalog_category', 'id='.$params[0].' AND publish=1');
			if (!$node) {
				$node = $this->get('container')->getItem('catalog_product', 'id='.$params[0].' AND publish=1');
				if ($node) {
					$is_product = true;
				}
			} else {
				$is_cat = true;
			}
			if (!$node) {
				throw $this->createNotFoundException('Несуществующая страница');
			}
			$this->get('container')->setVar('title', $node['name']);
			$this->get('container')->setVar('h1', $node['name']);
			$cats = $this->get('container')->getItems('catalog_category', 'parent_id='.$params[0].' AND publish=1');
			$products = $this->get('container')->getItems('catalog_product', 'category_id='.$params[0].' AND publish=1');
		} else {
			$cats = $this->get('container')->getItems('catalog_category', 'parent_id=0 AND publish=1');
		}
		
		return $this->render('catalog/index.tpl', compact('cats', 'products', 'node', 'is_cat', 'is_product'));
	}
	
	public function productAction($params) {
		if (!isset($params[0])) {
			throw $this->createNotFoundException('Несуществующая страница');
		}
		$item = $this->get('container')->getItem('catalog_product', 'id='.$params[0].' AND publish=1');
		if (!$item) {
			throw $this->createNotFoundException('Несуществующая страница');
		}
		$this->get('container')->setVar('title', $item['name']);
		$this->get('container')->setVar('h1', $item['name']);
		
		return $this->render('catalog/product.tpl', compact('item', 'cat0', 'prices', 'fotos', 'articles'));
	}
	
	public function blocksAction() {
		$blocks = $this->get('container')->getItems('catalog_block', 'publish=1');
		foreach($blocks as &$block) {
			$block['items'] = $this->get('container')->getItems('catalog_elements', 'publish=1 AND block_id='.$block['id']);
		}
		unset($block);
		
		return $this->render('catalog/blocks.tpl', compact('blocks'));
	}
	
	public function leadersAction() {
		$items = $this->get('container')->getItems('catalog_product', 'publish=1 AND is_hit=1', null, '4');
		
		return $this->render('catalog/leaders.tpl', compact('items'));
	}
	
	public function offerAction() {
		$item = $this->get('container')->getItem('catalog_product', 'publish=1 AND is_offer=1');
		
		return $this->render('catalog/offer.tpl', compact('item'));
	}
	
	public function newAction() {
		$item = $this->get('container')->getItem('catalog_product', 'publish=1 AND is_new=1');
		
		return $this->render('catalog/new.tpl', compact('item'));
	}
	
	public function getMapList($id = 0) {
		$nodes = array();
		$items = $this->get('container')->getItems('catalog_category', "publish=1 AND parent_id=".$id);
		$block ='_sub';
		if (count($items) > 0) {
			foreach ($items as $node) {
				$node['ref'] = $this->get('container')->href('catalog', 'index', array($node['id']));
				$node['sub'] = $this->getMapList($node['id']);
				$nodes[] = $node;
			}
		}
		return $this->render('map.tpl', compact('nodes', 'block'));
	}
	
	public function mapAction() {
		
		return $this->getMapList();
	}
	
}

