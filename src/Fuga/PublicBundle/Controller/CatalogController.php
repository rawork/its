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
				throw $this->createNotFoundException('Несуществующая страница');
			} else {
				$is_cat = true;
			}
			$this->get('container')->setVar('title', $node['name']);
			$this->get('container')->setVar('h1', $node['name']);
			$cats = $this->get('container')->getItems('catalog_category', 'parent_id='.$params[0].' AND publish=1');
			$products = $this->get('container')->getItems('catalog_product', 'category_id='.$params[0].' AND publish=1');
		} else {
			$cats = $this->get('container')->getItems('catalog_category', 'parent_id=0 AND publish=1');
			foreach ($cats as &$cat) {
				$cat['children'] = $this->get('container')->getItems('catalog_category', 'parent_id='.$cat['id'].' AND publish=1');
			}
			unset($cat);
		}
		
		return $this->render('catalog/index.tpl', compact('cats', 'products', 'node', 'is_cat', 'is_product'));
	}
	
	public function productAction($params) {
		if (!isset($params[0])) {
			throw $this->createNotFoundException('Несуществующая страница');
		}
		$node = $this->get('container')->getItem('catalog_product', 'id='.$params[0].' AND publish=1');
		if (!$node) {
			throw $this->createNotFoundException('Несуществующая страница');
		}
		$this->get('container')->setVar('title', $node['name']);
		$this->get('container')->setVar('h1', $node['name']);
		
		return $this->render('catalog/product.tpl', compact('node'));
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
	
	public function priceAction() {
		$id = $this->get('util')->_postVar('product');
		$person = $this->get('util')->_postVar('person');
		$phone = $this->get('util')->_postVar('phone');
		$email = $this->get('util')->_postVar('email');
		$comment = $this->get('util')->_postVar('comment');
		$node = $this->get('container')->getItem('catalog_product', $id);
		if (!$node) {
			$node = $this->get('container')->getItem('catalog_category', $id);
		}
		$name = isset($node['name']) ? $node['name'] : 'Товар не определен';
		$letterText = "
			Пользователь $person с электронной почтой $email, телефон $phone запросил стоимость товара.\n\n
			Запрошен товар $name (ID=$id)\n
			Описание запроса: $comment
		";
		$this->get('mailer')->send(
			'Ивтехсервис - запрос стоимости продукции от '.date('d.m.Y H:i'),
			nl2br($letterText),
			array($GLOBALS['ADMIN_EMAIL'], 'rawork@yandex.ru')
		);
		return json_encode(array('content' => 'Ваша заявка принята. Мы будем рады помочь Вам.'));
	}
	
	public function feedbackAction() {
		$titles = array(
			1 => 'Обращение с жалобой',
			2 => 'Обращение с благодарностью',
			3 => 'Обратная связь',
		);
		$type = $this->get('util')->_postVar('type');
		$person = $this->get('util')->_postVar('person');
		$phone = $this->get('util')->_postVar('phone');
		$email = $this->get('util')->_postVar('email');
		$comment = $this->get('util')->_postVar('comment');
		$letterText = "
			Пользователь $person с электронной почтой $email, телефон $phone оставил сообщение.\n\n
			$comment
		";
		$this->get('mailer')->send(
			'Ивтехсервис - '.$titles[$type].' '.date('d.m.Y H:i'),
			nl2br($letterText),
			array($GLOBALS['ADMIN_EMAIL'], 'rawork@yandex.ru')
		);
		return json_encode(array('content' => 'Ваше обращение отправлено менеджерам. Мы будем рады помочь Вам.'));
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

