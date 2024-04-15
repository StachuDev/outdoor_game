import 'package:flutter/material.dart';
import 'package:outdoor_game/widgets/level_tile.dart';

class StartGameScreen extends StatelessWidget {
  const StartGameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Wybierz poziom trudności"),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            LevelTile(
              imagePath: "assets/images/easy_level.jpg",
              onTap: () {},
              label: "ŁATWY",
            ),
            LevelTile(
              imagePath: "assets/images/hard_level.jpg",
              onTap: () {},
              label: "TRUDNY",
            ),
          ],
        ),
      ),
    );
  }
}
