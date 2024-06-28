import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() => runApp(const Xylophone());

//SoundBox Widget
class SoundBar extends StatelessWidget {
  final int audiofileNumber;
  final Color barBackColor;

  const SoundBar({required this.audiofileNumber, required this.barBackColor});

  void audioPlayer() async {
    final AudioPlayer player = AudioPlayer();
    //await player.stop();
    await player.play(AssetSource('note$audiofileNumber.wav'));
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: audioPlayer,
        child: Container(
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: barBackColor,
          ),
        ),
      ),
    );
  }
}

//Main Xylophone Widget
class Xylophone extends StatelessWidget {
  const Xylophone({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              SoundBar(audiofileNumber: 1, barBackColor: Colors.red),
              SoundBar(audiofileNumber: 2, barBackColor: Colors.orange),
              SoundBar(audiofileNumber: 3, barBackColor: Colors.yellow),
              SoundBar(audiofileNumber: 4, barBackColor: Colors.green),
              SoundBar(audiofileNumber: 5, barBackColor: Colors.teal),
              SoundBar(audiofileNumber: 7, barBackColor: Colors.blue),
              SoundBar(audiofileNumber: 8, barBackColor: Colors.purple),
            ],
          ),
        ),
      ),
    );
  }
}
