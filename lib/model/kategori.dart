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
  String deskripsi;
  String foto;
  DateTime createdAt;
  DateTime updatedAt;

  Datum({
    required this.id,
    required this.jenisKategori,
    required this.deskripsi,
    required this.foto,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    jenisKategori: json["jenis_kategori"],
    deskripsi: json["deskripsi"],
    foto: json["foto"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "jenis_kategori": jenisKategori,
    "deskripsi": deskripsi,
    "foto": foto,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
