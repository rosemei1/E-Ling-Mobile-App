import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:proto/list_artikel.dart';
import 'package:proto/model/artikel.dart';
import 'package:proto/web_view.dart';

class home extends StatelessWidget {
  const home({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 150,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 2 - 24,
                      child: Image.asset('assets/images/logo.png'),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 2 - 24,
                      child: Image.asset('assets/images/earth.png'),
                    ),
                  ],
                ),
              ),
              //selamat datang
              Container(
                margin:
                EdgeInsets.only(left: 16.0, right: 16.0, top: 2.0, bottom: 2.0),
                child: const Text(
                  'Selamat datang, Darla!',
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                    fontFamily: "Poppins",
                  ),
                ),
              ),
              //card pertama
              SizedBox(height: 8,),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  border: Border.all(color: Colors.black54, width: 1.0),
                ),
                child: Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      SizedBox(height: 8),
                      ListTile(
                        title: RichText(
                          text: TextSpan(
                            style: TextStyle(fontSize: 16.0, color: Colors.black),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Platform edukasi ',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 28, 140, 36),
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Poppins",
                                ),
                              ),
                              TextSpan(
                                text: 'Lingkungan',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 154, 191, 21),
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Poppins",
                                ),
                              ),
                            ],
                          ),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10),
                            RichText(
                              text: TextSpan(
                                style:
                                TextStyle(fontSize: 15.0, color: Colors.black),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'Yuk, mulai perjalananmu belajar ',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: "Poppins",
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'waste\nmanagement !',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Poppins",
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          const SizedBox(width: 8),
                          TextButton(
                            child: const Text(
                              'Selengkapnya',
                              style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontSize: 12,
                                  color: Colors.black54),
                            ),
                            onPressed: () {/* ... */},
                          ),
                          const SizedBox(width: 8),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              //divider
              // Container(
              //   margin: EdgeInsets.symmetric(horizontal: 16),
              //   child: const Divider(
              //     color: Colors.grey,
              //     height: 20,
              //     thickness: 1,
              //     indent: 20,
              //     endIndent: 16,
              //   ),
              // ),
              //topik
              SizedBox(
                height: 15,
              ),
              Container(
                margin:
                EdgeInsets.only(left: 16.0, right: 16.0, top: 2.0, bottom: 2.0),
                child: Text(
                  'Topik',
                  style: TextStyle(
                    fontSize: 27,
                    fontWeight: FontWeight.w900,
                    color: Color.fromARGB(255, 154, 191, 21),
                    fontFamily: "WorkSans",
                  ),
                ),
              ),
              //    2x2 card
              SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NewsListPage(
                                id: 1,
                              )));
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      color: Color.fromARGB(255, 28, 140, 36),
                      child: SizedBox(
                        width: 160,
                        height: 125,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.assessment_outlined,
                                size: 35,
                                color: Colors.white,
                              ),
                              SizedBox(height: 10),
                              Text('Waste Management',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: "Poppins",
                                      color: Colors.white),
                                  textAlign: TextAlign.center),
                            ]),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NewsListPage(
                                id: 2,
                              )));
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      color: Color.fromARGB(255, 28, 140, 36),
                      child: SizedBox(
                        width: 160,
                        height: 125,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.delete_outline,
                                size: 35,
                                color: Colors.white,
                              ),
                              SizedBox(height: 10),
                              Text('Jenis Sampah',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: "Poppins",
                                      color: Colors.white),
                                  textAlign: TextAlign.center),
                            ]),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NewsListPage(
                                id: 3,
                              )));
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      color: Color.fromARGB(255, 28, 140, 36),
                      child: SizedBox(
                        width: 160,
                        height: 125,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.settings_outlined,
                                size: 35,
                                color: Colors.white,
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Teknik Pengolahan\nSampah',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "Poppins",
                                    color: Colors.white),
                                textAlign: TextAlign.center,
                              ),
                            ]),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NewsListPage(
                                id: 4,
                              )));
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      color: Color.fromARGB(255, 28, 140, 36),
                      child: SizedBox(
                        width: 160,
                        height: 125,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.wb_sunny_outlined,
                                size: 35,
                                color: Colors.white,
                              ),
                              SizedBox(height: 10),
                              Text('Prinsip Pengolahan\nSampah',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "Poppins",
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.center),
                            ]),
                      ),
                    ),
                  ),
                ],
              ),
              //divider
              // Container(
              //   margin: EdgeInsets.symmetric(horizontal: 16),
              //   child: const Divider(
              //     color: Colors.grey,
              //     height: 20,
              //     thickness: 1,
              //     indent: 20,
              //     endIndent: 16,
              //   ),
              // ),
              //bacaan terbaru
              SizedBox(
                height: 15,
              ),
              Container(
                margin:
                EdgeInsets.only(left: 16.0, right: 16.0, top: 2.0, bottom: 2.0),
                child: Text(
                  'Bacaan Terbaru',
                  style: TextStyle(
                    fontSize: 27,
                    fontWeight: FontWeight.w900,
                    color: Color.fromARGB(255, 154, 191, 21),
                    fontFamily: "WorkSans",
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              //article card
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
              SizedBox(
                height: 8,
              ),
            ],
          )),
    );
  }

  List parseArticles(String? json) {
    if (json == null) {
      return [];
    }
    // final List parsed = jsonDecode(json);
    // return parsed.map((json) => Artikel.fromJson(json)).toList();
    final List parsed = jsonDecode(json);
    final List<Artikel> articles =
    parsed.map((json) => Artikel.fromJson(json)).toList();
    final List<Artikel> top3 = articles.reversed
        .take(3)
        .toList(); // menambahkan parameter reversed: true
    return top3;
  }
}

Widget _buildArticleItem(BuildContext context, Artikel article) {
  return Card(
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
            Icons.article,
            color: Color.fromARGB(255, 28, 140, 36),
            size: 30,
          ),
          title: Text(article.nama),
          subtitle: Text(
            article.desc,
            maxLines: 1, // membatasi subtitle pada satu baris
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            TextButton(
              child: const Text(
                'Baca Lebih Lanjut',
                style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 10,
                    color: Color.fromARGB(255, 28, 140, 36),
                    fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ArticleWebView(
                          url: article.link,
                          id: article.idKategori,
                        )));
              },
            ),
            const SizedBox(width: 8),
          ],
        ),
      ],
    ),
  );
}