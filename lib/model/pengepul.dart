// To parse this JSON data, do
//
//     final pengepul = pengepulFromJson(jsonString);

import 'dart:convert';

List<Pengepul> pengepulFromJson(String str) => List<Pengepul>.from(json.decode(str).map((x) => Pengepul.fromJson(x)));

String pengepulToJson(List<Pengepul> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Pengepul {
  int id;
  String nama;
  String alamat;
  String ketersediaan;
  String kontak;
  String gambar;
  String jenis;

  Pengepul({
    required this.id,
    required this.nama,
    required this.alamat,
    required this.ketersediaan,
    required this.kontak,
    required this.gambar,
    required this.jenis,
  });

  factory Pengepul.fromJson(Map<String, dynamic> json) => Pengepul(
    id: json["id"],
    nama: json["nama"],
    alamat: json["alamat"],
    ketersediaan: json["ketersediaan"],
    kontak: json["kontak"],
    gambar: json["gambar"],
    jenis: json["jenis"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nama": nama,
    "alamat": alamat,
    "ketersediaan": ketersediaan,
    "kontak": kontak,
    "gambar": gambar,
    "jenis": jenis,
  };
}
