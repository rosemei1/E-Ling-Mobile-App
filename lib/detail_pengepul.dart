import 'package:flutter/material.dart';

class DetailPengepul extends StatefulWidget{

  @override
  _ViewDetailPengepul createState() => _ViewDetailPengepul();
}

class _ViewDetailPengepul extends State<DetailPengepul> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          "Pengepul",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 154, 191, 21),
            fontFamily: "Poppins",
            fontSize: 22,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          color: Color.fromARGB(255, 154, 191, 21),
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //       builder: (context) => NewsListPage(id: widget.id)),
            // );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10.0),
                  child: Text(
                    'Pusat Daur Ulang Jambangan',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
                  height: 178,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      'assets/images/jambangan.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                SizedBox(height: 8),
                Divider(color: Colors.black),
                SizedBox(height: 10),
                Text(
                  'Alamat',
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'MPM8+2PJ, Jambangan, Kec. Jambangan, Kota SBY, Jawa Timur 60232',
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 12,
                  ),
                ),
                SizedBox(height: 8),
                Divider(color: Colors.black),
                Text(
                  'Ketersediaan',
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  'Senin - Sabtu ',
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 12,
                  ),
                ),
                SizedBox(height: 6),
                Divider(color: Colors.black),
                Text(
                  'Kontak',
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  'Telepon',
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 12,
                  ),
                ),
                SizedBox(height: 6),
                Divider(color: Colors.black),


                Text(
                  'Gallery',
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                SizedBox(
                  height: 80,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [

                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'assets/images/jambangan.jpg',
                          fit: BoxFit.cover,
                          width: 118,
                          height: 222,
                        ),
                      ),
                      SizedBox(width: 16),

                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}