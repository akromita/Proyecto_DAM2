<?php
    $link = mysqli_connect('217.76.150.88', 'qadf185', '1234Asdf', 'qadf185');

    if (mysqli_connect_error()) {
        $logMessage = 'MySQL Error: ' . mysqli_connect_error();

        echo $logMessage;
    }

        $query = "SELECT nom, id FROM rols";

        $res = mysqli_query($link, $query);

        $myArr = array();   //array on tindrem tots els retorns en JSON

        while ( $row = mysqli_fetch_assoc($res) )
        {
            array_push($myArr, array('nom' => $row['nom'], 'id' => $row['id']));
        }

        echo json_encode($myArr);

    mysqli_close();

?>