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
	
	public function updateAction() {
		global $PRJ_DIR;
		return 'ready';
		$content = '';
		$basepath = '/upload/publicat/';
		$basedir = $PRJ_DIR.'/upload/publicat/';
		$end_big = '_big.jpg';
		$end_small = '_small.jpg';
		$end_original = '.jpg';
		$items = $this->get('container')->getItems('publicat_publicat', '1=1');
		foreach ($items as $item) {
			if (!empty($item['foto1'])) {
				if (false === strpos($item['foto1'], 'upload')) {
					$file_original = $basedir.$item['foto1'].$end_original;
					$file_small = $basedir.$item['foto1'].$end_small;
					$file_big = $basedir.$item['foto1'].$end_big;
					if (!file_exists($file_small)) {
						$content .= $file_small.'<br>';
						rename($file_original,$file_small);
					}
					if (!file_exists($file_original)) {
						$content .= $file_big.'<br>';
						copy($file_big, $file_original);
					}
					$this->get('container')->updateItem('publicat_publicat',
						array('foto1' => $basepath.$item['foto1'].$end_original),
						array('id' => $item['id'])
					);
				}
			}
			if (!empty($item['foto2'])) {
				if (false === strpos($item['foto2'], 'upload')) {
					$file_original = $basedir.$item['foto2'].$end_original;
					$file_small = $basedir.$item['foto2'].$end_small;
					$file_big = $basedir.$item['foto2'].$end_big;
					if (!file_exists($file_small)) {
						$content .= $file_small.'<br>';
						rename($file_original,$file_small);
					}
					if (!file_exists($file_original)) {
						$content .= $file_big.'<br>';
						copy($file_big, $file_original);
					}
					$this->get('container')->updateItem('publicat_publicat',
						array('foto2' => $basepath.$item['foto2'].$end_original),
						array('id' => $item['id'])
					);
				}
			}
		}
		return $content.'ready';
	}
	
}

