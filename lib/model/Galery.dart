class Gallery {
  String id;
  String judul;
  String foto;

  Gallery({this.id, this.judul, this.foto});

  Gallery.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    judul = json['judul'];
    foto = json['foto'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['judul'] = this.judul;
    data['foto'] = this.foto;
    return data;
  }
}