import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.switchScreen, {super.key});
  final void Function() switchScreen;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Opacity(
            opacity: 0.4,
            child: Image.asset(
              "assets/images/quiz_logo.png",
              height: 250,
              width: 250,
            ),
          ),
          const Divider(height: 25),
          const Text(
            "Learn flutter the fun way!",
            style: TextStyle(
                fontSize: 18,
                color: Color.fromARGB(255, 244, 241, 241),
                backgroundColor: Colors.transparent),
          ),
          const Divider(height: 15),
          OutlinedButton.icon(
            style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
            label: const Text(
              "start quizz",
              style: TextStyle(fontSize: 15),
            ),
            onPressed: switchScreen,
            icon: const Icon(Icons.arrow_right),
          ),
        ],
      ),
    );
  }
}
