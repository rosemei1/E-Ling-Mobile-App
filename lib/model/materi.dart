// To parse this JSON data, do
//
//     final material = materialFromJson(jsonString);

import 'dart:convert';

Material materialFromJson(String str) => Material.fromJson(json.decode(str));

String materialToJson(Material data) => json.encode(data.toJson());

class Material {
  Material({
    required this.data,
  });

  List<Datum> data;

  factory Material.fromJson(Map<String, dynamic> json) => Material(
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
  dynamic createdAt;
  dynamic updatedAt;

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
