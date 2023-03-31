import 'dart:convert';
import 'dart:core';
import 'package:proto/model/artikel.dart';

import 'package:flutter/material.dart';

class artListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News App'),
      ),
      body: FutureBuilder<String>(
        future: DefaultAssetBundle.of(context)
            .loadString('assets/json/artikel.json'),
        builder: (context, snapshot) {
          final List articles = parseArtikels(snapshot.data);
          return ListView.builder(
            itemCount: articles.length,
            itemBuilder: (context, index) {
              return _buildArtikelItem(context, articles[index]!);
            },
          );
        },
      ),
    );
  }

  List parseArtikels(String? json) {
    if (json == null) {
      print('aggal');
      return [];
    }
    print('berhasil');
    final List parsed = jsonDecode(json);
    return parsed.map((json) => Artikel.fromJson(json)).toList();
  }
}

Widget _buildArtikelItem(BuildContext context, Artikel article) {
  return ListTile(
    contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
    title: Text(article.nama),
    subtitle: Text(article.link),
    onTap: () {
      // Navigator.push(
      //     // context,
      //     // MaterialPageRoute(
      //     //     builder: (context) => ArtikelDetailPage(
      //     //           article: article,
      //     //         ))
      //     );
    },
  );
}
