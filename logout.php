<?php
require_once __DIR__.'/includes/bootstrap.php';if($_SERVER['REQUEST_METHOD']!=='POST')go('index.php');verify_token();$_SESSION=[];session_destroy();session_start();flash('You have signed out.');go('index.php');
