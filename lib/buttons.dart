import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton(
      {required this.whentapped, required this.stext, super.key});
  final String stext;
  final void Function() whentapped;
  @override
  Widget build(BuildContext context) {
    String text;
    return ElevatedButton(
      onPressed: whentapped,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 8, 0, 255),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
      ),
      child: Text(stext, textAlign: TextAlign.center),
    );
  }
}
