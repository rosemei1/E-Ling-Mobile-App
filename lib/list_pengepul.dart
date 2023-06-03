import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:proto/bottombar.dart';
import 'package:proto/homepage.dart';
import 'package:proto/model/pengepul.dart';
import 'package:proto/pengepul_view.dart';
import 'package:proto/service/pengepulservice.dart';
import 'package:proto/web_view.dart';
import 'package:proto/botnav.dart';
import 'package:proto/model/galeri.dart';
import 'package:proto/service/galeriservice.dart';

import 'list_artikel.dart';

class pengepulList extends StatefulWidget {
  const pengepulList({Key? key}) : super(key: key);
  @override
  State<pengepulList> createState() => _pengepulListState();
}

class _pengepulListState extends State<pengepulList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: const Text(
            "Pengepul",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 154, 191, 21),
              fontFamily: "WorkSans",
              fontSize: 22,
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 8,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.04), // Ubah margin horizontal sesuai preferensi
                child: FutureBuilder<List<Peng>>(
                  future: PengepulService().getPengepul(), // Replace this line with your API call
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.black54),
                      );
                    } else if (snapshot.hasError) {
                      return Text('Failed to load data');
                    } else if (snapshot.hasData) {
                      final List<Peng> material = snapshot.data!;
                      return SizedBox(
                        width: MediaQuery.of(context).size.width * 1,
                        height: MediaQuery.of(context).size.height * 1,
                        child: GridView.builder(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.9,
                          ),
                          itemCount: material.length,
                          itemBuilder: (context, index) {
                            return _buildPengepulItem(context, material[index]);
                          },
                        ),
                      );
                    } else {
                      return Text('No data available');
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: 2,
      ),
    );
  }

  Widget _buildPengepulItem(BuildContext context, Peng pengepul) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPengepul(
              pengepul: pengepul,
            ),
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                right: 0,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8)
                    ),
                    child: ColorFiltered(
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.4),
                          BlendMode.srcOver),
                      child: FutureBuilder<List<Gal>>(
                        future: GaleriService().getGaleri(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            final List<Gal> galeriList = snapshot.data!;
                            final galeri = galeriList.firstWhere(
                                  (galeri) => galeri.pengepulId == pengepul.id.toString(),
                              orElse: () => Gal(id: 0, pengepulId: '', foto: '', createdAt: DateTime.now(), updatedAt: DateTime.now()), // Provide a default empty Gal object if no match is found
                            );
                            return Image.network(
                              galeri.foto,
                              fit: BoxFit.cover,
                            );
                          } else if (snapshot.hasError) {
                            return Text('Failed to load galeri data');
                          } else {
                            return CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(Colors.black54),
                            );
                          }
                        },
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.1,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(8),
                          bottomRight: Radius.circular(8)
                      )
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.05, // Ubah padding horizontal sesuai preferensi
                          vertical: MediaQuery.of(context).size.height * 0.0001, // Ubah padding vertikal sesuai preferensi
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 5,),
                            Text(
                              pengepul.nama,
                              style: TextStyle(
                                fontFamily: "Poppins",
                                fontSize: 12,
                                fontWeight: FontWeight.bold,

                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 3,),
                            Text(
                              pengepul.kategori,
                              style: TextStyle(
                                fontFamily: "Poppins",
                                fontSize: 10,

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

}