import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:proto/botnav.dart';
import 'package:proto/list_artikel.dart';
import 'package:proto/list_pengepul.dart';
import 'package:proto/model/artikel.dart';
import 'package:proto/service/artikelservice.dart';
import 'package:proto/web_view.dart';
import 'package:proto/model/kategori.dart';
import 'package:proto/service/kategoriservice.dart';
import 'package:proto/artikel_view.dart';

class home extends StatelessWidget {
  const home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 40.0, left: 6.0,right: 6.0, bottom: 16),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          SizedBox(
            height: 8,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  spreadRadius: 0.01,
                  blurRadius: 6,
                  offset: Offset(0, 0),
                ),
              ],
            ),
            margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Card(
              color: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Stack(
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: ListTile(
                          title: Text(
                            "Selamat Datang!",
                            style: TextStyle(
                              fontSize: 25.0,
                              color: Color.fromARGB(255, 154, 191, 21),
                              fontWeight: FontWeight.w600,
                              fontFamily: "Poppins",
                            ),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 7,
                              ),
                              RichText(
                                text: const TextSpan(
                                  style: TextStyle(
                                      fontSize: 15.0,
                                      color:
                                          Color.fromARGB(255, 154, 191, 21)),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text:
                                          'Yuk, belajar waste manajemen\ndan cari bank sampah\nterdekatmu! ',
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontFamily: "Poppins",
                                        color:
                                            Color.fromARGB(255, 154, 191, 21),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 10),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(20)),
                                  primary: Color.fromARGB(255, 154, 191, 21),
                                  onPrimary: Color.fromARGB(255, 28, 140, 36),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 15, right: 15, top: 4, bottom: 4),
                                  child: Text(
                                    'Cari Pengepul',
                                    style: TextStyle(
                                        fontFamily: "Poppins",
                                        fontSize: 11,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.pushReplacement(context,
                                      MaterialPageRoute(builder: (context)=>pengepulList()
                                      )
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                  Positioned(
                    bottom: -1,
                    right: -1,
                    child: Image.asset(
                      'assets/images/homeb.png',
                    ),
                  ),
                  Positioned(
                    bottom: MediaQuery.of(context).size.height * -0.13,
                    right: MediaQuery.of(context).size.width * -0.1,
                    child: Transform.scale(
                      scale: 0.4,
                      child: Image.asset(
                        'assets/images/homep.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            margin: EdgeInsets.only(
                left: 16.0, right: 16.0, top: 2.0, bottom: 2.0),
            child: const Text(
              'Materi',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w900,
                color: Color.fromARGB(255, 154, 191, 21),
                fontFamily: "WorkSans",
              ),
            ),
          ),
          //    2x2 card
          const SizedBox(
            height: 8,
          ),
          Container(
              child: FutureBuilder<List<Datum>>(
            future: KategoriService().getKategori(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final List<Datum> material = snapshot.data!;
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: material
                        .map((kategori) =>
                            _buildKategoriItem(context, kategori))
                        .toList(),
                  ),
                );
              } else if (snapshot.hasError) {
                return Text('Failed to load data');
              } else {
                return CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.black54),
                );
              }
            },
          )),
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.025,),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: SizedBox(
                height: 120, // Set the height of the card here
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
                            color: Colors.black.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(
                                16.0) // Adjust the opacity as desired
                            ),
                      ),
                    ),

                    // Name and tema
                    Positioned(
                      top: MediaQuery.of(context).size.height * 0.03,
                      left: MediaQuery.of(context).size.width * 0.05,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Yuk, bantu kami meningkatkan ELing\nmenjadi lebih baik!",
                            style: const TextStyle(
                                fontSize: 16.0,
                                color: Colors.white,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(height: 4),
                        ],
                      ),
                    ),

                    Positioned(
                      bottom: 15,
                      right: 25,
                      child: GestureDetector(
                        onTap: () {
                          const googleFormUrl = 'https://docs.google.com/forms/d/e/1FAIpQLScb8a3kF8MmJN9VcwbmMdjYmmoFlL0dE2fkfiQbn30kzdNQXg/viewform';
                          launch(googleFormUrl);
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Container(
                            color: Colors.white,
                            padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
                            child: Padding(
                              padding: EdgeInsets.only(left: 15, right: 15, top: 3, bottom: 3),
                              child: Text(
                                "Ikuti Survey",
                                style: TextStyle(
                                  fontSize: 11.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 154, 191, 21),
                                  fontFamily: "Poppins",
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.only(
                left: 16.0, right: 16.0, top: 2.0, bottom: 2.0),
            child: Text(
              'Bacaan Terbaru',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w900,
                color: Color.fromARGB(255, 154, 191, 21),
                fontFamily: "WorkSans",
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),

          //article card
            Container(
              margin: EdgeInsets.only(left: 16.0, right: 16.0, top: 1.0),
              child: FutureBuilder<List<Art>>(
                future: ArtikelService().getArtikel(), // Call your API to fetch the articles
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    // While waiting for the data to load, show a loading indicator
                    return CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.black54),
                    );
                  } else if (snapshot.hasData) {
                    final List<Art> articles = snapshot.data!;

                    // Sort the articles in descending order based on their timestamps
                    articles.sort((a, b) => b.id.compareTo(a.id));

                    // Fetch only the last 3 contents
                    final lastThreeArticles = articles.length > 3
                        ? articles.sublist(0, 3)
                        : articles;

                    return ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: lastThreeArticles.length,
                      itemBuilder: (context, index) {
                        return _buildArticleItem(context, lastThreeArticles[index]);
                      },
                    );
                  } else if (snapshot.hasError) {
                    return Text('Failed to load data: ${snapshot.error}');
                  } else {
                    return Text('No data available');
                  }
                },
              ),
            ),


            SizedBox(
            height: 8,
          ),
          ],
        ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: 0,
      ),
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

