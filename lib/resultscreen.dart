import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/Data%20Models/questions.dart';
import 'package:quiz_app/Data/questionsss.dart';
import 'package:quiz_app/question_summary/question_summary.dart';
import 'package:quiz_app/simplecontainer.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key, required this.choosenAnswer, required this.startquiz});

  final List<String> choosenAnswer;
  final void Function() startquiz;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < choosenAnswer.length; i++) {
      summary.add(
        {
          'Question_index': i,
          'Question': quistions[i].text,
          'CorrectAnswer': quistions[i].answers[0],
          'user_Answer': choosenAnswer[i],
        },
      );
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summarydata = getSummaryData();
    final numtotal = quistions.length;
    final numCorrect = summarydata.where((data) {
      return data['user_Answer'] == data['CorrectAnswer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Your Answered $numCorrect out of $numtotal Questions Correctly',
              style: GoogleFonts.lato(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            question_summary(summarydata),
            const SizedBox(
              height: 30,
            ),
            TextButton.icon(
              onPressed: startquiz,
              style: TextButton.styleFrom(foregroundColor: Colors.white),
              icon: const Icon(Icons.refresh),
              label: const Text('Restart Quiz'),
            ),
          ],
        ),
      ),
    );
  }
}
