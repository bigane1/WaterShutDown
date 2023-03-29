<?php
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST');
header("Access-Control-Allow-Headers: X-Requested-With");
	include 'conn.php';

	$ValveNum = $_POST['ValveNum'];
	$AreaCode = $_POST['AreaCode'];
	$StandCode = $_POST['StandCode'];
	$Location= $_POST['Location'];
	$DrainTierNum = $_POST['DrainTierNum'];
	$BleedTierNum = $_POST['BleedTierNum'];
	$ValveType = $_POST['ValveType'];
	$TierCode= $_POST['TierCode'];

	if(!empty($ValveNum))
	{
		echo 	$DrainTierNum;
		echo 	$BleedTierNum;
		$connect->query("INSERT INTO valve (ValveNum,AreaCode,StandCode,Location, DrainTierNum,BleedTierNum,ValveType,TierCode,FullDescription) VALUES ('".$ValveNum."','".$AreaCode."','".$StandCode."','".$Location."','".$DrainTierNum."','".$BleedTierNum."','".$ValveType."','".$TierCode."',CONCAT('".$TierCode."',' ','".$AreaCode."',' ','".$StandCode."'))");
	}
	
?>