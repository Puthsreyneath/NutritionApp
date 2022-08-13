import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPage extends StatefulWidget {
  final  name, videoUrl;
  VideoPage({ this.name, this.videoUrl});

  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  late YoutubePlayerController _controller;
  late PlayerState _playerState;
  late YoutubeMetaData _videoMetaData;
  bool _isPlayerReady = false;
  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId:  YoutubePlayer.convertUrlToId(widget.videoUrl)!,
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
        captionLanguage: 'en',
        enableCaption: true,
      ),
    )..addListener(listener);
    _videoMetaData = const YoutubeMetaData();
    _playerState = PlayerState.unknown;
  }
  void listener() {
    if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
      setState(() {
        _playerState = _controller.value.playerState;
        _videoMetaData = _controller.metadata;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.name),),
      body: ListView(
        children: [
          Container(
            child: YoutubePlayerBuilder(
              player: YoutubePlayer(
                controller: _controller,
                showVideoProgressIndicator: true,
                progressIndicatorColor: Colors.amber,
                progressColors: ProgressBarColors(
                  playedColor: Colors.amber,
                  handleColor: Colors.amberAccent,
                ),
                onReady: () {
                  _isPlayerReady = true;
                },
              ),
              builder: (context, player) => player,
            ),
          ),
          SizedBox(height: 20,),
          Padding(
              padding: const EdgeInsets.all(10),
              child: Text(_videoMetaData.title,style: TextStyle(fontSize: 18, color: Colors.blue),)
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text('From channel: ${_videoMetaData.author}',style: TextStyle(fontSize: 16, color: Colors.redAccent),),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text('Duration: ${_videoMetaData.duration}',style: TextStyle(fontSize: 16, color: Colors.teal),),
          ),
        ],
      ),
    );
  }
}
