import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizz_app_flutter/data/questions.dart';

import 'answer_button.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<StatefulWidget> createState() {
    return _QuestionScreen();
  }
}

class _QuestionScreen extends State<QuestionScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String answer) {
    widget.onSelectAnswer(answer);
    setState(() {
      currentQuestionIndex++; // increments the value by 1
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];
    return SizedBox(
        width: double.infinity,
        child: Container(
          margin: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                currentQuestion.question,
                style: GoogleFonts.lato(
                  fontSize: 25,
                  color: Colors.white
                )
              ),
              const SizedBox(height: 30),
              ...currentQuestion.getShuffledList().map((answer) {
                return AnswerButton(answerText: answer, onTap:() => {answerQuestion(answer)});
              })
            ],
          ),
        ));
  }
}
