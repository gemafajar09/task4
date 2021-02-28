<?php
include "koneksi.php";
$res = array();

$nama = $_POST['nama'];
$user = $_POST['username'];
$pass = $_POST['password'];

$data = $con->query("INSERT INTO user (username,password,nama) VALUES ('$user','$pass','$nama')");
if($data == TRUE)
{
    $res = array(
        'value' => 1,
        );
}else{
    $res = array(
        'value' => 0,
        );
}

echo json_encode($res);