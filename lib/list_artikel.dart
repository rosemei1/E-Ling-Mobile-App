import 'dart:convert';
import 'dart:core';
import 'package:proto/model/artikel.dart';
import 'package:flutter/material.dart';
import 'package:proto/model/kategori.dart';
import 'package:proto/model/materi.dart';
import 'package:proto/service/materiservice.dart';
import 'package:proto/youtube_view.dart';
import 'package:proto/service/kategoriservice.dart';
import 'package:proto/service/materiservice.dart';
import 'package:proto/service/artikelservice.dart';
import 'package:proto/artikel_view.dart';

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
        title: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: const Text(
            "List Materi",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 154, 191, 21),
              fontFamily: "WorkSans",
              fontSize: 22,
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        leading: Container(
          margin: EdgeInsets.only(
              left: 12, top: 12), // Adjust the margin values as needed
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 75,
                height: 75,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(
                      13), // Adjust the border radius as needed
                  color: Color.fromARGB(255, 154, 191, 21),
                ),
              ),
              IconButton(
                color: Colors.white,
                icon: Icon(
                  Icons.arrow_back,
                  size: 25,
                ),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              //card
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: FutureBuilder<List<Datum>>(
                  future: KategoriService().getKategori(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      // While waiting for the data to load, show a loading indicator
                      return CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.black54),
                      );
                    } else if (snapshot.hasData) {
                      final List<Datum> material = snapshot.data!;

                      // Filter the list based on the specific ID
                      final filteredMaterial =
                          material.where((item) => item.id == widget.id).toList();

                      if (filteredMaterial.isEmpty) {
                        return Text('No data available for the specific ID');
                      }

                      return ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: filteredMaterial.length,
                        itemBuilder: (context, index) {
                          return _buildKategori(context, filteredMaterial[index]);
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

              //title
              SizedBox(
                height: 15,
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
              SizedBox(
                height: 15,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: FutureBuilder<List<Mats>>(
                  future: MateriService().getMateri(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      // While waiting for the data to load, show a loading indicator
                      return CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.black54),
                      );
                    } else if (snapshot.hasData) {
                      final List<Mats> material = snapshot.data!;

                      // Filter the list based on the specific ID
                      final filteredMaterial = material
                          .where(
                              (item) => item.idKategori == widget.id.toString())
                          .toList();

                      if (filteredMaterial.isEmpty) {
                        return Text(
                            'No data available for the specific ID ${widget.id}');
                      }

                      return ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: filteredMaterial.length,
                        itemBuilder: (context, index) {
                          return _buildMateriItem(
                              context, filteredMaterial[index]);
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
              SizedBox(height: 15),
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
              SizedBox(height: 15),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: FutureBuilder<List<Art>>(
                  future: ArtikelService().getArtikel(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      // While waiting for the data to load, show a loading indicator
                      return CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.black54),
                      );
                    } else if (snapshot.hasData) {
                      final List<Art> material = snapshot.data!;

                      // Filter the list based on the specific ID
                      final filteredMaterial = material
                          .where(
                              (item) => item.idKategori == widget.id.toString())
                          .toList();

                      if (filteredMaterial.isEmpty) {
                        return Text(
                            'No data available for the specific ID ${widget.id}');
                      }

                      return ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: filteredMaterial.length,
                        itemBuilder: (context, index) {
                          return _buildArticleItem(
                              context, filteredMaterial[index]);
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
            ],
          ),
        ),
      ),
    );
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
                  height: 100,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16.0),
                    child: Image.network(
                      article
                          .foto, // Replace with the actual path of your image asset
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

Widget _buildMateriItem(BuildContext context, Mats materi) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ViewYoutube(
                  url: materi.linkVideo,
                  id: materi.id,
                  desc: materi.deskripsiPanjang,
                  nama: materi.nama)));
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
                style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 13,
                    color: Color.fromARGB(204, 25, 25, 27),
                    fontWeight: FontWeight.w600),
              ),
              subtitle: Text(
                materi.sumber,
                maxLines: 2, //// membatasi subtitle pada satu baris
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 11,
                  color: Colors.black,
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

Widget _buildKategori(BuildContext context, Datum kategori) {
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16.0),
    ),
    child: SizedBox(
      height:  130.0 + (MediaQuery.of(context).size.height * 0.045), // Set the height of the card here
      child: Stack(
        children: [
          // Image
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Image.network(
                kategori.foto,
                fit: BoxFit.cover,
              ),
            ),
          ),

          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.50),
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
                SizedBox(
                  height: 8,
                ),
                Text(
                  kategori.jenisKategori,
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                    fontFamily: 'Poppins',
                  ),
                ),
                SizedBox(height: 4),
                Container(
                  width: MediaQuery.of(context).size.width * 0.78,
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: Text(
                    kategori.deskripsiPanjang,
                    style: const TextStyle(
                      fontSize: 13.0,
                      color: Colors.white,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Rounded Button
          // Positioned(
          //   bottom: MediaQuery.of(context).size.height * 0.02,
          //   right: MediaQuery.of(context).size.width * 0.06,
          //   child: ClipRRect(
          //     borderRadius: BorderRadius.circular(16.0),
          //     child: Container(
          //         color: Colors.white,
          //         padding:
          //             EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
          //         child: Padding(
          //           padding:
          //               EdgeInsets.only(left: 17, right: 17, top: 4, bottom: 4),
          //           child: Text(
          //             "Mulai Belajar",
          //             style: TextStyle(
          //                 fontSize: 12.0,
          //                 fontWeight: FontWeight.bold,
          //                 color: Color.fromARGB(255, 154, 191, 21),
          //                 fontFamily: "Poppins"),
          //           ),
          //         )
          //     ),
          //   ),
          // ),
        ],
      ),
    ),
  );
}
