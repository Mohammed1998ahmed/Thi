import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

import '../../../../core/component/conset/Const.dart';

class VideoApp extends StatefulWidget {
  const VideoApp({Key? key, required this.Urlvideo}) : super(key: key);
  final String Urlvideo;

  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;

  @override
  void initState() {
    print(widget.Urlvideo.toString() + "PPPPPPPPPPPPPPPPP");
    super.initState();
    _videoPlayerController = VideoPlayerController.networkUrl(
        Uri.parse(ImagesPath.toString() + widget.Urlvideo.toString()));
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: true,
      looping: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(),
      body: Center(
        child: _chewieController != null &&
                _chewieController.videoPlayerController.value.isInitialized
            ? Chewie(controller: _chewieController)
            : Center(child: CircularProgressIndicator()),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {
          setState(() {
            _chewieController.videoPlayerController.value.isPlaying
                ? _chewieController.pause()
                : _chewieController.play();
          });
        },
        child: Icon(
          _chewieController.videoPlayerController.value.isPlaying
              ? Icons.pause
              : Icons.play_arrow,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }
}
