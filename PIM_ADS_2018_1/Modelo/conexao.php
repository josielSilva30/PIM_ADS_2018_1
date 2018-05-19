<?php
	$servidor = "robb0524.locaweb.com.br:3306";
	$usuario = "joao_unipsalas";
	$senha = "un1ps4l45@#";
	$dbname = "joao_unipsalas";


		/* connect to the db */
	$link = mysql_connect($servidor,$usuario,$senha) or die('Não foi possível conectar ao banco');
	mysql_select_db($dbname,$link) or die('Não foi possível selecionar o banco');
?>