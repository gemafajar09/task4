<?php
include "koneksi.php";
$res = array();

$user = $_POST['username'];
$pass = $_POST['password'];

$data = $con->query("SELECT * FROM user WHERE username='$user' AND password='$pass'")->fetch_assoc();
if($data == TRUE)
{
    $res = array(
        'value' => 1,
        'nama' => $data['nama'],
        'id' => $data['id']
        );
}else{
    $res = array(
        'value' => 0,
        'nama' => '',
        'id' => ''
        );
}

echo json_encode($res);