Widget _buildArticleItem(BuildContext context, Art article) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ViewArtikel(
                artikel: article,
              )));
    },
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            spreadRadius: 0.01,
            blurRadius: 6,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: Card(
        elevation: 0,
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
                  height:100,
                  child: Flexible(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16.0),
                      child: Image.network(
                        article
                            .foto, // Replace with the actual path of your image asset
                        fit: BoxFit.cover,
                      ),
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
                        Container(
                          width: 200,
                          child: Text(
                            article.nama,
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Color.fromARGB(204, 25, 25, 27),
                                fontFamily: "Poppins",
                                fontSize: 13),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          article.tanggal,
                          style:
                          TextStyle(fontSize: 10.0, fontFamily: "Poppins"),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

Widget _buildKategoriItem(BuildContext context, Datum kategori) {
  return Container(
    padding: EdgeInsets.only(left: 10),
    child: Column(
      children: [
        SizedBox(height: 8),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NewsListPage(
                  id: kategori.id,
                ),
              ),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  spreadRadius: 0.01,
                  blurRadius: 6,
                  offset: Offset(0, 0),
                ),
              ],
            ),
            child: Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: SizedBox(
                width: 210,
                height: 235,
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16.0),
                        topRight: Radius.circular(16.0),
                      ),
                      child: Image.network(
                        kategori.foto,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: 150,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 5.0, bottom: 10.0, right: 10.0, top: 1.0),
                      child: Align(
                          alignment:
                              Alignment.centerLeft, // Align text to the left
                          child: ListTile(
                            title: Text(
                              kategori.jenisKategori,
                              style: TextStyle(
                                color: Color.fromARGB(204, 25, 25, 27),
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                fontFamily: "Poppins",
                              ),
                            ),
                            subtitle: Text(
                              kategori.deskripsiSingkat,
                              //// membatasi subtitle pada satu baris
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontFamily: "Poppins",
                                fontSize: 11,
                                color: Colors.black,
                              ),
                            ),
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
