<?php

namespace Fuga\PublicBundle\Controller;

use Fuga\CommonBundle\Controller\PublicController;

class ArticleController extends PublicController {
	
	public function __construct() {
		parent::__construct('article');
	}
	
	public function indexAction() {
		$node = $this->getManager('Fuga:Common:Page')->getCurrentNode();
		$page = $this->get('util')->_getVar('page', true, 1);
		$paginator = $this->get('paginator');
		$paginator->paginate(
			$this->get('container')->getTable('article_article'),
			$this->get('container')->href($this->get('router')->getParam('node')).'?page=###',
			"publish=1 AND node_id=".$node['id'],
			$this->getParam('per_page'),
			$page
		);
		$paginator->setTemplate('public');
		$items = $this->get('container')->getItems(
			'article_article', 
			"publish=1 AND node_id=".$node['id'],
			null,
			$paginator->limit
		);
		
		return $this->render('article/index.tpl', compact('items', 'paginator'));
	}
	
	public function readAction($params) {
		if (!isset($params[0])) {
			throw $this->createNotFoundException('Несуществующая страница');
		}
		$node = $this->getManager('Fuga:Common:Page')->getCurrentNode();
		$item = $this->get('container')->getItem('article_article', 'id='.$params[0].' AND publish=1 AND node_id='.$node['id']);
		if (!$item) {
			throw $this->createNotFoundException('Несуществующая страница');
		}
		$this->get('container')->setVar('title', $item['name']);
		$this->get('container')->setVar('h1', $item['name']);
		
		return $this->render('article/read.tpl', compact('item'));
	}
}