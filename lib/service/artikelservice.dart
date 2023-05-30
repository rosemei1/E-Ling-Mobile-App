import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:proto/model/artikel.dart';

class ArtikelService {
  Future<List<Art>> getArtikel() async {
    final response = await http.get(Uri.parse('http://eling.site/api/artikel'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return (jsonData['data'] as List)
          .map((kategori) => Art.fromJson(kategori))
          .toList();
    } else {
      print('Failed to load article: ${response.statusCode}');
      throw Exception('Failed to load article');
    }
  }
}

