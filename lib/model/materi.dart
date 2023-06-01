// To parse this JSON data, do
//
//     final materi = materiFromJson(jsonString);

import 'dart:convert';

Materi materiFromJson(String str) => Materi.fromJson(json.decode(str));

String materiToJson(Materi data) => json.encode(data.toJson());

class Materi {
  List<Mats> data;

  Materi({
    required this.data,
  });

  factory Materi.fromJson(Map<String, dynamic> json) => Materi(
        data: List<Mats>.from(json["data"].map((x) => Mats.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Mats {
  int id;
  String nama;
  String deskripsiPanjang;
  String foto;
  String linkVideo;
  String sumber;
  String idKategori;
  Kategori kategori;

  Mats({
    required this.id,
    required this.nama,
    required this.deskripsiPanjang,
    required this.foto,
    required this.linkVideo,
    required this.sumber,
    required this.idKategori,
    required this.kategori,
  });

  factory Mats.fromJson(Map<String, dynamic> json) => Mats(
        id: json["id"],
        nama: json["nama"],
        deskripsiPanjang: json["deskripsi_panjang"],
        foto: json["foto"],
        linkVideo: json["link_video"],
        sumber: json["sumber"],
        idKategori: json["id_kategori"],
        kategori: Kategori.fromJson(json["kategori"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "deskripsi_panjang": deskripsiPanjang,
        "foto": foto,
        "link_video": linkVideo,
        "sumber": sumber,
        "id_kategori": idKategori,
        "kategori": kategori.toJson(),
      };
}

class Kategori {
  int id;
  String jenisKategori;
  String deskripsiSingkat;
  String deskripsiPanjang;
  String foto;

  Kategori({
    required this.id,
    required this.jenisKategori,
    required this.deskripsiSingkat,
    required this.deskripsiPanjang,
    required this.foto,
  });

  factory Kategori.fromJson(Map<String, dynamic> json) => Kategori(
        id: json["id"],
        jenisKategori: json["jenis_kategori"],
        deskripsiSingkat: json["deskripsi_singkat"],
        deskripsiPanjang: json["deskripsi_panjang"],
        foto: 'https://eling.site/storage/images/${json["foto"]}',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "jenis_kategori": jenisKategori,
        "deskripsi_singkat": deskripsiSingkat,
        "deskripsi_panjang": deskripsiPanjang,
        "foto": foto,
      };
}
