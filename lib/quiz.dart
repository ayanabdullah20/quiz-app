import 'package:flutter/material.dart';
import 'package:quiz_app/question.dart';
import 'package:quiz_app/simplecontainer.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  Widget? activeScreen;
  @override
  void initState() {
    activeScreen = SimpleContainer(changeScreen);
    super.initState();
  }

  void changeScreen() {
    setState((){activeScreen = const Question();}
      
    );
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
        child: activeScreen,
      ),),
    );
  }
}
