import 'package:flutter/material.dart';
import 'package:proto/bottombar.dart';
import 'package:proto/homepage.dart';

class topikList extends StatelessWidget {
  const topikList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("Topik", style: TextStyle(fontWeight: FontWeight.bold,color:Color.fromARGB(255, 154, 191, 21), fontFamily: "WorkSans",),),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          color: Color.fromARGB(255, 154, 191, 21),
          icon: Icon(Icons.arrow_back),
          onPressed: (){
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
                        title: Text('Ayo Berikan Masukanu!', style: TextStyle(color: Color.fromARGB(255, 28, 140, 36), fontSize: 20, fontWeight: FontWeight.bold, fontFamily: "Poppins",)),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10),
                            RichText(
                              text:const TextSpan(
                                style: TextStyle(fontSize: 15.0, color: Colors.black),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'Dengan mengisi survei singkat ini kamu membantu ELing untuk menyebarkan ',
                                    style: TextStyle(fontSize: 14, fontFamily: "Poppins",),
                                  ),
                                  TextSpan(
                                    text: 'Edukasi Lingkungan.',
                                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, fontFamily: "Poppins",),
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
                            child: const Text('Ikuti Survey!', style: TextStyle(fontFamily: "Poppins", fontSize: 13, color: Colors.black54, fontWeight: FontWeight.bold),),
                            onPressed: () {/* ... */},
                          ),
                          const SizedBox(width: 8),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),

                child: Card(
                  color:Color.fromARGB(255, 28, 140, 36),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      SizedBox(height: 10),
                      ListTile(
                        title: Text('Waste Management', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold, fontFamily: "Poppins",)),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10),
                            RichText(
                              text:const TextSpan(
                                style: TextStyle(fontSize: 15.0, color: Colors.black),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'Pengelolaan sampah adalah pengumpulan, pengangkutan, pengolahan ...',
                                    style: TextStyle(fontSize: 14, fontFamily: "Poppins", color: Colors.white),
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
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)
                                ),
                                primary: Colors.white,
                                onPrimary: Color.fromARGB(255, 28, 140, 36)
                            ),
                            onPressed: (){},
                            child: const Padding(
                                padding: EdgeInsets.symmetric(vertical: 8.0),
                                child: Text('Pelajari', style: TextStyle(fontFamily: "Poppins", fontSize: 13, fontWeight: FontWeight.bold),)
                            ),
                          ),
                          const SizedBox(width: 25),
                        ],
                      ),
                      const SizedBox(height: 8)
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),

                child: Card(
                  color:Color.fromARGB(255, 28, 140, 36),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      SizedBox(height: 10),
                      ListTile(
                        title: Text('Jenis Sampah', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold, fontFamily: "Poppins",)),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10),
                            RichText(
                              text:const TextSpan(
                                style: TextStyle(fontSize: 15.0, color: Colors.black),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'Pengelolaan sampah adalah pengumpulan, pengangkutan, pengolahan ...',
                                    style: TextStyle(fontSize: 14, fontFamily: "Poppins", color: Colors.white),
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
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)
                                ),
                                primary: Colors.white,
                                onPrimary: Color.fromARGB(255, 28, 140, 36)
                            ),
                            onPressed: (){},
                            child: const Padding(
                                padding: EdgeInsets.symmetric(vertical: 8.0),
                                child: Text('Pelajari', style: TextStyle(fontFamily: "Poppins", fontSize: 13, fontWeight: FontWeight.bold),)
                            ),
                          ),
                          const SizedBox(width: 25),
                        ],
                      ),
                      const SizedBox(height: 8)
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),

                child: Card(
                  color:Color.fromARGB(255, 28, 140, 36),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      SizedBox(height: 10),
                      ListTile(
                        title: Text('Topik Pengolahan Sampah', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold, fontFamily: "Poppins",)),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10),
                            RichText(
                              text:const TextSpan(
                                style: TextStyle(fontSize: 15.0, color: Colors.black),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'Pengelolaan sampah adalah pengumpulan, pengangkutan, pengolahan ...',
                                    style: TextStyle(fontSize: 14, fontFamily: "Poppins", color: Colors.white),
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
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)
                                ),
                                primary: Colors.white,
                                onPrimary: Color.fromARGB(255, 28, 140, 36)
                            ),
                            onPressed: (){},
                            child: const Padding(
                                padding: EdgeInsets.symmetric(vertical: 8.0),
                                child: Text('Pelajari', style: TextStyle(fontFamily: "Poppins", fontSize: 13, fontWeight: FontWeight.bold),)
                            ),
                          ),
                          const SizedBox(width: 25),
                        ],
                      ),
                      const SizedBox(height: 8)
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),

                child: Card(
                  color:Color.fromARGB(255, 28, 140, 36),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      SizedBox(height: 10),
                      ListTile(
                        title: Text('Prinsip Pengolahan Sampah', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold, fontFamily: "Poppins",)),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10),
                            RichText(
                              text:const TextSpan(
                                style: TextStyle(fontSize: 15.0, color: Colors.black),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'Pengelolaan sampah adalah pengumpulan, pengangkutan, pengolahan ...',
                                    style: TextStyle(fontSize: 14, fontFamily: "Poppins", color: Colors.white),
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
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)
                                ),
                                primary: Colors.white,
                                onPrimary: Color.fromARGB(255, 28, 140, 36)
                            ),
                            onPressed: (){},
                            child: const Padding(
                                padding: EdgeInsets.symmetric(vertical: 8.0),
                                child: Text('Pelajari', style: TextStyle(fontFamily: "Poppins", fontSize: 13, fontWeight: FontWeight.bold),)
                            ),
                          ),
                          const SizedBox(width: 25),
                        ],
                      ),
                      const SizedBox(height: 8)
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
