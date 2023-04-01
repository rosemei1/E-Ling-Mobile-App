import 'package:flutter/material.dart';
import 'package:proto/list_artikel.dart';
import 'package:proto/topek.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ViewYoutube extends StatefulWidget {
  //final String videoId;
  final String url;
  final int id;
  const ViewYoutube({required this.url, required this.id});

  @override
  _ViewYoutubeState createState() => _ViewYoutubeState();
}

class _ViewYoutubeState extends State<ViewYoutube> {
  late final videoURL = widget.url;

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
        title: const Text(
          "Video Materi",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 154, 191, 21),
            fontFamily: "Poppins",
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
              MaterialPageRoute(
                  builder: (context) => NewsListPage(id: widget.id)),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
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
                    Text(
                      'Apa sih Waste Management?',
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: YoutubePlayer(
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
                          color: Color.fromARGB(255, 28, 140, 36),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Poppins",
                        )),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10),
                        RichText(
                          text: const TextSpan(
                            style: TextStyle(
                                fontSize: 15.0, color: Colors.black54),
                            children: <TextSpan>[
                              TextSpan(
                                text:
                                    'Pengelolaan sampah adalah pengumpulan, pengangkutan, pengolahan, mendaur ulang dari material sampah. Kalimat ini biasanya mengacu pada material sampah yang dihasilkan dari kegiatan manusia, dan biasanya dikelola untuk mengurangi dampaknya terhadap kesehatan, lingkungan, atau estetika. Pengelolaan sampah juga dilakukan untuk memulihkan sumber daya alam (resources recovery). Pengelolaan sampah bisa melibatkan zat padat, cair, gas, atau radioaktif dengan metode dan keterampilan khusus untuk masing-masing jenis zat. Praktik pengelolaan sampah berbeda beda antara negara maju dan negara berkembang, berbeda juga antara daerah perkotaan dengan daerah pedesaan dan antara daerah perumahan dengan daerah industri. Pengelolaan sampah yang tidak berbahaya dari pemukiman dan institusi di area metropolitan biasanya menjadi tanggung jawab pemerintah daerah, sedangkan untuk sampah dari area komersial dan industri biasanya ditangani oleh perusahaan pengolah sampah. Metode pengelolaan sampah berbeda-beda tergantung banyak hal, di antaranya tipe zat sampah, lahan yang digunakan untuk mengolah, dan ketersediaan lahan',
                                style: TextStyle(
                                  fontSize: 14,
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
