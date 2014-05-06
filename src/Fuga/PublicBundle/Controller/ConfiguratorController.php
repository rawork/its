<?php
/**
 * Created by PhpStorm.
 * User: roman
 * Date: 04.05.14
 * Time: 12:07
 */

namespace Fuga\PublicBundle\Controller;

use Fuga\CommonBundle\Controller\PublicController;

class ConfiguratorController extends PublicController
{
	public function __construct()
	{
		parent::__construct('configurator');
	}

	public function indexAction()
	{
		$machines = $this->get('container')->getItems('configurator_machine', 'publish=1');

		$machine = array_shift($machines);
		array_unshift($machines, $machine);

		$cnc = $this->get('container')->getItems('configurator_cnc', 'publish=1 AND FIND_IN_SET('.$machine['id'].', machine)');
		$drives = $this->get('container')->getItems('configurator_drive', 'publish=1 AND FIND_IN_SET('.$machine['id'].', machine)');
		$chucks = $this->get('container')->getItems('configurator_chuck', 'publish=1 AND FIND_IN_SET('.$machine['id'].', machine)');
		$other = $this->get('container')->getItems('configurator_other', 'publish=1 AND FIND_IN_SET('.$machine['id'].', machine)');

		$this->get('container')->setVar('title', 'Конфигуратор токарного станка');
		$this->get('container')->setVar('h1', 'Конфигуратор токарного станка');


		return $this->render('configurator/index.tpl', compact('machines', 'machine', 'cnc', 'drives', 'chucks', 'other'));
	}

	public function detailAction()
	{
		$id = $this->get('util')->_postVar('id');

		$cnc = $this->get('container')->getItems('configurator_cnc', 'publish=1 AND FIND_IN_SET('.$id.', machine)');
		$drives = $this->get('container')->getItems('configurator_drive', 'publish=1 AND FIND_IN_SET('.$id.', machine)');
		$chucks = $this->get('container')->getItems('configurator_chuck', 'publish=1 AND FIND_IN_SET('.$id.', machine)');
		$other = $this->get('container')->getItems('configurator_other', 'publish=1 AND FIND_IN_SET('.$id.', machine)');

		return json_encode(array(
			'ok' => true,
			'cnc' => $cnc,
			'drive' => $drives,
			'chuck' => $chucks,
			'other' => $other,
		));
	}

	public function orderAction()
	{
		$person = $this->get('util')->_postVar('fio');
		$phone = $this->get('util')->_postVar('phone');
		$email = $this->get('util')->_postVar('email');
		$machine = $this->get('util')->_postVar('machine');
		$cnc = $this->get('util')->_postVar('cnc');
		$drive = $this->get('util')->_postVar('drive');
		$chuck = $this->get('util')->_postVar('chuck');
		$other = $this->get('util')->_postVar('other');

		$other = implode(', ', $other);

		$letterText = "
			Пользователь $person с электронной почтой $email, телефон $phone запросил стоимость конфигурации станка.\n\n
			$machine\n
			Система ЧПУ: $cnc\n
			Привод: $drive\n
			Токарный патрон: $chuck\n
			Доп. оборудование: $other\n
		";
		$this->get('mailer')->send(
			'Ивтехсервис - Запрос стоимости конфигурации станка '.date('d.m.Y H:i'),
			nl2br($letterText),
			array($GLOBALS['ADMIN_EMAIL'], 'rawork@yandex.ru')
		);

		return json_encode(array(
			'content' => 'Ваше обращение отправлено менеджерам. Мы будем рады помочь Вам.',
		));
	}
} 