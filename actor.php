<?php
$id = $_GET['id'];
$mysqli = new mysqli('localhost', 'phpmyadmin', 'password', 'Stream2U');
if ($mysqli->connect_errno)
	echo "Cannot Connect";
else
{
    // QUERY #16
    $sql = "SELECT * FROM Actors WHERE actorID = \"$id\"";
    $row = $mysqli->query($sql)->fetch_assoc();
    echo "<img src=\"" . $row["dpURL"] . "\"height=\"232\" width=\"180\"> <br>";
    echo "<a href=\"" . $row["profileAddress"] . "\">" . $row["actorName"] . "</a>";
}
