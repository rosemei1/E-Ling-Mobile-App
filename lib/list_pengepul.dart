import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:proto/bottombar.dart';
import 'package:proto/homepage.dart';
import 'package:proto/model/pengepul.dart';
import 'package:proto/pengepul_view.dart';
import 'package:proto/web_view.dart';
import 'botnav.dart';
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
<<<<<<< Updated upstream
      extendBody: true,
      // appBar: AppBar(
      //   elevation: 0,
      //   title: const Text(
      //     "Pengepul",
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
=======
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          "Pengepul",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 154, 191, 21),
            fontFamily: "WorkSans",
            fontSize: 22,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        leading: Container(
          margin: EdgeInsets.only(left: 10, top: 10), // Adjust the margin values as needed
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(13), // Adjust the border radius as needed
                  color: Color.fromARGB(255, 154, 191, 21),
                ),
              ),
              IconButton(
                color: Colors.white,
                icon: Icon(Icons.arrow_back, size: 30,),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
        ),
      ),
>>>>>>> Stashed changes
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 8,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16.0),
                child: FutureBuilder<String>(
                  future: DefaultAssetBundle.of(context)
                      .loadString('assets/json/pengepul.json'),
                  builder: (context, snapshot) {
                    final List material = parsePengepul(snapshot.data);
                    return SizedBox(
                      width: 700,
                      height: 700,
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.86,
                        ),
                        itemCount: material.length,
                        itemBuilder: (context, index) {
                          return _buildPengepulItem(context, material[index]!);
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: 2,
      ),
    );
  }

  List parsePengepul(String? json) {
    if (json == null) {
      return [];
    }
    final List parsed = jsonDecode(json);
    return parsed.map((json) => Pengepul.fromJson(json)).toList();
  }
}

Widget _buildPengepulItem(BuildContext context, Pengepul pengepul) {
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
                      topRight: Radius.circular(8)
                  ),
                  child: ColorFiltered(
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.2),
                        BlendMode.srcOver),
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
                        bottomRight: Radius.circular(8)
                    )
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 8,),
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
                            SizedBox(height: 6,),
                            Text(
                              pengepul.jenis,
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
