import 'dart:convert';
import 'dart:core';
import 'package:proto/bottombar.dart';
import 'package:proto/model/article.dart';
import 'package:proto/model/artikel.dart';
import 'package:flutter/material.dart';
import 'package:proto/model/kategori.dart';
import 'package:proto/model/materi.dart';
import 'package:proto/web_view.dart';
import 'package:proto/youtube_view.dart';

class NewsListPage extends StatefulWidget {
  static const routeName = '/article_list';

  final int id;
  const NewsListPage({required this.id});
  @override
  State<NewsListPage> createState() => _NewsListPageState();
}

class _NewsListPageState extends State<NewsListPage> {
  List<dynamic> data = [];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          "List Materi",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 154, 191, 21),
            fontFamily: "WorkSans",
            fontSize: 22,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        leading: Container(
          margin: EdgeInsets.only(left: 10, top: 10), // Adjust the margin values as needed
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(13), // Adjust the border radius as needed
                  color: Color.fromARGB(255, 154, 191, 21),
                ),
              ),
              IconButton(
                color: Colors.white,
                icon: Icon(Icons.arrow_back, size: 30,),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
        ),
      ),
        body: SingleChildScrollView(
        child: Column(
          children: [
            //card
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: FutureBuilder<String>(
                future: DefaultAssetBundle.of(context)
                    .loadString('assets/json/kategori.json'),
                builder: (context, snapshot) {
                  final List material = parseKategori(snapshot.data);
                  return ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: material.length,
                    itemBuilder: (context, index) {
                      return _buildKategori(context, material[index]!);
                    },
                  );
                },
              ),
            ),
            //title
            SizedBox(
              height: 18,
            ),
            Container(
              margin: EdgeInsets.only(
                  left: 16.0, right: 16.0, top: 2.0, bottom: 2.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Video Materi',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w900,
                    color: Color.fromARGB(255, 154, 191, 21),
                    fontFamily: "WorkSans",
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 16.0, right: 16.0, top: 1.0),
              child: FutureBuilder<String>(
                future: DefaultAssetBundle.of(context)
                    .loadString('assets/json/materi.json'),
                builder: (context, snapshot) {
                  final List material = parseMateri(snapshot.data);
                  return ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: material.length,
                    itemBuilder: (context, index) {
                      return _buildMateriItem(context, material[index]!);
                    },
                  );
                },
              ),
            ),
            SizedBox(height: 8),
            //vid

            //artikel
            Container(
              margin: EdgeInsets.only(
                  left: 16.0, right: 16.0, top: 2.0, bottom: 2.0),
              child: const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Materi Bacaan',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w900,
                    color: Color.fromARGB(255, 154, 191, 21),
                    fontFamily: "WorkSans",
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 16.0, right: 16.0, top: 1.0),
              child: FutureBuilder<String>(
                future: DefaultAssetBundle.of(context)
                    .loadString('assets/json/artikel.json'),
                builder: (context, snapshot) {
                  final List articles = parseArticles(snapshot.data);
                  return ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: articles.length,
                    itemBuilder: (context, index) {
                      return _buildArticleItem(context, articles[index]!);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  List parseArticles(String? json) {
    if (json == null) {
      return [];
    }
    final List parsed = jsonDecode(json);
    return parsed
        .map((json) => Artikel.fromJson(json))
        .where((article) => article.idKategori == widget.id)
        .toList();
  }

  List parseKategori(String? json) {
    if (json == null) {
      return [];
    }
    final List parsed = jsonDecode(json);
    return parsed
        .map((json) => Kategori.fromJson(json))
        .where((kategori) => kategori.id == widget.id)
        .toList();
  }

  List parseMateri(String? json) {
    if (json == null) {
      return [];
    }
    final List parsed = jsonDecode(json);
    return parsed
        .map((json) => Materi.fromJson(json))
        .where((article) => article.idKategory == widget.id)
        .toList();
  }
}

Widget _buildArticleItem(BuildContext context, Artikel article) {
  return Card(
    elevation: 3,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16.0),
    ),
    child: Stack(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 100,
              height: 100,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Image.asset(
                  'assets/images/logo.png', // Replace with the actual path of your image asset
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 16.0),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(top: 10, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Text(
                        article.nama,
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontFamily: "Poppins",
                            fontSize: 14
                        ),
                      ),
                    ),
                    SizedBox(height: 4,),
                    Text(
                      'tanggal',
                      style: TextStyle(
                          fontSize: 11.0,
                          fontFamily: "Poppins",
                          color: Colors.black38,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Positioned(
          bottom: -3,
          right: 12.0,
          child: TextButton(
            onPressed: () {
            },
            child: Text(
              'Baca Lebih Lanjut',
              style: TextStyle(
                  color: Color.fromARGB(255, 154, 191, 21),
                  decoration: TextDecoration.underline,
                  fontFamily: "Poppins",
                  fontSize: 11,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _buildMateriItem(BuildContext context, Materi materi) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ViewYoutube(
                  url: materi.link,
                  id: materi.idKategory,
                  desc: materi.desc,
                  nama: materi.nama
              )));
    },
    child: Container(
      height: 100,
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(height: 8),
            ListTile(
              leading: Icon(
                Icons.play_arrow_rounded,
                color: Color.fromARGB(255, 154, 191, 21),
                size: 40,
              ),
              title: Text(
                materi.nama,
                style:TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.w600
                ),
              ),
              subtitle: Text(
                "Oleh Eling",
                maxLines: 2, //// membatasi subtitle pada satu baris
                overflow: TextOverflow.ellipsis,
                style:TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 11,
                    color: Colors.black38,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
  // return ListTile(
  //   contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
  //   title: Text(article.nama),
  //   onTap: () {
  //     Navigator.push(
  //         context,
  //         MaterialPageRoute(
  //             builder: (context) => ArticleWebView(
  //                   url: article.link,
  //                 )));
  //   },
  // );
}

Widget _buildKategori(BuildContext context, Kategori kategori) {
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16.0),
    ),
    child: SizedBox(
      height: 150, // Set the height of the card here
      child: Stack(
        children: [
          // Image
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Image.asset(
                "assets/images/gunung.png",
                fit: BoxFit.cover,
              ),
            ),
          ),

          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.25),
                  borderRadius: BorderRadius.circular(16.0)// Adjust the opacity as desired
              ),
            ),
          ),

          // Name and tema
          Positioned(
            top: 10,
            left: 25,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 8,),
                Text(
                  kategori.jenisKategori,
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: 'Poppins',
                  ),
                ),
                SizedBox(height: 4),
                Container(
                  width: 250,
                  height: 100,
                  child: Text(
                    "Kamu bisa membaca atau menonton konten adukasi yang kami siapkan khusus untukmu.",
                    style: const TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Rounded Button
          Positioned(
            bottom: 12,
            right: 25,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Container(
                  color: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
                  child: Padding(
                    padding: EdgeInsets.only(left: 10, right: 10, top: 3, bottom: 3),
                    child: Text(
                      "Mulai Belajar",
                      style: TextStyle(
                          fontSize: 11.0,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 154, 191, 21),
                          fontFamily: "Poppins"
                      ),
                    ),
                  )
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
