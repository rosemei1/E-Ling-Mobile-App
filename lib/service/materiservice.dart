import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:proto/model/kategori.dart';

class MateriService {
  Future<List<Kategori>> getMateri() async {
    final response =
        await http.get(Uri.parse('http://localhost:8000/api/kategori'));
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
