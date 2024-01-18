<?php

function getConfig(){
    //$pf = '.'. DIRECTORY_SEPARATOR . 'parts' . DIRECTORY_SEPARATOR;
    $pf = dirname(__DIR__) . DIRECTORY_SEPARATOR . 'parts' . DIRECTORY_SEPARATOR;
    $config = [
        'general' => [
            'templatePath' => $pf
        ],
        'pages' => [
          'main' =>   [
                'titel' => 'Herrlich Willkommen auf meinem Blog',
              'template' => ''
          ],
            'single' => [
                'titel' => 'Ein Einzelatikel',
                'template' => ''
            ],
        ],
    ];
    return $config;
}
