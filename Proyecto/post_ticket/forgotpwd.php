<?php

$link = mysqli_connect('217.76.150.88', 'qadf185', '1234Asdf', 'qadf185');

    if (mysqli_connect_error()) {
        $logMessage = 'MySQL Error: ' . mysqli_connect_error();

        echo $logMessage;
    }

    //aqui comienza el codigo de registro de usuario

    $email = $_POST['email'];
    $password = $_POST['password'];

    //$query = "INSERT INTO usuaris (mail, nom, cognom, pwd, administrador) VALUES ('$email', '$name', '$surname', '$password', '0')";

    $query = "SELECT mail FROM usuaris WHERE pwd = '$password' and mail = '$email'";

    $xcompare = mysqli_query($link, $query);

    echo mysqli_num_rows($xcompare);

    /*if (mysqli_num_rows($xcompare) == 1)
    {
        echo 1;
    }
    else
    {
        echo 0;
    }*/

    mysqli_close($link);
 
?>