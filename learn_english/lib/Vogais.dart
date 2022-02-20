import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class Vogais extends StatefulWidget {
  const Vogais({Key? key}) : super(key: key);

  @override
  _VogaisState createState() => _VogaisState();
}

class _VogaisState extends State<Vogais> {
  AudioCache audioCache = AudioCache(prefix: "assets/audios/");
  AudioPlayer audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double aspectRatio = MediaQuery.of(context).size.aspectRatio * 2;

    _playAudio(String audioName) async {
      await audioCache.play("$audioName.mp3");
    }

    return Container(
      color: Color(0xfff5e9b9),
      child: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: aspectRatio,
        children: [
          GestureDetector(
            onTap: () => _playAudio("1"),
            child: Image.asset("assets/images/1.png"),
          ),
          GestureDetector(
            onTap: () => _playAudio("2"),
            child: Image.asset("assets/images/2.png"),
          ),
          GestureDetector(
            onTap: () => _playAudio("3"),
            child: Image.asset("assets/images/3.png"),
          ),
          GestureDetector(
            onTap: () => _playAudio("4"),
            child: Image.asset("assets/images/4.png"),
          ),
          GestureDetector(
            onTap: () => _playAudio("5"),
            child: Image.asset("assets/images/5.png"),
          ),
          GestureDetector(
            onTap: () => _playAudio("6"),
            child: Image.asset("assets/images/6.png"),
          ),
        ],
      ),
    );
  }
}
