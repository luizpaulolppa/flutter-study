import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  AudioCache audioCache = AudioCache(prefix: "assets/audios/");
  AudioPlayer audioPlayer = AudioPlayer();
  bool primeiraExecucao = true;
  double volume = 0.5;

  executar() async {
    audioPlayer.setVolume(volume);

    if (primeiraExecucao) {
      audioPlayer = await audioCache.play("musica.mp3");
      primeiraExecucao = false;
    } else {
      await audioPlayer.resume();
    }

    // String url =
    //     "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3";
    // await audioPlayer.play("");
  }

  pausar() async {
    audioPlayer.pause();
  }

  parar() async {
    audioPlayer.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Executando sons"),
      ),
      body: Column(
        children: [
          Slider(
            value: volume,
            min: 0,
            max: 1,
            divisions: 10,
            onChanged: (novoVolume) {
              setState(() {
                volume = novoVolume;
              });
              audioPlayer.setVolume(novoVolume);
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(8),
                child: GestureDetector(
                  child: Image.asset("assets/images/executar.png"),
                  onTap: () => executar(),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: GestureDetector(
                  child: Image.asset("assets/images/pausar.png"),
                  onTap: () => pausar(),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: GestureDetector(
                  child: Image.asset("assets/images/parar.png"),
                  onTap: () => parar(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
