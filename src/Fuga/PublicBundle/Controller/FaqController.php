<?php

namespace Fuga\PublicBundle\Controller;

use Fuga\CommonBundle\Controller\PublicController;

class FaqController extends PublicController {
	
	public function __construct() {
		parent::__construct('faq');
	}
	
	public function indexAction() {
		if ($_SERVER['REQUEST_METHOD'] == 'POST') {
			$errors = array();
			$person = $this->get('util')->_postVar('person');
			$email = $this->get('util')->_postVar('email');
			$question = $this->get('util')->_postVar('question');
			if (empty($person)) {
				$errors[] = 'Не заполнено поле: Контактное лицо';
			}
			if (empty($email)) {
				$errors[] = 'Не заполнено поле:  Эл. почта';
			}
			if (empty($question)) {
				$errors[] = 'Не заполнено поле: Вопрос';
			}
			if ($errors) {
				$frmMessage = array('error', implode('<br>', $errors));
			} else {
				$this->get('container')->addItem('faq_faq', array(
					'person' => $person,
					'email' => $email,
					'question' => $question,
					'created' => date('Y-m-d H:i:s')
				));
				$fields = array(
					array('title' => 'Контактное лицо', 'value' => $person),
					array('title' => 'Эл. почта', 'value' => $email),
					array('title' => 'Вопрос', 'value' => $question),
				);
				$this->get('mailer')->send(
					'Вопрос-ответ на сайте '.$_SERVER['SERVER_NAME'],
					$this->get('templating')->render('form/mail.tpl', compact('fields')),
					$GLOBALS['ADMIN_EMAIL']
				);
				$_SESSION['flash_message'] = array('success', 'Ваш вопрос отправлен');
				header('location:'.$this->get('container')->href($this->get('router')->getParam('node')));
				exit;
			}
		}
		if ($frmMessage = $this->get('util')->_sessionVar('flash_message')) {
			unset($_SESSION['flash_message']);
		}
		$page = $this->get('util')->_getVar('page', true, 1);
		$paginator = $this->get('paginator');
		$paginator->paginate(
				$this->get('container')->getTable('faq_faq'),
				$this->get('container')->href($this->get('router')->getParam('node')).'?page=###',
				'publish=1',					 		  
				$this->getParam('per_page'),
				$page
		);
		$paginator->setTemplate('public');
		$items = $this->get('container')->getItems('faq_faq', 'publish=1', null, $paginator->limit);
		
		return $this->get('templating')->render('faq/index.tpl', compact('items', 'paginator', 'person', 'email', 'question', 'frmMessage'));
	}
	
	public function addAction() {
		$result['message'] = $this->render('cart/add.tpl', compact('product'));
		$result['widget'] = $this->widgetAction();
		
		return json_encode($result);
	}
	
}