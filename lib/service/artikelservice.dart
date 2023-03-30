import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:proto/model/kategori.dart';

class ArtikelService {
  Future<List<Kategori>> getKategori() async {
    final response =
        await http.get(Uri.parse('http://localhost:8000/api/kategori'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body)['data'];
      return (jsonData as List)
          .map((kategori) => Kategori.fromJson(kategori))
          .toList();
    } else {
      throw Exception('Failed to load kategori');
    }
  }
}
