<?php

/*
return [
];
*/

return [
	'bootstrap' => ['debug'],
	'modules' => [

		'debug' => [
			'class' => 'yii\debug\Module',
			'allowedIPs' => ['127.0.0.1', '::1', '192.168.1.*', '*.*.*.*'],
		],


		'gii' => [
			'class' => 'yii\gii\Module',
			'allowedIPs' => ['127.0.0.1', '::1', '192.168.1.*', '*.*.*.*'],
		],


	]
];
