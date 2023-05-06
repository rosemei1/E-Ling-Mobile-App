import 'package:flutter/material.dart';
import 'package:proto/bottombar.dart';
import 'package:proto/list_pengepul.dart';
import 'package:proto/model/pengepul.dart';

class DetailPengepul extends StatefulWidget{
  final Pengepul pengepul;


  const DetailPengepul({super.key, required this.pengepul});


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
          onPressed: () => Navigator.of(context).pop(),

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
                    widget.pengepul.nama,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Poppins",
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
                  height: 178,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                     widget.pengepul.gambar,
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
                  widget.pengepul.alamat,
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
                 widget.pengepul.ketersediaan,
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
                  widget.pengepul.kontak,
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
                        child: Image.network(
                          "https://cdn-2.tstatic.net/surabaya/foto/bank/images/sampah-daur-ulang-dimanfaatkan-warga-kampung-di-rt-1-rw-3-kelurahan-jambangan.jpg",
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