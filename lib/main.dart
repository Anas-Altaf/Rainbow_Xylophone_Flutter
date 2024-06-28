import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() => runApp(const Xylophone());

//SoundBox Widget
class SoundBar extends StatelessWidget {
  final String audiofilePath;
  final Color barBackColor;

  const SoundBar({required this.audiofilePath, required this.barBackColor});

  void audioPlayer() async {
    final AudioPlayer player = AudioPlayer();
    await player.stop();
    await player.play(AssetSource(audiofilePath));
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
              SoundBar(audiofilePath: 'note1.wav', barBackColor: Colors.red),
              SoundBar(audiofilePath: 'note2.wav', barBackColor: Colors.orange),
              SoundBar(audiofilePath: 'note3.wav', barBackColor: Colors.yellow),
              SoundBar(audiofilePath: 'note4.wav', barBackColor: Colors.green),
              SoundBar(audiofilePath: 'note5.wav', barBackColor: Colors.teal),
              SoundBar(audiofilePath: 'note6.wav', barBackColor: Colors.blue),
              SoundBar(audiofilePath: 'note7.wav', barBackColor: Colors.purple),
            ],
          ),
        ),
      ),
    );
  }
}
