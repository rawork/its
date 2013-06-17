<?php

namespace Fuga\PublicBundle\Controller;

use Fuga\CommonBundle\Controller\PublicController;

class PublicatController extends PublicController {
	
	public function __construct() {
		parent::__construct('publicat');
	}
	
	public function indexAction() {
		$j = 0;
		$block = $this->get('util')->_getVar('block', true, 1);
		$paginator = $this->get('paginator');
		$paginator->paginate(
			$this->get('container')->getTable('publicat_publicat'),
			$this->get('container')->href($this->get('router')->getParam('node')).'?block=###',
			'parent_id=0',
			3,
			$block
		);
		$paginator->setTemplate('publicat');
		$items = $this->get('container')->getItems(
			'publicat_publicat', 
			'parent_id=0',
			null,
			$paginator->limit
		);
		$weeks = 0;
		$fotomas = array();
		foreach ($items as &$item) {
			$item['title_for_java'] = $this->getManager('Fuga:Public:Publicat')->dropcav(
					trim(stripslashes($item["title"]))." / ".trim(stripslashes($item["client"]))." / ".trim(stripslashes($item["doc_num"]))
			);
			$item['photos'] = $this->get('container')->getItems(
				'publicat_publicat', 
				'parent_id='.$item['id'],
				'id'	
			);
			foreach ($item['photos'] as &$photo) {
				$photo['title'] = $this->getManager('Fuga:Public:Publicat')->dropcav($photo['title']);
				$photo['title2'] = $this->getManager('Fuga:Public:Publicat')->dropcav($photo['title2']);
				$photo['comment'] = $this->getManager('Fuga:Public:Publicat')->dropcav($photo['comment']);
				$photo['comment2'] = $this->getManager('Fuga:Public:Publicat')->dropcav($photo['comment2']);
			}
			unset($photo);
			if (count($item['photos']) > $weeks) {
				$weeks = count($item['photos']);
			}
		}
		foreach ($items as &$item) {
			$item['needmore'] = $weeks - count($item['photos']);
		}
		unset($item);
		
		return $this->render('publicat/index.tpl', compact('items', 'paginator', 'weeks', 'fotomas', 'j'));
	}
	
}

