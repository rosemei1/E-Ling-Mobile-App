import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:proto/model/artikel.dart';
import 'package:proto/model/kategori.dart';

class KategoriService {
  Future<List<Kategori>> getKategori() async {
    final response =
        await http.get(Uri.parse('https://elingrpl.000webhostapp.com/api/kategori'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return (jsonData as List)
          .map((kategori) => Kategori.fromJson(kategori))
          .toList();
    } else {
      throw Exception('Failed to load kategori');
    }
  }
}

// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:proto/model/kategori.dart';
//
// class KategoriService {
//   Future<List<Datum>> getArtikelList() async {
//     final response = await http
//         .get(Uri.parse('https://elingrpl.000webhostapp.com/api/kategori'));
//
//     if (response.statusCode == 200) {
//       final List<dynamic> responseData = json.decode(response.body);
//       return responseData.map((item) => Datum.fromJson(item)).toList();
//     } else {
//       throw Exception('Failed to load artikel');
//     }
//   }
// }
