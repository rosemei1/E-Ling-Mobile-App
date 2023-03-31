import 'package:flutter/material.dart';
import 'package:proto/topek.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ViewYoutube extends StatefulWidget {
  //final String videoId;

  const ViewYoutube({super.key});

  @override
  _ViewYoutubeState createState() => _ViewYoutubeState();
}

class _ViewYoutubeState extends State<ViewYoutube> {
  final videoURL = "https://www.youtube.com/watch?v=YMx8Bbev6T4";

  late YoutubePlayerController _controller;
  @override
  void initState() {
    final videoID = YoutubePlayer.convertUrlToId(videoURL);
    _controller = YoutubePlayerController(
      initialVideoId: videoID!,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("Video Materi", style: TextStyle(fontWeight: FontWeight.bold,color:Color.fromARGB(255, 154, 191, 21), fontFamily: "Poppins",),),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          color: Color.fromARGB(255, 154, 191, 21),
          icon: Icon(Icons.arrow_back),
          onPressed: (){Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => topikList()),
          );
          },
        ),
      ),
      body: SafeArea(
        child: Column(
         // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric( vertical: 8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                border: Border.all(color: Colors.black54, width: 1.0),
              ),
              child: Column(
                children: [
                  Text('Apa sih Waste Management?',
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.left,
                    ),
                  YoutubePlayer(
                    controller: _controller,
                    showVideoProgressIndicator: true,
                    onReady: () => debugPrint('Ready'),
                    bottomActions: [
                      CurrentPosition(),
                      ProgressBar(
                        isExpanded: true,
                        colors: const ProgressBarColors(
                          playedColor: Colors.green,
                          handleColor: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                children: <Widget>[
                  ListTile(
                    title: Text('Deskripsi', style: TextStyle(color: Color.fromARGB(255, 28, 140, 36), fontSize: 20, fontWeight: FontWeight.bold, fontFamily: "Poppins",)),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10),
                        RichText(
                          text:const TextSpan(
                            style: TextStyle(fontSize: 15.0, color: Colors.green),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Pengelolaan sampah adalah pengumpulan, pengangkutan, pengolahan, mendaur ulang dari material sampah. Kalimat ini biasanya mengacu pada material sampah yang dihasilkan dari kegiatan manusia, dan biasanya dikelola untuk mengurangi dampaknya terhadap kesehatan, lingkungan, atau estetika. Pengelolaan sampah juga dilakukan untuk memulihkan sumber daya alam (resources recovery). Pengelolaan sampah bisa melibatkan zat padat, cair, gas, atau radioaktif dengan metode dan keterampilan khusus untuk masing-masing jenis zat. Praktik pengelolaan sampah berbeda beda antara negara maju dan negara berkembang, berbeda juga antara daerah perkotaan dengan daerah pedesaan dan antara daerah perumahan dengan daerah industri. Pengelolaan sampah yang tidak berbahaya dari pemukiman dan institusi di area metropolitan biasanya menjadi tanggung jawab pemerintah daerah, sedangkan untuk sampah dari area komersial dan industri biasanya ditangani oleh perusahaan pengolah sampah. Metode pengelolaan sampah berbeda-beda tergantung banyak hal, di antaranya tipe zat sampah, lahan yang digunakan untuk mengolah, dan ketersediaan lahan',
                                style: TextStyle(fontSize: 14, fontFamily: "Poppins",),
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
