<?php
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST');
header("Access-Control-Allow-Headers: X-Requested-With");
	include 'conn.php';

	$id = $_POST['id'];
	$ValveNum = $_POST['ValveNum'];
	$AreaCode = $_POST['AreaCode'];
	$StandCode = $_POST['StandCode'];
	$Location= $_POST['Location'];
	$DrainTierNum = $_POST['DrainTierNum'];
	$BleedTierNum = $_POST['BleedTierNum'];
	$ValveType = $_POST['ValveType'];
	$TierCode= $_POST['TierCode'];

	$connect->query("UPDATE valve SET ValveNum='".$ValveNum."', AreaCode='".$AreaCode."', StandCode='".$StandCode."', Location='".$Location."', DrainTierNum='".$DrainTierNum."'
	, BleedTierNum='".$BleedTierNum."', ValveType='".$ValveType."', TierCode='".$TierCode."', FullDescription = CONCAT('".$TierCode."',' ','".$AreaCode."',' ','".$StandCode."')
	WHERE id=". $id);

?>