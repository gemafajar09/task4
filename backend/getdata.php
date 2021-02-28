<?php
include "koneksi.php";
$response = array();

$data = $con->query("SELECT * FROM tb_peternakan");
foreach($data as $i => $a)
{
    $response[] = array(
        'id' => $a['id'],
        'judul' => $a['judul'],
        'foto' => $url."galery/".$a['foto'],
    );
}

echo json_encode($response);