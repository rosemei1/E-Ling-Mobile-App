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
        mute: false,
        loop: true,
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
                        child: GestureDetector(
                          onDoubleTapDown: (details) {
                            // Get the position of the tap
                            final doubleTapPosition = details.localPosition.dx;

                            // Get the width of the player
                            final playerWidth = MediaQuery.of(context).size.width;

                            // Calculate the time to be skipped based on the tap position
                            final skipDuration = const Duration(seconds: 10);

                            // Check if the tap is on the left or right side of the player
                            if (doubleTapPosition <= playerWidth / 2) {
                              // Skip backward
                              _controller.seekTo(_controller.value.position - skipDuration);
                            } else {
                              // Skip forward
                              _controller.seekTo(_controller.value.position + skipDuration);
                            }
                          },
                          child: YoutubePlayer(
                            controller: _controller,
                            showVideoProgressIndicator: true,
                            onReady: () {
                              debugPrint('Player is ready');
                              _controller.play();
                            },
                            bottomActions: [
                              CurrentPosition(),
                              ProgressBar(
                                isExpanded: true,
                                colors: const ProgressBarColors(
                                  playedColor: Colors.green,
                                  handleColor: Colors.green,
                                ),
                              ),

                              RemainingDuration(),
                              // PlaybackSpeedButton(),
                              // FullScreenButton()
                            ],
                          ),
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
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Poppins",
                        )),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10),
                        RichText(
                          text: TextSpan(
                            style: TextStyle(
                                fontSize: 15.0, color: Colors.black54),
                            children: <TextSpan>[
                              TextSpan(
                                text: widget.desc,
                                style: TextStyle(
                                  fontSize: 10,
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
