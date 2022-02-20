import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  VideoPlayerController? _controller;

  @override
  void initState() {
    super.initState();
    // _controller = VideoPlayerController.network(
    //   "https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_1mb.mp4",
    // )..initialize().then((_) {
    //     setState(() {
    //       _controller?.play();
    //     });
    //   });

    _controller = VideoPlayerController.asset(
      "assets/videos/sample_video.mp4",
    )
      ..setLooping(true)
      ..initialize().then((_) {
        setState(() {
          // _controller!.play();
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Executando vídeos"),
      ),
      body: _controller!.value.isInitialized
          ? AspectRatio(
              aspectRatio: _controller!.value.aspectRatio,
              child: VideoPlayer(_controller!),
            )
          : const Text("Pressione Play"),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _controller!.value.isPlaying
                ? _controller!.pause()
                : _controller!.play();
          });
        },
        child: Icon(
          _controller!.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }
}
