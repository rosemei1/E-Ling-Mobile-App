// To parse this JSON data, do
//
//     final galeri = galeriFromJson(jsonString);

import 'dart:convert';

Galeri galeriFromJson(String str) => Galeri.fromJson(json.decode(str));

String galeriToJson(Galeri data) => json.encode(data.toJson());

class Galeri {
  List<Gal> data;

  Galeri({
    required this.data,
  });

  factory Galeri.fromJson(Map<String, dynamic> json) => Galeri(
    data: List<Gal>.from(json["data"].map((x) => Gal.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Gal {
  int id;
  String pengepulId;
  String foto;
  DateTime createdAt;
  DateTime updatedAt;

  Gal({
    required this.id,
    required this.pengepulId,
    required this.foto,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Gal.fromJson(Map<String, dynamic> json) => Gal(
    id: json["id"],
    pengepulId: json["pengepul_id"],
    foto: 'https://eling.site/storage/images/${json["foto"]}',
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "pengepul_id": pengepulId,
    "foto": foto,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
