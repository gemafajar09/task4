class Kamus {
  String idKamus;
  String inisial;
  String nama;
  String deskripsi;

  Kamus({this.idKamus, this.inisial, this.nama, this.deskripsi});

  Kamus.fromJson(Map<String, dynamic> json) {
    idKamus = json['id_kamus'];
    inisial = json['inisial'];
    nama = json['nama'];
    deskripsi = json['deskripsi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_kamus'] = this.idKamus;
    data['inisial'] = this.inisial;
    data['nama'] = this.nama;
    data['deskripsi'] = this.deskripsi;
    return data;
  }
}