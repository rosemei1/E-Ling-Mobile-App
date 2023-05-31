import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:proto/model/kategori.dart';

class KategoriService {
  Future<List<Datum>> getKategori() async {
    final response =
        await http.get(Uri.parse('http://eling.site/api/kategori'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return (jsonData['data'] as List)
          .map((kategori) => Datum.fromJson(kategori))
          .toList();
    } else {
      print('Failed to load kategori: ${response.statusCode}');
      throw Exception('Failed to load kategori');
    }
  }
}
