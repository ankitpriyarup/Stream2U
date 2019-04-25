<?php
$user_id = $_GET['id'];
$pass = $_GET['pass'];
$mysqli = new mysqli('localhost', 'phpmyadmin', 'password', 'Stream2U');
if ($mysqli->connect_errno)
	echo "Cannot Connect";
else
{
    // Query #1
    $sql = "SELECT * FROM Member WHERE email = \"$user_id \"";
    if (!$result = $mysqli->query($sql))
        echo "User not found!";
    else
    {
        $row = $result->fetch_assoc();
        $db_pass = $row["passwordHash"];
        if ($pass != $db_pass)
            echo "Incorrect password!";
        else
        {
            echo "Welcome Back - " . $row["firstName"] . " " . $row["lastName"] . "<br>";

            $mem_type = $row["membershipTypeID"];
            $user_id = $row["memberID"];
            // Query #2
            $sql2 = "SELECT * FROM MembershipType WHERE m_typeID = \"$mem_type \"";
            // Query #3
            $sql3 = "SELECT COUNT(DISTINCT deviceAddress) FROM Device AS temp WHERE deviceID = \"$user_id\"";
            $row2 = $mysqli->query($sql2)->fetch_assoc();
            $row3 = $mysqli->query($sql3)->fetch_assoc();
            $quota = $row2["streamQuota"] - $row["quotaUsed"];
            echo "Your membership type - " . $row2["m_typeName"] . "<br>Stream Quota: " . $quota . "<br>Benefits: " . $row2["benefit"] . "<br>";
            $device_count = $row3["COUNT(DISTINCT deviceAddress)"];
            echo "Devices Registerd: " . $device_count . "<br>";
            echo "----------<br>";

            if ($mem_type == 1 && $device_count > 1) echo "Device count exceeded remove some first";
            else if ($mem_type == 2 && $device_count > 2) echo "Device count exceeded remove some first";
            else if ($mem_type == 3 && $device_count > 3) echo "Device count exceeded remove some first";
            else if ($mem_type == 4 && $device_count > 4) echo "Device count exceeded remove some first";
            else if ($quota <= 0) echo "Your streaming quota expired";
            else
            {
                echo "That's brewin' right now amigo<br>";

                $sql5 = "SELECT * FROM StreamContent";                                        //QUERY #4
                // $sql5 = "SELECT * FROM StreamContent WHERE rentalCharge=0";                   //QUERY #5
                // $sql5 = "SELECT * FROM StreamContent ORDER BY(duration)";                     //QUERY #6
                // $sql5 = "SELECT * FROM StreamContent WHERE maturityLevel=\"E\"";               //QUERY #7
                $row5 = $mysqli->query($sql5)->fetch_all();

                foreach($row5 as $resA)
                {
                    foreach($resA as $resB)
                    {
                        $i = $resB;
                        // QUERY #8
                        $sql4 = "SELECT * FROM StreamContent WHERE contentID = \"$i\"";
                        $row4 = $mysqli->query($sql4)->fetch_assoc();
                        echo $i . ". <a href=\"watch.php?id=" . $i . "&user=" . $user_id . "\">" . $row4["contentName"] . "</a> (" . $row4["contentGenre"] . ") - Starrings: ";
                        // QUERY #9
                        $sql6 = "SELECT actorID FROM Cast AS temp WHERE contentID = \"$i\"";
                        $row6 = $mysqli->query($sql6)->fetch_all();
                        foreach($row6 as $result)
                        {
                            foreach($result as $res)
                            {
                                // QUERY #10
                                $sql7 = "SELECT * FROM Actors WHERE actorID = \"$res\"";
                                $row7 = $mysqli->query($sql7)->fetch_assoc();
                                echo "<a href=\"actor.php?id=" . $res . "\">";
                                echo $row7["actorName"] . "</a> ";
                            }
                        }
                        echo "- ";
                        $ch_id = $row4["channelID"];
                        // QUERY #11
                        $sql7 = "SELECT * FROM Channel WHERE channelID = \"$ch_id\"";
                        $row7 = $mysqli->query($sql7)->fetch_assoc();
                        echo "uploaded by: " . "<a href=\"channel.php?id=" . $ch_id . "\">" . $row7["channelName"] . " [" . $row4["maturityLevel"] . "]";
                        echo "<br>";
                        break;
                    }
                }
            }
        }
	}
}
