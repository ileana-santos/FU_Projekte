<?php
$pf = '.'. DIRECTORY_SEPARATOR . 'parts' . DIRECTORY_SEPARATOR; //Creat a variable with the path
include $pf .'_header.php';
include $pf . '_navegation.php';
include $pf . '_pagehead.php';

include $pf . 'mainview' . DIRECTORY_SEPARATOR . 'main.php';

include $pf . '_footer.php';