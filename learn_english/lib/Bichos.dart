import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class Bichos extends StatefulWidget {
  const Bichos({Key? key}) : super(key: key);

  @override
  _BichosState createState() => _BichosState();
}

class _BichosState extends State<Bichos> {
  AudioCache audioCache = AudioCache(prefix: "assets/audios/");
  AudioPlayer audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    // audioCache.loadAll([
    //   "cao.mp3",
    //   "dato.mp3",
    //   "leao.mp3",
    //   "macaco.mp3",
    //   "ovelha.mp3",
    //   "vaca.mp3",
    // ]);
  }

  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;
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
            onTap: () => _playAudio("cao"),
            child: Image.asset("assets/images/cao.png"),
          ),
          GestureDetector(
            onTap: () => _playAudio("gato"),
            child: Image.asset("assets/images/gato.png"),
          ),
          GestureDetector(
            onTap: () => _playAudio("leao"),
            child: Image.asset("assets/images/leao.png"),
          ),
          GestureDetector(
            onTap: () => _playAudio("macaco"),
            child: Image.asset("assets/images/macaco.png"),
          ),
          GestureDetector(
            onTap: () => _playAudio("ovelha"),
            child: Image.asset("assets/images/ovelha.png"),
          ),
          GestureDetector(
            onTap: () => _playAudio("vaca"),
            child: Image.asset("assets/images/vaca.png"),
          ),
        ],
      ),
    );
  }
}
