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
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 8,
              ),
              Container(
                  child: FutureBuilder<List<Peng>>(
                    future: PengepulService().getKategori(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        final List<Peng> material = snapshot.data!;
                        return ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: material.length,
                          itemBuilder: (context, index) {
                            return _buildPengepulItem(
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
                  width: double.maxFinite,
                  height: 110,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8)),
                    child: ColorFiltered(
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.2), BlendMode.srcOver),
                      child: Image.network(
                        pengepul.gambar,
                        fit: BoxFit.cover,
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
                  width: double.maxFinite,
                  height: 90,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(8),
                          bottomRight: Radius.circular(8))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                        EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 8,
                            ),
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
                            SizedBox(
                              height: 6,
                            ),
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
