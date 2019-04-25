<?php
$id = $_GET['id'];
$mysqli = new mysqli('localhost', 'phpmyadmin', 'password', 'Stream2U');
if ($mysqli->connect_errno)
	echo "Cannot Connect";
else
{
    // QUERY #17
    $sql = "SELECT * FROM Channel WHERE channelID = \"$id\"";
    $row = $mysqli->query($sql)->fetch_assoc();
    echo $row["channelName"] . "<br>";
    echo $row["channelDesc"] . "<br>";
    echo "Followers: " . $row["channelFollowers"] . "<br>";
    echo "Earnings: $" . ($row["interaction_per_user"] * $row["channelFollowers"]) / 60 . "<br>";
}
