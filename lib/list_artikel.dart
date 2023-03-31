import 'dart:convert';
import 'dart:core';
import 'package:proto/model/article.dart';
import 'package:proto/model/artikel.dart';
import 'package:proto/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:proto/web_view.dart';

class NewsListPage extends StatelessWidget {
  static const routeName = '/article_list';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          "Ini judul artikel",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 154, 191, 21),
            fontFamily: "WorkSans",
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          color: Color.fromARGB(255, 154, 191, 21),
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //card
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Card(
                color: Color.fromARGB(255, 28, 140, 36),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    SizedBox(height: 8.0),
                    ListTile(
                      title: RichText(
                        text: TextSpan(
                          style: TextStyle(fontSize: 16.0, color: Colors.black),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Apa sih itu Waste Management?',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
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
                              style: TextStyle(
                                  fontSize: 15.0, color: Colors.black),
                              children: <TextSpan>[
                                TextSpan(
                                  text:
                                      'Pengelolaan sampah adalah pengumpulan, pengangkutan, pengolahan ...',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: "Poppins",
                                      color: Colors.white),
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
                            'Baca lebih lanjut',
                            style: TextStyle(
                                fontFamily: "Poppins",
                                fontSize: 13,
                                color: Colors.white),
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
            //title
            Container(
              margin: EdgeInsets.only(
                  left: 16.0, right: 16.0, top: 2.0, bottom: 2.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Video Materi',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 154, 191, 21),
                    fontFamily: "WorkSans",
                  ),
                ),
              ),
            ),
            SizedBox(height: 8),
            //vid
            Container(
              margin: EdgeInsets.only(left: 16.0, right: 16.0, top: 1.0),
              child: Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    SizedBox(height: 8),
                    const ListTile(
                      leading: Icon(
                        Icons.play_arrow,
                        color: Color.fromARGB(255, 28, 140, 36),
                        size: 40,
                      ),
                      title: Text('The Enchanted Nightingale'),
                      subtitle:
                          Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        TextButton(
                          child: const Text('BUY TICKETS'),
                          onPressed: () {/* ... */},
                        ),
                        const SizedBox(width: 8),
                        TextButton(
                          child: const Text('LISTEN'),
                          onPressed: () {/* ... */},
                        ),
                        const SizedBox(width: 8),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 16.0, right: 16.0, top: 1.0),
              child: Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    SizedBox(height: 8),
                    const ListTile(
                      leading: Icon(
                        Icons.play_arrow,
                        color: Color.fromARGB(255, 28, 140, 36),
                        size: 40,
                      ),
                      title: Text('The Enchanted Nightingale'),
                      subtitle:
                          Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        TextButton(
                          child: const Text('BUY TICKETS'),
                          onPressed: () {/* ... */},
                        ),
                        const SizedBox(width: 8),
                        TextButton(
                          child: const Text('LISTEN'),
                          onPressed: () {/* ... */},
                        ),
                        const SizedBox(width: 8),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            //artikel
            Container(
              margin: EdgeInsets.only(
                  left: 16.0, right: 16.0, top: 2.0, bottom: 2.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Materi Bacaan',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 154, 191, 21),
                    fontFamily: "WorkSans",
                  ),
                ),
              ),
            ),
            FutureBuilder<String>(
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
    return parsed.map((json) => Artikel.fromJson(json)).toList();
  }
}

Widget _buildArticleItem(BuildContext context, Artikel article) {
  return Card(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SizedBox(height: 8),
        ListTile(
          leading: Icon(
            Icons.play_arrow,
            color: Color.fromARGB(255, 28, 140, 36),
            size: 40,
          ),
          title: Text(article.nama),
          subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            TextButton(
              child: const Text('LISTEN'),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ArticleWebView(
                              url: article.link,
                            )));
              },
            ),
            const SizedBox(width: 8),
          ],
        ),
      ],
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
