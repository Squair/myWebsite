<?php
//$servername = "localhost";
//$username = "root";
//$password = "";

$servername = "weeb03";
$username = "fet15015248";
$password = "George01823";

$db = "fet15015248";
// Create connection


try {
    $connection = new PDO("mysql:host=$servername;dbname=$db", $username, $password);
    // set the PDO error mode to exception
    $connection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    //echo "Connected successfully"; 
    }
catch(PDOException $e)
    {
    //echo "Connection failed: " . $e->getMessage();
    }
?>