// To parse this JSON data, do
//
//     final kategori = kategoriFromJson(jsonString);

import 'dart:convert';

List<Kategori> kategoriFromJson(String str) =>
    List<Kategori>.from(json.decode(str).map((x) => Kategori.fromJson(x)));

String kategoriToJson(List<Kategori> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Kategori {
  Kategori({
    required this.id,
    required this.jenisKategori,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String jenisKategori;
  dynamic createdAt;
  dynamic updatedAt;

  factory Kategori.fromJson(Map<String, dynamic> json) => Kategori(
        id: json["id"],
        jenisKategori: json["jenis_kategori"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "jenis_kategori": jenisKategori,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
