<?php
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST');
header("Access-Control-Allow-Headers: X-Requested-With");
	include 'conn.php';
	$id=$_POST['id'];
	$connect->query("DELETE FROM tb_item WHERE id=".$id);

?>