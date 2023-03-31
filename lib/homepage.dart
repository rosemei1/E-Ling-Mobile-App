import 'package:flutter/material.dart';
import 'package:proto/list_artikel.dart';


class Artikel extends StatelessWidget {
  const Artikel ({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 150,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 2 - 24,
                      child: Image.asset('assets/images/logo.png'),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 2 - 24,
                      child: Image.asset('assets/images/earth.png'),
                    ),
                  ],
                ),
              ),
              //selamat datang
              Container(
                margin: EdgeInsets.only(left: 16.0, right: 16.0, top: 2.0, bottom: 2.0),
                child: Text(
                  'Selamat datang, Darla!',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color:Colors.black54, fontFamily: "Poppins",),
                ),
              ),
              //card pertama
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    border: Border.all(color: Colors.black54, width: 1.0),
                  ),
                  child: Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ListTile(
                          title: RichText(
                            text: TextSpan(
                              style: TextStyle(fontSize: 16.0, color: Colors.black),
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'Platform edukasi ',
                                  style: TextStyle(color: Color.fromARGB(
                                      255, 28, 140, 36), fontSize: 20, fontWeight: FontWeight.bold, fontFamily: "Poppins",),
                                ),
                                TextSpan(
                                  text: 'Lingkungan',
                                  style: TextStyle(color: Color.fromARGB(
                                      255, 154, 191, 21), fontSize: 20, fontWeight: FontWeight.bold, fontFamily: "Poppins",),
                                ),
                              ],
                            ),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 10),
                              RichText(
                                text: TextSpan(
                                  style: TextStyle(fontSize: 15.0, color: Colors.black),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: 'Yuk, mulai perjalananmu belajar ',
                                      style: TextStyle(fontSize: 15, fontFamily: "Poppins",),
                                    ),
                                    TextSpan(
                                      text: 'waste management !',
                                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, fontFamily: "Poppins",),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            const SizedBox(width: 8),
                            TextButton(
                              child: const Text('Selengkapnya', style: TextStyle(fontFamily: "Poppins", fontSize: 13, color: Colors.black54),),
                              onPressed: () {/* ... */},
                            ),
                            const SizedBox(width: 8),
                          ],
                        ),
                      ],
                    ),
                  ),
              ),
              //divider
              // Container(
              //   margin: EdgeInsets.symmetric(horizontal: 16),
              //   child: const Divider(
              //     color: Colors.grey,
              //     height: 20,
              //     thickness: 1,
              //     indent: 20,
              //     endIndent: 16,
              //   ),
              // ),
              //topik
              Container(
                margin: EdgeInsets.only(left: 16.0, right: 16.0, top: 2.0, bottom: 2.0),
                child: Text(
                  'Topik',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color:Color.fromARGB(255, 154, 191, 21), fontFamily: "Poppins",),
                ),
              ),
              //    2x2 card
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NewsListPage()
                          )
                      );
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      color:Color.fromARGB(255, 28, 140, 36),
                      child: SizedBox(
                        width: 160,
                        height: 125,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.assessment_outlined,
                                size: 40,
                                color: Colors.white,
                              ),
                              SizedBox(height: 5),
                              Text('Waste Management',
                                  style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.normal,
                                      fontFamily: "Poppins",
                                      color:Colors.white),
                                  textAlign: TextAlign.center
                              ),
                            ]
                        ),
                      ),
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    color:Color.fromARGB(255, 28, 140, 36),
                    child: SizedBox(
                      width: 160,
                      height: 125,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.delete_outline,
                              size: 40,
                              color: Colors.white,
                            ),
                            SizedBox(height: 5),
                            Text('Jenis Sampah',
                              style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.normal,
                                  fontFamily: "Poppins",
                                  color:Colors.white),
                                textAlign: TextAlign.center
                            ),
                          ]
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    color:Color.fromARGB(255, 28, 140, 36),
                    child: SizedBox(
                      width: 160,
                      height: 125,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.settings_outlined,
                              size: 40,
                              color: Colors.white,
                            ),
                            SizedBox(height: 5),
                            Text('Teknik Pengolahan\nSampah',
                              style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.normal,
                                  fontFamily: "Poppins",
                                  color:Colors.white),
                                textAlign: TextAlign.center,
                            ),
                          ]
                      ),
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    color:Color.fromARGB(255, 28, 140, 36),
                    child: SizedBox(
                      width: 160,
                      height: 125,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.wb_sunny_outlined,
                              size: 40,
                              color: Colors.white,
                            ),
                            SizedBox(height: 5),
                            Text('Prinsip Pengolahan\nSampah',
                              style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.normal,
                                  fontFamily: "Poppins",
                                  color:Colors.white,
                              ),
                                textAlign: TextAlign.center
                            ),
                        ]
                      ),
                    ),
                  ),
                ],
              ),
              //divider
              // Container(
              //   margin: EdgeInsets.symmetric(horizontal: 16),
              //   child: const Divider(
              //     color: Colors.grey,
              //     height: 20,
              //     thickness: 1,
              //     indent: 20,
              //     endIndent: 16,
              //   ),
              // ),
              //bacaan terbaru
              Container(
                margin: EdgeInsets.only(left: 16.0, right: 16.0, top: 2.0, bottom: 2.0),
                child: Text(
                  'Bacaan Terbaru',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color:Color.fromARGB(255, 154, 191, 21), fontFamily: "Poppins",),
                ),
              ),
              //article card
              Container(
                margin: EdgeInsets.only(left: 16.0, right: 16.0, top: 1.0),
                child: Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        title: Text('The Enchanted Nightingale'),
                        subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          TextButton(
                            child: const Text('BUY TICKETS'),
                            onPressed: () {/* ... */},
                          ),
                          const SizedBox(width: 8),
                          TextButton(
                            child: const Text('LISTEN'),
                            onPressed: () {/* ... */},
                          ),
                          const SizedBox(width: 8),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
      ),
    );
  }
}
