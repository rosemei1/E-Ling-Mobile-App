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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Pusat Daur Ulang Jambangan',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              height: 200,
              child: Image.asset(
                'assets/images/pengepul_image.png',
                fit: BoxFit.cover,
              ),
            ),
            Divider(color: Colors.black),
            SizedBox(height: 16),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Alamat',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 8),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'MPM8+2PJ, Jambangan, Kec. Jambangan, Kota SBY, Jawa Timur 60232',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
            Divider(color: Colors.black),
            SizedBox(height: 16),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Ketersediaan',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 8),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Senin - Sabtu',
              ),
            ),
            Divider(color: Colors.black),
            SizedBox(height: 16),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Kontak',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 8),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Telepon ',
              ),
            ),
            Divider(color: Colors.black),
            SizedBox(height: 16),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Gallery',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 8),
            SizedBox(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(width: 16),
                  Image.asset(
                    'assets/images/related_image_1.png',
                    width: 100,
                    height: 100,
                  ),
                  SizedBox(width: 16),
                  Image.asset(
                    'assets/images/related_image_2.png',
                    width: 100,
                    height: 100,
                  ),
                  SizedBox(width: 16),
                  Image.asset(
                    'assets/images/related_image_3.png',
                    width: 100,
                    height: 100,
                  ),
                  SizedBox(width: 16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
