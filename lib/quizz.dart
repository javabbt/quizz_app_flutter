import 'package:flutter/material.dart';
import 'package:quizz_app_flutter/questions_screen.dart';
import 'package:quizz_app_flutter/result_screen.dart';
import 'package:quizz_app_flutter/start_screen.dart';

import 'data/questions.dart';

class Quizz extends StatefulWidget {
  const Quizz({super.key});

  @override
  State<Quizz> createState() {
    return _Quizz();
  }
}

class _Quizz extends State<Quizz> {
  final List<String> selectedAnswers = [];
  void switchScreen() {
    setState(() {
      activeScreen = QuestionScreen(onSelectAnswer: chooseAnswer);
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = ResultScreen(chosenAnswers: selectedAnswers);
      });
    }
  }

  @override
  void initState() {
    activeScreen = StartScreen(switchScreen);
    super.initState();
  }

  Widget? activeScreen;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Scaffold(
            body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 140, 9, 241),
              Color.fromARGB(255, 95, 71, 114),
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          ),
          child: activeScreen,
        )));
  }
}
