import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:proto/model/galeri.dart';

class GaleriService {
  Future<List<Gal>> getGaleri() async {
    final response = await http.get(Uri.parse('http://eling.site/api/galeri'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return (jsonData['data'] as List)
          .map((kategori) => Gal.fromJson(kategori))
          .toList();
    } else {
      print('Failed to load galeri: ${response.statusCode}');
      throw Exception('Failed to load galeri');
    }
  }
}
