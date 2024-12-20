import 'package:flutter/material.dart';
import 'package:quizapp_quizzapp/quizscreen.dart';
import 'package:quizapp_quizzapp/registrationscreen.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.score,
    required this.totalQuestions,
  });

  final int score;
  final int totalQuestions;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: SizedBox(
        height: 700,
        width: 700,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              width: 700,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: const Text(
                'Your Score: ',
                style: TextStyle(
                  fontSize: 34,
                  color: Colors.white,
                ),
              ),
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: 250,
                  width: 250,
                  child: CircularProgressIndicator(
                    strokeWidth: 10,
                    value: score / totalQuestions,
                    color: const Color.fromARGB(255, 230, 134, 214),
                    backgroundColor: Colors.white,
                  ),
                ),
                Column(
                  children: [
                    Text(
                      score.toString(),
                      style: const TextStyle(fontSize: 80, color: Colors.white),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '${(score / totalQuestions * 100).round()}%',
                      style: const TextStyle(fontSize: 25, color: Colors.white),
                    )
                  ],
                ),
              ],
            ),
            SizedBox(height: 60),
            Text(
              "Would you like to restart the program?",
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            SizedBox(height: 30),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Registrationpage()));
                },
                child: Text(
                  "Restart",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.purple,
                      fontWeight: FontWeight.bold),
                ))
          ],
        ),
      ),
    );
  }
}
