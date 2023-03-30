// To parse this JSON data, do
//
//     final artikel = artikelFromJson(jsonString);

import 'dart:convert';

Artikel artikelFromJson(String str) => Artikel.fromJson(json.decode(str));

String artikelToJson(Artikel data) => json.encode(data.toJson());

class Artikel {
  Artikel({
    required this.data,
  });

  List<Datum> data;

  factory Artikel.fromJson(Map<String, dynamic> json) => Artikel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.id,
    required this.nama,
    required this.idKategory,
    required this.link,
  });

  int id;
  String nama;
  int idKategory;
  String link;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        nama: json["nama"],
        idKategory: json["id_kategory"],
        link: json["link"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "id_kategory": idKategory,
        "link": link,
      };
}
