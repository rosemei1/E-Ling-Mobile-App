// To parse this JSON data, do
//
//     final kategori = kategoriFromJson(jsonString);

import 'dart:convert';

Kategori kategoriFromJson(String str) => Kategori.fromJson(json.decode(str));

String kategoriToJson(Kategori data) => json.encode(data.toJson());

class Kategori {
  List<Datum> data;

  Kategori({
    required this.data,
  });

  factory Kategori.fromJson(Map<String, dynamic> json) => Kategori(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  int id;
  String jenisKategori;
  String deskripsiSingkat;
  String deskripsiPanjang;
  String foto;

  Datum({
    required this.id,
    required this.jenisKategori,
    required this.deskripsiSingkat,
    required this.deskripsiPanjang,
    required this.foto,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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
