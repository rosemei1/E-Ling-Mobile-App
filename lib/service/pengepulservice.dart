import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:proto/model/pengepul.dart';

class PengepulService {
  Future<List<Peng>> getKategori() async {
    final response =
    await http.get(Uri.parse('https://eling.site/api/pengepul'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return (jsonData['data'] as List)
          .map((kategori) => Peng.fromJson(kategori))
          .toList();
    } else {
      print('Failed to load pengepul: ${response.statusCode}');
      throw Exception('Failed to load pengepul');
    }
  }
}
