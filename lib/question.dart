import 'package:flutter/material.dart';
import 'package:quiz_app/buttons.dart';
import 'package:quiz_app/Data/questionsss.dart'; // Assuming 'quistions' is defined here
import 'package:google_fonts/google_fonts.dart';

class Question extends StatefulWidget {
  const Question({super.key, required this.onselectAnswer});
  final void Function(String answer) onselectAnswer;

  @override
  State<Question> createState() {
    return _QuestionState();
  }
}

class _QuestionState extends State<Question> {
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {
    // Pass the actual selected answer to the callback function
    widget.onselectAnswer(selectedAnswer);

    setState(() {
      // Increment the current question index but don't go out of range
      if (currentQuestionIndex < quistions.length - 1) {
        currentQuestionIndex++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Ensure questions are available
    if (quistions.isEmpty) {
      return const Center(child: Text("No questions available."));
    }

    // Get the current question
    var currentQuestion = quistions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            // Map the answers to buttons
            ...currentQuestion.getShuffledAnswers().map(
              (answer) {
                return AnswerButton(
                  stext: answer,
                  whentapped: () {
                    answerQuestion(answer);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
