// To parse this JSON data, do
//
//     final pengepul = pengepulFromJson(jsonString);

import 'dart:convert';

Pengepul pengepulFromJson(String str) => Pengepul.fromJson(json.decode(str));

String pengepulToJson(Pengepul data) => json.encode(data.toJson());

class Pengepul {
  List<Peng> data;

  Pengepul({
    required this.data,
  });

  factory Pengepul.fromJson(Map<String, dynamic> json) => Pengepul(
    data: List<Peng>.from(json["data"].map((x) => Peng.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Peng {
  int id;
  String nama;
  String kategori;
  String alamat;
  String ketersediaanHari;
  String ketersediaanJam;
  String kontak;
  String maps;

  Peng({
    required this.id,
    required this.nama,
    required this.kategori,
    required this.alamat,
    required this.ketersediaanHari,
    required this.ketersediaanJam,
    required this.kontak,
    required this.maps,
  });

  factory Peng.fromJson(Map<String, dynamic> json) => Peng(
    id: json["id"],
    nama: json["nama"],
    kategori: json["kategori"],
    alamat: json["alamat"],
    ketersediaanHari: json["ketersediaan_hari"],
    ketersediaanJam: json["ketersediaan_jam"],
    kontak: json["kontak"],
    maps: json["maps"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nama": nama,
    "kategori": kategori,
    "alamat": alamat,
    "ketersediaan_hari": ketersediaanHari,
    "ketersediaan_jam": ketersediaanJam,
    "kontak": kontak,
    "maps": maps,
  };
}
