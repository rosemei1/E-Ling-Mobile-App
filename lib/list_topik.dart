import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:proto/bottombar.dart';
import 'package:proto/model/kategori.dart';
import 'package:proto/service/kategoriservice.dart';
import 'package:proto/web_view.dart';

import 'list_artikel.dart';

class ListTopik extends StatefulWidget {
  const ListTopik({Key? key}) : super(key: key);

  @override
  State<ListTopik> createState() => _ListTopikState();
}

class _ListTopikState extends State<ListTopik> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [
            Positioned(
             left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: 280,
                child: ColorFiltered(
                 colorFilter: ColorFilter.mode(
                     Colors.black.withOpacity(0.2),
                     BlendMode.srcOver),
                  child: Image.asset(
                    'assets/images/jambangan.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 30,
                top: 50,
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        color: Colors.white,
                        child: IconButton(
                          color: Color.fromARGB(255, 154, 191, 21),
                          icon: Icon(Icons.arrow_back),
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ],
                )),
            Positioned(
                left: 35,
                top: 120,
                child: Row(
                  children: [
                    Text(
                      'Materi Belajar',
                      style: const TextStyle(
                          fontSize: 24.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          fontFamily: 'Poppins'),
                    ),
                  ],
                )),
            Positioned(
                left: 35,
                top: 155,
                child: Row(
                  children: [
                    Text(
                      'Kami menyediakan materi dan kurikulum \nbelajar tentang waste management dan \nlingkungan untuk kalian',
                      style: const TextStyle(
                          fontSize: 14.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          fontFamily: 'Poppins'),
                    ),
                  ],
                )),
            Positioned(
              top: 260,
                child: Container(
              width: MediaQuery.of(context).size.width,
                  height: 500,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)
                    )
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10.0),
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
                              leading: Image.asset(
                                'assets/images/jambangan.jpg',
                              ),
                              // Icon(
                              //   Icons.article,
                              //   color: Color.fromARGB(255, 28, 140, 36),
                              //   size: 30,
                              // ),

                              title: Text(
                                'Waste Management',
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontFamily: "Poppins",
                                    fontSize: 14
                                ),
                              ),
                              subtitle: Text(
                                '10 Materi Pembelajaran',
                                style: TextStyle(
                                    fontFamily: "Poppins",
                                    fontSize: 11
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                TextButton(
                                  child: const Text(
                                    'Pelajari',
                                    style: TextStyle(
                                        fontFamily: "Poppins",
                                        fontSize: 10,
                                        color: Color.fromARGB(255, 28, 140, 36),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  onPressed: () {
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) => ArticleWebView(
                                    //           url: article.link,
                                    //           id: article.idKategori,
                                    //         )));
                                  },
                                ),
                                const SizedBox(width: 8),
                              ],
                            ),
                          ],
                        ),
                    ),
                      )

                    ],
                  ),
            ))
          ],
        ),
      ),
    );
  }

}

