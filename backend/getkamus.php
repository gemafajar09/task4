<?php

include "koneksi.php";
$res = array();

$data = $con->query("SELECT * FROM tb_kamus ");
foreach($data as $i => $c)
{
    $res[] = array(
        'id_kamus' => $c['id_kamus'],
        'inisial' => substr($c['nama'],0,1),
        'nama' => $c['nama'],
        'deskripsi' => strip_tags($c['deskripsi'])
    );
}

echo json_encode($res);