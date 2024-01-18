<?php
function getRoute(){
    include 'config.php';
    $pf = getConfig()['general']['templatePath'];
    if (array_key_exists('page', $_GET)){
        $page = $_GET['page'];
    }else{
        $page ='main';
    }
 switch ($page){
     case 'main':
         return $pf . 'mainview' . DIRECTORY_SEPARATOR . 'main.php';
     case 'single':
        return $pf . 'singleview' . DIRECTORY_SEPARATOR . 'main.php';
     default:
         return $pf . 'mainview' . DIRECTORY_SEPARATOR . 'main.php';

 }
}