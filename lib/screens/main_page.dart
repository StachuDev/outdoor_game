import 'package:flutter/material.dart';
import 'package:outdoor_game/screens/author.dart';
import 'package:outdoor_game/screens/start_game.dart';
import 'package:outdoor_game/widgets/main_drawer.dart';

class MainPageScreen extends StatelessWidget {
  const MainPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void selectScreen(String identifier) async {
      Navigator.of(context).pop();
      if (identifier == "start") {
        await Navigator.of(context)
            .push(MaterialPageRoute(builder: (ctx) => const StartGameScreen()));
      } else if (identifier == "author") {
        await Navigator.of(context)
            .push(MaterialPageRoute(builder: (ctx) => const AuthorScreen()));
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Pisz OutDoor Game"),
      ),
      drawer: MainDrawer(
        onSelectScreen: selectScreen,
      ),
      body: ListView(
        children: [
          Image.asset(
            width: 300,
            'assets/images/pisz.jpg',
            fit: BoxFit.cover,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Header",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                      fontSize: 20),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  "the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable.",
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Theme.of(context).colorScheme.onPrimaryContainer),
                ),
              ],
            ),
          ),
          Image.asset(
            width: 300,
            'assets/images/pisz.jpg',
            fit: BoxFit.cover,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Header",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  "the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable.",
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
