<?php
include "koneksi.php";
$response = array();

$data = $con->query("SELECT * FROM tb_berita");
foreach($data as $i => $a)
{
    $response[] = array(
        'id' => $a['id_berita'],
        'judul' => $a['judul'],
        'deskripsi' => $a['deskripsi'],
        'foto' => $url."berita/".$a['foto']
    );
}

echo json_encode($response);