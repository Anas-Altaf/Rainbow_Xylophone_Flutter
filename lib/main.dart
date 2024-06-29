import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() => runApp(const Xylophone());

//Sound Player
void audioPlayer({required audiofileNumber}) async {
  final AudioPlayer player = AudioPlayer();
  //await player.stop();
  await player.play(AssetSource('note$audiofileNumber.wav'));
}

//<================= 1st Way [Efficient] ================>
// => Use with 'const' Material App
//SoundBox Widget
class SoundBar extends StatelessWidget {
  final int audiofileNumber;
  final Color barBackColor;

  const SoundBar({required this.audiofileNumber, required this.barBackColor});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {
          audioPlayer(audiofileNumber: audiofileNumber);
        },
        child: Container(
          decoration: BoxDecoration(
            color: barBackColor,
          ),
        ),
      ),
    );
  }
}

//<================= 2nd Way ================>
// => Use without 'const' in Material App
//SoundBox Function
// Expanded SoundBar({required audiofileNumber, required barBackColor}) {
//   return Expanded(
//     child: InkWell(
//       onTap: () {
//         audioPlayer(audiofileNumber: audiofileNumber);
//       },
//       child: Container(
//         decoration: BoxDecoration(
//           color: barBackColor,
//         ),
//       ),
//     ),
//   );
// }

//Main Xylophone Widget
class Xylophone extends StatelessWidget {
  const Xylophone({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
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
