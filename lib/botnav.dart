<<<<<<< Updated upstream
import 'package:flutter/material.dart';
import 'package:proto/homepage.dart';
import 'package:proto/topek.dart';
import 'package:proto/list_pengepul.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final int currentIndex;

  const CustomBottomNavigationBar({
    required this.currentIndex,
  });

  @override
  _CustomBottomNavigationBarState createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  DateTime? _currentBackPressTime; // Track the last time back button was pressed

  void _navigateToPage(int pageIndex) {
    Widget? page;

    switch (pageIndex) {
      case 0:
        page = home();
        break;
      case 1:
        page = topikList();
        break;
      case 2:
        page = pengepulList();
        break;
    }

    if (page != null) {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => page!,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
          transitionDuration: Duration(milliseconds: 10),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_currentBackPressTime == null ||
            DateTime.now().difference(_currentBackPressTime!) > Duration(seconds: 2)) {
          // Show a snackbar with the warning message
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              content: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Text(
                  'Press back once again to exit',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: "Poppins",
                  ),
                ),
              ),
              behavior: SnackBarBehavior.floating,
              duration: Duration(seconds: 2),
            ),

          );

          // Record the current time when back button is pressed
          _currentBackPressTime = DateTime.now();

          return false;
        } else {
          return true; // Allow the app to be closed when back button is pressed again within 2 seconds
        }
      },
      child: Container(

        decoration: BoxDecoration(
          color: Color.fromARGB(255, 154, 191, 21),
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        margin: EdgeInsets.symmetric(
          vertical: 15.0,
          horizontal:16.0,
        ),
        padding: EdgeInsets.symmetric(
          vertical: 3.0,
          horizontal: 5.0,
        ),
        // Bottom navigation bar content
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () => _navigateToPage(0),
              icon: Icon(Icons.home_outlined, color: widget.currentIndex == 0 ? Colors.white : Colors.white54, size: 25,),
            ),
            SizedBox(width: 5,),
            IconButton(
              onPressed: () => _navigateToPage(1),
              icon: Icon(Icons.article_outlined, color: widget.currentIndex == 1 ? Colors.white : Colors.white54, size: 25),
            ),
            SizedBox(width: 5,),
            IconButton(
              onPressed: () => _navigateToPage(2),
              icon: Icon(Icons.location_on_outlined, color: widget.currentIndex == 2 ? Colors.white : Colors.white54, size: 25),
            ),
          ],
        ),
      ),
    );
  }
}
=======
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:proto/botnav.dart';
import 'package:proto/list_artikel.dart';
import 'package:proto/model/artikel.dart';
import 'package:proto/web_view.dart';
import 'package:proto/model/kategori.dart';

