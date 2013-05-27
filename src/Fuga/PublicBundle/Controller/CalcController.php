<?php

namespace Fuga\PublicBundle\Controller;

use Fuga\CommonBundle\Controller\PublicController;

class CalcController extends PublicController {
	
	public function __construct() {
		parent::__construct('calc');
	}
	
	public function indexAction() {
		if ($_SERVER['REQUEST_METHOD'] == 'POST') {
			$errors = array();
			$person = $this->get('util')->_postVar('person');
			$email = $this->get('util')->_postVar('email');
			$phone = $this->get('util')->_postVar('phone');
			$company = $this->get('util')->_postVar('company');
			$activity = $this->get('util')->_postVar('activity');
			$filials = $this->get('util')->_postVar('filials');
			$fea = $this->get('util')->_postVar('export_import');
			$vat = $this->get('util')->_postVar('vat');
			$employee = $this->get('util')->_postVar('employee');
			$program = $this->get('util')->_postVar('program');
			$good_politic = $this->get('util')->_postVar('good_politic');
			$period = $this->get('util')->_postVar('period');
			$doc1 = $this->get('util')->_postVar('doc1');
			$doc2 = $this->get('util')->_postVar('doc2');
			$doc3 = $this->get('util')->_postVar('doc3');
			$doc4 = $this->get('util')->_postVar('doc4');
			$doc5 = $this->get('util')->_postVar('doc5');
			$doc6 = $this->get('util')->_postVar('doc6');
			$doc7 = $this->get('util')->_postVar('doc7');
			$doc8 = $this->get('util')->_postVar('doc8');
			$doc9 = $this->get('util')->_postVar('doc9');
			$doc10 = $this->get('util')->_postVar('doc10');
			$doc11 = $this->get('util')->_postVar('doc11');
			$doc12 = $this->get('util')->_postVar('doc12');
			$comment = $this->get('util')->_postVar('comment');
			$p = $this->get('util')->_postVar('');
			if (empty($person)) {
				$errors[] = 'Не заполнено поле: Контактное лицо';
			}
			if (empty($email)) {
				$errors[] = 'Не заполнено поле:  Эл. почта';
			}
			if ($errors) {
				$frmMessage = array('error', implode('<br>', $errors));
			} else {
				$fields = array(
					array('title' => 'Контактное лицо', 'value' => $person),
					array('title' => 'Эл. почта', 'value' => $email),
					array('title' => 'Телефон', 'value' => $phone),
					array('title' => 'Название компании', 'value' => $company),
					array('title' => 'Вид деятельности', 'value' => $activity),
					array('title' => 'Количество обособленных подразделений и филиалов', 'value' => $filials),
					array('title' => 'Внешнеэкономическая деятельность', 'value' => $fea),
					array('title' => 'Система налогообложения', 'value' => $vat),
					array('title' => 'Численность сотрудников', 'value' => $employee),
					array('title' => 'Ваша программа для ведения б/учета', 'value' => $program),
					array('title' => 'Вести учет товаров в разрезе наименований?', 'value' => $good_politic),
					array('title' => 'Расчетный период', 'value' => $period),
					array('title' => 'Платежных поручений по рублевым счетам (входящих и исходящих)', 'value' => $doc1),
					array('title' => 'Платежных поручений по валютным счетам (входящих и исходящих)', 'value' => $doc2),
					array('title' => 'Кассовые ордера (на приход и расход наличных д.с.)', 'value' => $doc3),
					array('title' => 'Накладные исходящие (реализация товаров)', 'value' => $doc4),
					array('title' => 'Акты выполненных работ (реализация услуг)', 'value' => $doc5),
					array('title' => 'Накладные входящие', 'value' => $doc6),
					array('title' => 'Количество позиций в накладных входящих (указать среднее количество строк)', 'value' => $doc7),
					array('title' => 'Акты выполненных работ входящие', 'value' => $doc8),
					array('title' => 'Авансовые отчеты (хоз. нужды)', 'value' => $doc9),
					array('title' => 'Командировки по России', 'value' => $doc10),
					array('title' => 'Командировки зарубежные', 'value' => $doc11),
					array('title' => 'Договора займа (кредита) процентные', 'value' => $doc12),
					array('title' => 'Прочая информация', 'value' => $comment),
				);
				$this->get('mailer')->send(
					'Расчет стоимости услуг на сайте '.$_SERVER['SERVER_NAME'],
					$this->get('templating')->render('form/mail.tpl', compact('fields')),
					$GLOBALS['ADMIN_EMAIL']
				);
				$_SESSION['flash_message'] = array('success', 'Данные расчета стоимости услуг отправлены');
				header('location:'.$this->get('container')->href($this->get('router')->getParam('node')));
				exit;
			}
		}
		$fea_types = array('нет', 'импорт', 'экспорт', 'импорт-экспорт');
		$vat_types = array('стандартная', 'упрощенная', 'ЕНВД', 'стандартная с ЕНВД', 'упрощенная с ЕНВД');
		$politic_types = array('да', 'нет', 'не определились');
		$period_types = array('месяц', 'квартал', 'год');
		if ($frmMessage = $this->get('util')->_sessionVar('flash_message')) {
			unset($_SESSION['flash_message']);
		}
		
		return $this->render('calc/index.tpl', compact('frmMessage', 'fea_types', 'vat_types', 'politic_types', 'period_types', 'person', 'email', 'phone', 'company', 'activity', 'fea', 'vat', 'employee', 'program', 'good_politic', 'doc1', 'doc2', 'doc3', 'doc4', 'doc5', 'doc6', 'doc7', 'doc8', 'doc9', 'doc10', 'doc11', 'doc12', 'comment'));
	}
	
	public function callformAction() {
		return $this->render('calc/callform.tpl');
	}
	
	public function callAction () {
		$person = $this->get('util')->_postVar('person');
		$phone = $this->get('util')->_postVar('phone');
		$fields = array(
			array('title' => 'Имя', 'value' => $person),
			array('title' => 'Телефон', 'value' => $phone),
		);
		$this->get('mailer')->send(
			'Заказ звонка на сайте '.$_SERVER['SERVER_NAME'],
			$this->get('templating')->render('form/mail.tpl', compact('fields')),
			$GLOBALS['ADMIN_EMAIL']
		);
		
		return json_encode(array('status' => true, 'message' => 'Менеджер перезвонит Вам в ближайшее время.<br><br>'));
	}
	
}