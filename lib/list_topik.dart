import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:proto/bottombar.dart';
import 'package:proto/model/kategori.dart';
import 'package:proto/service/kategoriservice.dart';
import 'package:proto/web_view.dart';
import 'package:proto/botnav.dart';
import 'package:proto/model/materi.dart';
import 'package:proto/model/artikel.dart';
import 'package:proto/service/artikelservice.dart';
import 'package:proto/service/materiservice.dart';

import 'list_artikel.dart';

class ListTopik extends StatefulWidget {
  const ListTopik({Key? key}) : super(key: key);

  @override
  State<ListTopik> createState() => _ListTopikState();
}

class _ListTopikState extends State<ListTopik> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
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
                        Colors.black.withOpacity(0.5), BlendMode.srcOver),
                    child: Image.asset(
                      'assets/images/globe.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                  left: 35,
                  top: 50,
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
                  top: 90,
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
                top: 215,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 500,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 255, 250, 244),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          child: FutureBuilder<List<Datum>>(
                            future: KategoriService().getKategori(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                final List<Datum> material = snapshot.data!;
                                return FutureBuilder<List<Art>>(
                                  future: ArtikelService().getArtikel(),
                                  builder: (context, artikelSnapshot) {
                                    if (artikelSnapshot.hasData) {
                                      final List<Art> articles = artikelSnapshot.data!;
                                      return FutureBuilder<List<Mats>>(
                                        future: MateriService().getMateri(),
                                        builder: (context, materiSnapshot) {
                                          if (materiSnapshot.hasData) {
                                            final List<Mats> materials = materiSnapshot.data!;
                                            return ListView.builder(
                                              physics: NeverScrollableScrollPhysics(),
                                              shrinkWrap: true,
                                              itemCount: material.length,
                                              itemBuilder: (context, index) {
                                                return _buildKategoriItem(
                                                  context,
                                                  material[index],
                                                  articles,
                                                  materials,
                                                );
                                              },
                                            );
                                          } else if (materiSnapshot.hasError) {
                                            return Text('Failed to load data');
                                          } else {
                                            return CircularProgressIndicator(
                                              valueColor: AlwaysStoppedAnimation<Color>(
                                                Colors.black54,
                                              ),
                                            );
                                          }
                                        },
                                      );
                                    } else if (artikelSnapshot.hasError) {
                                      return Text('Failed to load data');
                                    } else {
                                      return CircularProgressIndicator(
                                        valueColor: AlwaysStoppedAnimation<Color>(Colors.black54),
                                      );
                                    }
                                  },
                                );
                              } else if (snapshot.hasError) {
                                return Text('Failed to load data');
                              } else {
                                return CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(Colors.black54),
                                );
                              }
                            },
                          ),
                        ),

                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.1,
                        )
                      ],
                    ),
                  ),
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
}

Widget _buildKategoriItem(BuildContext context, Datum kategori, List<Art> articles, List<Mats> materials) {
  String idKategori = kategori.id.toString();
  int artikelCount = countArtikel(articles, idKategori);
  int materiCount = countMateri(materials, idKategori);
  int result = materiCount+artikelCount;
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10.0),
    child: GestureDetector(
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
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            right: 8,
            left: 8,
            top: 6,
            bottom: 6,
          ),
          child: Row(
            children: [
              Card(
                child: Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      kategori.foto,
                      width: 120,
                      height: 90,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // SizedBox(
                      //   height: 8,
                      // ),
                      Text(
                        kategori.deskripsiSingkat,
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 10,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.42,
                        child: Text(
                          kategori.jenisKategori,
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontFamily: "Poppins",
                            fontSize: 14,
                          ),
                        ),
                      ),
                      Text(
                        "$result Materi Pembelajaran  ",
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

// Count the number of contents in Artikel with the given idKategori
int countArtikel(List<Art> articles, String idKategori) {
  return articles.where((art) => art.idKategori == idKategori).length;
}

// Count the number of contents in Materi with the given idKategori
int countMateri(List<Mats> materials, String idKategori) {
  return materials.where((mat) => mat.idKategori == idKategori).length;
}
