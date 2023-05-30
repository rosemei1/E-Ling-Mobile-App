import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:proto/model/materi.dart';

class MateriService {
  Future<List<Mats>> getMateri() async {
    final response = await http.get(Uri.parse('http://eling.site/api/materi'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return (jsonData['data'] as List)
          .map((materi) => Mats.fromJson(materi))
          .toList();
    } else {
      print('Failed to load materi: ${response.statusCode}');
      throw Exception('Failed to load materi');
    }
  }
}
