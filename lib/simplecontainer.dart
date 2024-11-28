import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SimpleContainer extends StatelessWidget {
  const SimpleContainer( this.startquiz, {super.key});

  final void Function() startquiz;
  @override
  Widget build(context) {
    return Container(
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
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/airdrop.png', width: 300, color: const Color.fromARGB(173, 255, 255, 255),),
            const SizedBox(
              height: 80,
            ),
             Text(
              'Learn Airdrops for Free',
              style: GoogleFonts.lato(
                color:const  Color.fromARGB(255, 217, 194, 249),
                fontSize: 26,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            OutlinedButton.icon(
              onPressed: () {startquiz();},
              style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
              label: const Text("Start Quiz"),
              icon: const Icon(Icons.arrow_right_alt),
            )
          ],
        ),
      ),
    );
  }
}
