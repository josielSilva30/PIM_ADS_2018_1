<?php
//formato
$format = isset($_GET['format']) && strtolower($_GET['format']) == 'xml' ? 'xml' : 'json';
$periodo = $_GET['periodo']

/* connect to the db */
$link = mysql_connect('robb0524.locaweb.com.br:3306','joao_unipsalas','un1ps4l45@#') or die('Não foi possível conectar ao banco');
mysql_select_db('joao_unipsalas',$link) or die('Não foi possível selecionar o banco');

/* grab the posts from the db */
$query = "SELECT codPeriodo, nomePeriodo, statusPeriodo FROM periodo WHERE nomePeriodo = '$periodo' ";
$result = mysql_query($query,$link) or die('Errant query:  '.$query);

/* create one master array of the records */
$posts = array();
if(mysql_num_rows($result)) {
	while($post = mysql_fetch_assoc($result)) {
		$posts[] = array('post'=>$post);
	}
}

/* output in necessary format */
if($format == 'xml') {
	header('Content-type: text/xml');
	echo '<posts>';
	foreach($posts as $index => $post) {
		if(is_array($post)) {
			foreach($post as $key => $value) {
				echo '<',$key,'>';
				if(is_array($value)) {
					foreach($value as $tag => $val) {
						echo '<',$tag,'>',htmlentities($val),'</',$tag,'>';
					}
				}
				echo '</',$key,'>';
			}
		}
	}
	echo '</posts>';
}
else {
	header('Content-type: application/json');
	echo json_encode(array('posts'=>$posts));
}


/* disconnect from the db */
@mysql_close($link);
?>