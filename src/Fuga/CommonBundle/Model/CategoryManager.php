<?php

namespace Fuga\CommonBundle\Model;

class CategoryManager extends ModelManager {
	
	public function getPathNodes($id = 0){
		$node = $this->get('container')->getItem('catalog_product', $id);
		if ($node) {
			$nodes = $this->get('container')->getTable('catalog_category')->getPrev($node['category_id']);
			$nodes[] = $node;
		} else {
			$nodes = $this->get('container')->getTable('catalog_category')->getPrev($id);
		}
		foreach ($nodes as &$node) {
			$node['title'] = $node['name'];
			$node['ref'] = $this->get('container')->href($this->get('router')->getParam('node'), 'index', array($node['id']));
		}
		
		return $nodes;
	}
	
}