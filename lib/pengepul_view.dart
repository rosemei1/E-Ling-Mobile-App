import 'package:flutter/material.dart';
import 'package:proto/bottombar.dart';
import 'package:proto/list_pengepul.dart';
import 'package:proto/model/pengepul.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:proto/model/galeri.dart';
import 'package:proto/service/galeriservice.dart';

class DetailPengepul extends StatefulWidget {
  final Peng pengepul;

  const DetailPengepul({required this.pengepul});

  @override
  _ViewDetailPengepul createState() => _ViewDetailPengepul();
}

class _ViewDetailPengepul extends State<DetailPengepul> {
  @override
  Widget build(BuildContext context) {
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
                height: 260,
                child: ColorFiltered(
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.2), BlendMode.srcOver),
                  child: FutureBuilder<List<Gal>>(
                    future: GaleriService().getGaleri(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        final List<Gal> galeriList = snapshot.data!;
                        final galeri = galeriList.firstWhere(
                              (galeri) => galeri.pengepulId == widget.pengepul.id.toString(),
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
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                      ),
                    ),
                  ],
                )),
            Positioned(
                left: 35,
                top: 120,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.pengepul.kategori,
                      style: const TextStyle(
                          fontSize: 24.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          fontFamily: 'Poppins'),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Text(
                        widget.pengepul.nama,
                        style: const TextStyle(
                            fontSize: 24.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                            fontFamily: 'Poppins'),
                      ),
                    ),
                  ],
                )),
            Positioned(
                top: 230,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 255, 250, 244),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 40, vertical: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 20),
                            Text(
                              'Alamat',
                              style: TextStyle(
                                fontFamily: "Poppins",
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 6),
                            Text(
                              widget.pengepul.alamat,
                              style: TextStyle(
                                fontFamily: "Poppins",
                                fontSize: 12,
                              ),
                            ),
                            SizedBox(height: 6),
                            Text(
                              'Ketersediaan',
                              style: TextStyle(
                                fontFamily: "Poppins",
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 6),
                            Text(
                              widget.pengepul.ketersediaanHari,
                              style: TextStyle(
                                fontFamily: "Poppins",
                                fontSize: 12,
                              ),
                            ),
                            Text(
                              widget.pengepul.ketersediaanJam,
                              style: TextStyle(
                                fontFamily: "Poppins",
                                fontSize: 12,
                              ),
                            ),
                            SizedBox(height: 6),
                            Text(
                              'Kontak',
                              style: TextStyle(
                                fontFamily: "Poppins",
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 6),
                            Row(
                              children: [
                                Text(
                                  'Telepon  ',
                                  style: TextStyle(
                                    fontFamily: "Poppins",
                                    fontSize: 12,
                                  ),
                                ),
                                Text(
                                  widget.pengepul.kontak,
                                  style: TextStyle(
                                    fontFamily: "Poppins",
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 6),
                            Text(
                              'Gallery',
                              style: TextStyle(
                                fontFamily: "Poppins",
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8),
                            Container(
                              child: FutureBuilder<List<Gal>>(
                                future: GaleriService().getGaleri(),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    final List<Gal> gallery = snapshot.data!;
                                    // Filter the gallery items based on a specific ID
                                    final filteredGallery = gallery.where((galeri) => galeri.pengepulId == widget.pengepul.id.toString()).toList();
                                    return SizedBox(
                                      height: 120,
                                      child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: filteredGallery.length,
                                        itemBuilder: (context, index) {
                                          final galeri = filteredGallery[index];
                                          return _buildGaleriItem(context, galeri);
                                        },
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
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )),
            Positioned(
              left: (MediaQuery.of(context).size.width - 100) / 2,
              bottom: (MediaQuery.of(context).size.height - 100) / 10,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Container(
                        height: 40,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 154, 191, 21),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(255, 154, 191, 21),
                              spreadRadius: 9,
                              blurRadius: 15,
                              offset: Offset(9, 9),
                            ),
                          ],
                        ),
                        child: GestureDetector(
                          onTap: () async {
                            await openGoogleMaps(
                                widget.pengepul.maps
                            );
                          },
                          child: Row(
                            children: [
                              IconButton(
                                padding: EdgeInsets.all(0),
                                color: Colors.white,
                                icon: Icon(Icons.map_outlined),
                                onPressed: () async {
                                  // await openGoogleMaps('https://maps.app.goo.gl/EMPTnfmtbtmYfSt87');
                                },
                              ),
                              Text(
                                'Peta',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> openGoogleMaps(String mapsUrl) async {
  if (await canLaunch(mapsUrl)) {
    await launch(mapsUrl);
  } else {
    throw 'Could not launch $mapsUrl';
  }
}

Widget _buildGaleriItem(BuildContext context, Gal galeri) {
  return Padding(
    padding: EdgeInsets.only(right: 16.0),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.network(
        galeri.foto,
        fit: BoxFit.cover,
        width: 240,
        height: 150,
      ),
    ),
  );
}

