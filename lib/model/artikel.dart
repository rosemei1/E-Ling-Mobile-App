// To parse this JSON data, do
//
//     final artikel = artikelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Artikel> artikelFromJson(String str) =>
    List<Artikel>.from(json.decode(str).map((x) => Artikel.fromJson(x)));

String artikelToJson(List<Artikel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Artikel {
  Artikel({
    required this.id,
    required this.nama,
    required this.idKategori,
    required this.link,
    required this.desc,
  });

  int id;
  String nama;
  int idKategori;
  String link;
  String desc;

  factory Artikel.fromJson(Map<String, dynamic> json) => Artikel(
        id: json["id"],
        nama: json["nama"],
        idKategori: json["id_kategori"],
        link: json["link"],
        desc: json["desc"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "id_kategori": idKategori,
        "link": link,
        "desc": desc,
      };
}
