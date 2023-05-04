import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:proto/bottombar.dart';
import 'package:proto/homepage.dart';
import 'package:proto/model/kategori.dart';
import 'package:proto/web_view.dart';

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
        title: const Text(
          "Topik",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 154, 191, 21),
            fontFamily: "WorkSans",
            fontSize: 22,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          color: Color.fromARGB(255, 154, 191, 21),
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => botNav()),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 8,),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16.0),
                child: FutureBuilder<String>(
                  future: DefaultAssetBundle.of(context)
                      .loadString('assets/json/kategori.json'),
                  builder: (context, snapshot) {
                    final List material = parseKategori(snapshot.data);
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
                          return _buildKategoriItem(context, material[index]!);
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
  return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        color: Color.fromARGB(255, 28, 140, 36),
        child: SizedBox(
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  "assets/images/earth.png",
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 10,
                left: 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4), // Add some padding to the container
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.7), // Set the desired color here
                        borderRadius: BorderRadius.circular(4), // Add some border radius to the container
                      ),
                      child: Text(
                        kategori.jenisKategori,
                        style: const TextStyle(
                            fontSize: 16.0,
                            color: Colors.black54,
                            fontFamily: 'Poppins'
                        ),
                      ),
                    ),
                    SizedBox(height: 4), // Add some spacing between the two Text widgets
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4), // Add some padding to the container
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.7), // Set the desired color here
                        borderRadius: BorderRadius.circular(4), // Add some border radius to the container
                      ),
                      child: Text(
                        "AAAAA",
                        style: const TextStyle(
                            fontSize: 14.0,
                            color: Colors.black54,
                            fontFamily: 'Poppins'
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
