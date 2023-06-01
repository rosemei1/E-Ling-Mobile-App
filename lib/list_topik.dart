import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:proto/bottombar.dart';
import 'package:proto/model/kategori.dart';
import 'package:proto/service/kategoriservice.dart';
import 'package:proto/web_view.dart';
import 'package:proto/botnav.dart';

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
                      'assets/images/jambangan.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                  left: 35,
                  top: 70,
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
                  top: 105,
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
                top: 220,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 500,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    children: [
                      Container(
                          child: FutureBuilder<List<Datum>>(
                            future: KategoriService().getKategori(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                final List<Datum> material = snapshot.data!;
                                return ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: material.length,
                                  itemBuilder: (context, index) {
                                    return _buildKategoriItem(
                                        context, material[index]);
                                  },
                                );
                              } else if (snapshot.hasError) {
                                return Text('Failed to load data');
                              } else {
                                return CircularProgressIndicator(
                                  valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.black54),
                                );
                              }
                            },
                          )),
                    ],
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

Widget _buildKategoriItem(BuildContext context, Datum kategori) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10.0),
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
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      kategori.jenisKategori,
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 10,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      kategori.jenisKategori,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontFamily: "Poppins",
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      kategori.deskripsiSingkat,
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 11,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          SizedBox(
                            width:
                                (MediaQuery.of(context).size.width - 100) / 3,
                          ),
                          const Text(
                            'Pelajari',
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 10,
                              color: Color.fromARGB(255, 28, 140, 36),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
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
  );
}