class home extends StatelessWidget {
  const home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 8,),
                Container(
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
                  margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Card(
                    color: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Stack(
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            SizedBox(height: 15),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: ListTile(
                                title: Text(
                                  "Selamat Datang!",
                                  style: TextStyle(
                                    fontSize: 21.0,
                                    color: Color.fromARGB(255, 154, 191, 21),
                                    fontWeight: FontWeight.w900,
                                    fontFamily: "Poppins",
                                  ),
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 7,),
                                    RichText(
                                      text: const TextSpan(
                                        style: TextStyle(fontSize: 15.0, color: Color.fromARGB(255, 154, 191, 21)),
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: 'Yuk, belajar waste manajemen\ndan cari bank sampah\nterdekatmu! ',
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontFamily: "Poppins",
                                              color: Color.fromARGB(255, 154, 191, 21),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                        primary: Color.fromARGB(255, 154, 191, 21),
                                        onPrimary: Color.fromARGB(255, 28, 140, 36),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.only(left: 10, right: 10),
                                        child: Text(
                                          'Cari Pengepul',
                                          style: TextStyle(
                                              fontFamily: "Poppins",
                                              fontSize: 11,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600
                                          ),
                                        ),
                                      ),
                                      onPressed: () {/* ... */},
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                          ],
                        ),
                        Positioned(
                          bottom: -1,
                          right: -1,
                          child: Image.asset(
                            'assets/images/homeb.png',
                          ),
                        ),
                        Positioned(
                          bottom: -97,
                          right: -7,
                          child: Transform.scale(
                            scale: 0.4,
                            child: Image.asset(
                              'assets/images/homep.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  margin:
                  EdgeInsets.only(left: 16.0, right: 16.0, top: 2.0, bottom: 2.0),
                  child: const Text(
                    'Materi',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w900,
                      color: Color.fromARGB(255, 154, 191, 21),
                      fontFamily: "WorkSans",
                    ),
                  ),
                ),
                //    2x2 card
                const SizedBox(
                  height: 8,
                ),
                Container(
                  child: FutureBuilder<String>(
                    future: DefaultAssetBundle.of(context)
                        .loadString('assets/json/kategori.json'),
                    builder: (context, snapshot) {
                      final List material = parseKategori(snapshot.data);
                      return SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: material.map((kategori) => _buildKategoriItem(context, kategori)).toList(),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: SizedBox(
                      height: 100, // Set the height of the card here
                      child: Stack(
                        children: [
                          // Image
                          Positioned.fill(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16.0),
                              child: Image.asset(
                                "assets/images/gunung.png",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),

                          Positioned.fill(
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.25),
                                  borderRadius: BorderRadius.circular(16.0)// Adjust the opacity as desired
                              ),
                            ),
                          ),

                          // Name and tema
                          Positioned(
                            top: 10,
                            left: 25,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Yuk, bantu kami meningkatkan ELing\nmenjadi lebih baik!",
                                  style: const TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                                SizedBox(height: 4),
                              ],
                            ),
                          ),

                          // Rounded Button
                          Positioned(
                            bottom: 12,
                            right: 25,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16.0),
                              child: Container(
                                  color: Colors.white,
                                  padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 10, right: 10, top: 3, bottom: 3),
                                    child: Text(
                                      "Ikuti Survey",
                                      style: TextStyle(
                                          fontSize: 11.0,
                                          fontWeight: FontWeight.bold,
                                          color: Color.fromARGB(255, 154, 191, 21),
                                          fontFamily: "Poppins"
                                      ),
                                    ),
                                  )
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  margin:
                  EdgeInsets.only(left: 16.0, right: 16.0, top: 2.0, bottom: 2.0),
                  child: Text(
                    'Bacaan Terbaru',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w900,
                      color: Color.fromARGB(255, 154, 191, 21),
                      fontFamily: "WorkSans",
                    ),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),

                //article card
                Container(
                  margin: EdgeInsets.only(left: 16.0, right: 16.0, top: 1.0),
                  child: FutureBuilder<String>(
                    future: DefaultAssetBundle.of(context)
                        .loadString('assets/json/artikel.json'),
                    builder: (context, snapshot) {
                      final List articles = parseArticles(snapshot.data);
                      return ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: articles.length,
                        itemBuilder: (context, index) {
                          return _buildArticleItem(context, articles[index]!);
                        },
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
              ],
            )),
      ),
      // bottomNavigationBar: CustomBottomNavigationBar(
      //   currentIndex: 0,
      //),
    );
  }

  List parseKategori(String? json) {
    if (json == null) {
      return [];
    }
    final List parsed = jsonDecode(json);
    return parsed.map((json) => Kategori.fromJson(json)).toList();
  }
  List parseArticles(String? json) {
    if (json == null) {
      return [];
    }
    // final List parsed = jsonDecode(json);
    // return parsed.map((json) => Artikel.fromJson(json)).toList();
    final List parsed = jsonDecode(json);
    final List<Artikel> articles =
    parsed.map((json) => Artikel.fromJson(json)).toList();
    final List<Artikel> top3 = articles.reversed
        .take(3)
        .toList(); // menambahkan parameter reversed: true
    return top3;
  }
}

Widget _buildArticleItem(BuildContext context, Artikel article) {
  return Container(
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
                width: 80,
                height: 80,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: Image.asset(
                    'assets/images/logo.png', // Replace with the actual path of your image asset
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
                      Text(
                        article.nama,
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontFamily: "Poppins",
                            fontSize: 12
                        ),
                      ),
                      Text(
                        'tanggal',
                        style: TextStyle(
                          fontSize: 10.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: -5,
            right: 8.0,
            child: TextButton(
              onPressed: () {
              },
              child: Text(
                'Baca Lebih Lanjut',
                style: TextStyle(
                    color: Color.fromARGB(255, 154, 191, 21),
                    decoration: TextDecoration.underline,
                    fontFamily: "Poppins",
                    fontSize: 11,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
Widget _buildKategoriItem(BuildContext context, Kategori kategori) {
  return Container(
    padding: EdgeInsets.only(left: 10),
    child: Column(
      children: [
        SizedBox(height: 8),
        GestureDetector(
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
              child: SizedBox(
                width: 200,
                height: 175,
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16.0),
                        topRight: Radius.circular(16.0),
                      ),
                      child: Image.asset(
                        'assets/images/logo.png',
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: 100,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Align(
                        alignment: Alignment.centerLeft, // Align text to the left
                        child: Text(
                          kategori.jenisKategori,
                          style: TextStyle(
                            color: Color.fromARGB(255, 25, 25, 27),
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Poppins",
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
>>>>>>> Stashed changes
