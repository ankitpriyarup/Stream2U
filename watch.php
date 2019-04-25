<?php
$id = $_GET['id'];
$user = $_GET['user'];
$mysqli = new mysqli('localhost', 'phpmyadmin', 'password', 'Stream2U');
if ($mysqli->connect_errno)
	echo "Cannot Connect";
else
{
    // QUERY #12
    $sql = "INSERT INTO Stream VALUES(NULL, now(), $id)";
    $mysqli->query($sql);
    // QUERY #13
    $sql3 = "SELECT * FROM StreamContent AS temp WHERE contentID = \"$id\"";
    $row3 = $mysqli->query($sql3)->fetch_assoc();
    // QUERY #14
    $sql2 = "UPDATE Member SET quotaUsed = quotaUsed + " . $row3["rentalCharge"] . " WHERE memberID=" . $user;
    $mysqli->query($sql2);
    echo "Streaming...<br>";
    echo "--------<br>";
    echo "Ratings:<br>";
    // QUERY #15
    $sql4 = "SELECT ratingTitle, ratingDesc, rating FROM StreamReview WHERE contentID = \"$id\"";
    $row4 = $mysqli->query($sql4)->fetch_all();
    foreach($row4 as $resA)
    {
        foreach($resA as $resB)
            echo $resB . " ";
        echo "<br>";
    }
}
