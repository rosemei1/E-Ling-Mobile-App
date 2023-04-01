// To parse this JSON data, do
//
//     final materi = materiFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Materi> materiFromJson(String str) =>
    List<Materi>.from(json.decode(str).map((x) => Materi.fromJson(x)));

String materiToJson(List<Materi> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Materi {
  Materi({
    required this.id,
    required this.nama,
    required this.idKategory,
    required this.link,
    required this.createdAt,
    required this.updatedAt,
    required this.desc,
  });

  int id;
  String nama;
  int idKategory;
  String link;
  dynamic createdAt;
  dynamic updatedAt;
  String desc;

  factory Materi.fromJson(Map<String, dynamic> json) => Materi(
        id: json["id"],
        nama: json["nama"],
        idKategory: json["id_kategory"],
        link: json["link"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        desc: json["desc"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "id_kategory": idKategory,
        "link": link,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "desc": desc,
      };
}
