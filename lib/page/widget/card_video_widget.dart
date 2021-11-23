import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_app/model/data_model.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class CardVideoWidget extends StatefulWidget {
  final DataModel data;

  const CardVideoWidget({Key? key, required this.data}) : super(key: key);

  @override
  State<CardVideoWidget> createState() => _CardVideoWidgetState();
}

class _CardVideoWidgetState extends State<CardVideoWidget> {
  late YoutubePlayerController _controller;

  void runYoutubePlayer() {
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(widget.data.url).toString(),
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: false,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    runYoutubePlayer();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void deactivate() {
    _controller.pause();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      onExitFullScreen: () {
        // The player forces portraitUp after exiting fullscreen. This overrides the behaviour.
        SystemChrome.setPreferredOrientations(DeviceOrientation.values);
      },
      player: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
        progressIndicatorColor: Colors.blue,
        topActions: <Widget>[
          const SizedBox(width: 8.0),
          Expanded(
            child: Text(
              _controller.metadata.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.settings,
              color: Colors.white,
              size: 25.0,
            ),
            onPressed: () {
              log('Settings Tapped!');
            },
          ),
        ],
      ),
      builder: (context, player) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10),
          Text(
            widget.data.name,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 20),
          player,
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
