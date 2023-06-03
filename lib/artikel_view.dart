import 'package:flutter/material.dart';
import 'package:proto/list_artikel.dart';
import 'package:proto/topek.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:proto/model/artikel.dart';

class ViewArtikel extends StatefulWidget {
  //final String videoId;
  final Art artikel;
  const ViewArtikel({required this.artikel});

  @override
  _ViewArtikelState createState() => _ViewArtikelState();
}

class _ViewArtikelState extends State<ViewArtikel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: const Text(
            "Artikel Materi",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 154, 191, 21),
              fontFamily: "WorkSans",
              fontSize: 22,
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        leading: Container(
          margin: EdgeInsets.only(
              left: 12, top: 12), // Adjust the margin values as needed
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 75,
                height: 75,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(
                      13), // Adjust the border radius as needed
                  color: Color.fromARGB(255, 154, 191, 21),
                ),
              ),
              IconButton(
                color: Colors.white,
                icon: Icon(
                  Icons.arrow_back,
                  size: 25,
                ),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black54,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        widget.artikel.nama,
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: LayoutBuilder(
                          builder: (context, constraints) {
                            final maxWidth = constraints.maxWidth;
                            final desiredWidth = maxWidth * 1;
                            final aspectRatio = 16 / 9;

                            final calculatedHeight = desiredWidth / aspectRatio;

                            return Image.network(
                              widget.artikel.foto,
                              width: desiredWidth,
                              height: calculatedHeight,
                              fit: BoxFit.cover,
                            );
                          },
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                children: <Widget>[
                  ListTile(
                    title: Text('Deskripsi',
                        style: TextStyle(
                          color: Color.fromARGB(255, 154, 191, 21),
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Poppins",
                        )),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10),
                        RichText(
                          textAlign: TextAlign.justify,
                          text: TextSpan(
                            style: TextStyle(
                                fontSize: 15.0, color: Colors.black54),
                            children: <TextSpan>[
                              TextSpan(
                                text: widget.artikel.deskripsiPanjang,
                                style: TextStyle(
                                  fontSize: 13,
                                  fontFamily: "Poppins",
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
