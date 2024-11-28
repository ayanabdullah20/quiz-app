import 'package:flutter/material.dart';
import 'package:quiz_app/question.dart';
import 'package:quiz_app/resultscreen.dart';
import 'package:quiz_app/simplecontainer.dart';
import 'package:quiz_app/Data/questionsss.dart';  

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedanswers = [];
  Widget? activeScreen;

  @override
  void initState() {
    super.initState();
    activeScreen = SimpleContainer(changeScreen);
  }

  void resetQuiz() {
    setState(() {
      selectedanswers.clear();  
      activeScreen = SimpleContainer(changeScreen);  
    });
  }

  void chooseAnswer(String answer) {
    selectedanswers.add(answer);
    if (selectedanswers.length == quistions.length) {
      setState(() {
        activeScreen = ResultScreen(
          choosenAnswer: selectedanswers,
          startquiz: resetQuiz, 
        );
      });
    }
  }


  void changeScreen() {
    setState(() {
      activeScreen = Question(
        onselectAnswer: chooseAnswer,
      );
    });
  }

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(52, 11, 123, 1),
                Color.fromARGB(255, 75, 19, 172),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: activeScreen,  // Active screen based on state
        ),
      ),
    );
  }
}
