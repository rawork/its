<?php

namespace Fuga\PublicBundle\Controller;

use Fuga\CommonBundle\Controller\PublicController;

class NewsController extends PublicController {
	
	public function __construct() {
		parent::__construct('news');
	}
	
	public function indexAction() {
//		$sql = 'SELECT n.nid as id, n.title as name, from_unixtime(n.created) as created, 
//			from_unixtime(n.changed) as updated, nr.body, nr.teaser as preview 
//			FROM term_node tn
//			JOIN node n ON n.nid=tn.nid
//			JOIN node_revisions nr ON n.nid=nr.nid
//			ORDER BY n.created desc LIMIT 4';
//		$stmt = $this->get('connection1')->prepare($sql);
//		$stmt->execute();
//		$items = $stmt->fetchAll();
//		foreach ($items as $news) {
//			echo "INSERT INTO news_news(id,name,node_id,preview,body,publish,created,updated) 
//				VALUES(".$news['id'].",'".$news['name']."',142,'".$news['preview']."','".$news['body']."',1,'".$news['created']."','".$news['updated']."');";
//		}
//		exit;
		
		$node = $this->getManager('Fuga:Common:Page')->getCurrentNode();
		$page = $this->get('util')->_getVar('page', true, 1);
		$paginator = $this->get('paginator');
		$paginator->paginate(
				$this->get('container')->getTable('news_news'),
				$this->get('container')->href($node['name']).'?page=###',
				'publish=1 AND node_id='.$node['id'],					 		  
				$this->getParam('per_page'),
				$page
		);
		$paginator->setTemplate('public');
		$items = $this->get('container')->getItems('news_news', 'publish=1 AND node_id='.$node['id'], null, $paginator->limit);
		foreach ($items as &$item) {
			$item['preview'] = $this->get('util')->cut_text($item['preview'], 400);
		}
		
		return $this->get('templating')->render('news/index.tpl', compact('items', 'paginator'));
	}
	
	public function lentaAction() {
		$items = $this->get('container')->getItems('news_news', 'publish=1', null, $this->getParam('per_lenta'));
		foreach ($items as &$item) {
			$item['preview'] = $this->get('util')->cut_text($item['preview'], 170);
		}
		
		return $this->get('templating')->render('news/lenta.tpl', compact('items'));
	}
	
	public function readAction($params) {
		if (!isset($params[0])) {
			throw $this->createNotFoundException('Несуществующая страница');
		}
		$node = $this->getManager('Fuga:Common:Page')->getCurrentNode();
		$news = $this->get('container')->getItem('news_news', 'id='.$params[0].' AND publish=1 AND node_id='.$node['id']);
		if (!$news) {
			throw $this->createNotFoundException('Несуществующая страница');
		}
		$this->get('container')->setVar('title', $news['name']);
		$this->get('container')->setVar('h1', $news['name']);
		
		return $this->get('templating')->render('news/read.tpl', compact('news'));
	}
}