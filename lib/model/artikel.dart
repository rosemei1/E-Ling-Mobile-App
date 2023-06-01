// To parse this JSON data, do
//
//     final artikel = artikelFromJson(jsonString);

import 'dart:convert';

Artikel artikelFromJson(String str) => Artikel.fromJson(json.decode(str));

String artikelToJson(Artikel data) => json.encode(data.toJson());

class Artikel {
  List<Art> data;

  Artikel({
    required this.data,
  });

  factory Artikel.fromJson(Map<String, dynamic> json) => Artikel(
        data: List<Art>.from(json["data"].map((x) => Art.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Art {
  int id;
  String nama;
  String deskripsiSingkat;
  String deskripsiPanjang;
  String tanggal;
  String link;
  String sumber;
  String foto;
  String idKategori;
  Kategori kategori;

  Art({
    required this.id,
    required this.nama,
    required this.deskripsiSingkat,
    required this.deskripsiPanjang,
    required this.tanggal,
    required this.link,
    required this.sumber,
    required this.foto,
    required this.idKategori,
    required this.kategori,
  });

  factory Art.fromJson(Map<String, dynamic> json) => Art(
        id: json["id"],
        nama: json["nama"],
        deskripsiSingkat: json["deskripsi_singkat"],
        deskripsiPanjang: json["deskripsi_panjang"],
        tanggal: json["tanggal"],
        link: json["link"],
        sumber: json["sumber"],
        foto: 'https://eling.site/storage/images/${json["foto"]}',
        idKategori: json["id_kategori"],
        kategori: Kategori.fromJson(json["kategori"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "deskripsi_singkat": deskripsiSingkat,
        "deskripsi_panjang": deskripsiPanjang,
        "tanggal": tanggal,
        "link": link,
        "sumber": sumber,
        "foto": foto,
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
        foto: json["foto"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "jenis_kategori": jenisKategori,
        "deskripsi_singkat": deskripsiSingkat,
        "deskripsi_panjang": deskripsiPanjang,
        "foto": foto,
      };
}
