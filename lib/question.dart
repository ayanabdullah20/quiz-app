import 'package:flutter/material.dart';
import 'package:quiz_app/buttons.dart';
import 'package:quiz_app/Data/questionsss.dart';

class Question extends StatefulWidget {
  const Question({super.key});
  @override
  State<Question> createState() {
    return _Question();
  }
}

class _Question extends State<Question> {
  @override
  Widget build(context) {
    final currentQuestion = quistions[0];
    return SizedBox(
      width: double.infinity,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
         Text(
          currentQuestion.text ,
          style: const TextStyle(color: Colors.white),
        ),
        const SizedBox(height: 30),
        AnswerButton(
          stext: currentQuestion.answers[0],
          whentapped: () {},
        ),
        AnswerButton(
          stext: currentQuestion.answers[1],
          whentapped: () {},
        ),
        AnswerButton(
          stext: currentQuestion.answers[2],
          whentapped: () {},
        ),
        AnswerButton(
          stext: currentQuestion.answers[3],
          whentapped: () {},
        ),
      ]),
    );
  }
}
