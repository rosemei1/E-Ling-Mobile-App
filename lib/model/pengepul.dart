// To parse this JSON data, do
//
//     final pengepul = pengepulFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Pengepul> pengepulFromJson(String str) =>
    List<Pengepul>.from(json.decode(str).map((x) => Pengepul.fromJson(x)));

String pengepulToJson(List<Pengepul> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Pengepul {
  int id;
  String nama;
  String alamat;
  String ketersediaan;
  String kontak;

  Pengepul({
    required this.id,
    required this.nama,
    required this.alamat,
    required this.ketersediaan,
    required this.kontak,
  });

  factory Pengepul.fromJson(Map<String, dynamic> json) => Pengepul(
        id: json["id"],
        nama: json["nama"],
        alamat: json["alamat"],
        ketersediaan: json["ketersediaan"],
        kontak: json["kontak"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "alamat": alamat,
        "ketersediaan": ketersediaan,
        "kontak": kontak,
      };
}
