import 'package:flutter/material.dart';
import 'package:proto/list_artikel.dart';
import 'package:proto/topek.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ViewYoutube extends StatefulWidget {
  //final String videoId;
  final String url;
  final int id;
  final String desc;
  final String nama;
  const ViewYoutube({required this.url, required this.id, required this.desc, required this.nama});

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
        title: Padding(
          padding: const EdgeInsets.only(top:15.0),
          child: const Text(
            "Video Materi",
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
          margin: EdgeInsets.only(left: 12, top: 12), // Adjust the margin values as needed
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 75,
                height: 75,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(13), // Adjust the border radius as needed
                  color: Color.fromARGB(255, 154, 191, 21),
                ),
              ),
              IconButton(
                color: Colors.white,
                icon: Icon(Icons.arrow_back, size: 25,),
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
                    Text(
                      widget.nama,
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 14,
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
                                text: widget.desc,
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
