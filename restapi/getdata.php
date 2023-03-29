<?php
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST');
header("Access-Control-Allow-Headers: X-Requested-With");
include 'conn.php';
$query = $_GET['query'];
$queryResult = null;
if(empty($query))
{
	$queryResult=$connect->query("SELECT * FROM valve");
}
else
{
	// $sql = "SELECT * FROM valve where TierCode like '%".$query."%'";
	$sql = "SELECT id, ValveNum, ValveType, TierCode, Location, DrainTierNum,BleedTierNum, AreaCode, StandCode, FullDescription FROM valve where FullDescription like '%".$query."%'";
	$queryResult=$connect->query($sql);
}

$result=array();

while($fetchData=$queryResult->fetch_assoc()){
	$result[]=$fetchData;
}

echo json_encode($result);

?>
