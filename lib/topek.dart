import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:proto/model/kategori.dart';
import 'package:proto/web_view.dart';
import 'botnav.dart';

import 'list_artikel.dart';

class topikList extends StatefulWidget {
  const topikList({Key? key}) : super(key: key);

  @override
  State<topikList> createState() => _topikListState();
}

class _topikListState extends State<topikList> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      // appBar: AppBar(
      //   elevation: 0,
      //   title: const Text(
      //     "Topik",
      //     style: TextStyle(
      //       fontWeight: FontWeight.bold,
      //       color: Color.fromARGB(255, 154, 191, 21),
      //       fontFamily: "WorkSans",
      //       fontSize: 22,
      //     ),
      //   ),
      //   centerTitle: true,
      //   backgroundColor: Colors.white,
      //   leading: IconButton(
      //     color: Color.fromARGB(255, 154, 191, 21),
      //     icon: Icon(Icons.arrow_back),
      //     onPressed: () {
      //       Navigator.push(
      //         context,
      //         MaterialPageRoute(builder: (context) => botNav()),
      //       );
      //     },
      //   ),
      // ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                // decoration: BoxDecoration(
                //   borderRadius: BorderRadius.circular(16.0),
                //   border: Border.all(color: Colors.black54, width: 1.0),
                // ),
                child: Card(
                  color: Color.fromARGB(255, 154, 191, 21),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Stack(
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          SizedBox(height: 8),
                          ListTile(
                            title: Text(
                              "Apa yang ingin\nkamu pelajari?",
                              style: TextStyle(fontSize: 20.0, color: Colors.white, fontWeight:FontWeight.w600, fontFamily: "Poppins",),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 4),
                                SizedBox(height: 10,),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(20)),
                                      primary: Colors.white,
                                      onPrimary: Color.fromARGB(255, 28, 140, 36)),
                                  child: const Text(
                                    'Ayo mulai pelajari',
                                    style: TextStyle(
                                        fontFamily: "Poppins",
                                        fontSize: 12,
                                        color: Colors.black54),
                                  ),
                                  onPressed: () {/* ... */},
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10,)
                        ],
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: Image.asset(
                          'assets/images/godong.png', // change this to your image path
                          width: 200, // set the width and height of the imag
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16.0),
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
                        return _buildKategoriItem(context, material[index]!);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: 1,
      ),
    );
  }

  List parseKategori(String? json) {
    if (json == null) {
      return [];
    }
    final List parsed = jsonDecode(json);
    return parsed.map((json) => Kategori.fromJson(json)).toList();
  }
}

Widget _buildKategoriItem(BuildContext context, Kategori kategori) {
  return Column(
    children: [
      SizedBox(height: 8,),
      Card(
        color: Color.fromARGB(255, 28, 140, 36),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(height: 10),
            ListTile(
              title: Text(kategori.jenisKategori,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Poppins",
                  )),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 8),
                  RichText(
                    text: TextSpan(
                      style: TextStyle(fontSize: 15.0, color: Colors.black),
                      children: <TextSpan>[
                        TextSpan(
                          text: kategori.desc,
                          style: TextStyle(
                              fontSize: 12,
                              fontFamily: "Poppins",
                              color: Colors.white),
                        ),
                      ],
                    ),
                    maxLines: 2, // membatasi teks pada satu baris
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                const SizedBox(width: 8),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      primary: Colors.white,
                      onPrimary: Color.fromARGB(255, 28, 140, 36)),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NewsListPage(
                              id: kategori.id,
                            )));
                  },
                  child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        'Pelajari',
                        style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 11,
                            fontWeight: FontWeight.bold),
                      )),
                ),
                const SizedBox(width: 25),
              ],
            ),
            const SizedBox(height: 8)
          ],
        ),
      ),
    ],
  );
}
