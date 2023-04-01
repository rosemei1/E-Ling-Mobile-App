// To parse this JSON data, do
//
//     final kategori = kategoriFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Kategori> kategoriFromJson(String str) =>
    List<Kategori>.from(json.decode(str).map((x) => Kategori.fromJson(x)));

String kategoriToJson(List<Kategori> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Kategori {
  Kategori({
    required this.id,
    required this.jenisKategori,
    required this.desc,
  });

  int id;
  String jenisKategori;
  String desc;

  factory Kategori.fromJson(Map<String, dynamic> json) => Kategori(
        id: json["id"],
        jenisKategori: json["jenis_kategori"],
        desc: json["desc"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "jenis_kategori": jenisKategori,
        "desc": desc,
      };
}
