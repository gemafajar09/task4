class Berita {
  String id;
  String judul;
  String deskripsi;
  String foto;

  Berita({this.id, this.judul, this.deskripsi, this.foto});

  Berita.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    judul = json['judul'];
    deskripsi = json['deskripsi'];
    foto = json['foto'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['judul'] = this.judul;
    data['deskripsi'] = this.deskripsi;
    data['foto'] = this.foto;
    return data;
  }
}

