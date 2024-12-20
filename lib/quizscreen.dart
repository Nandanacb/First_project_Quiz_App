import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quizapp_quizzapp/answercard.dart';
import 'package:quizapp_quizzapp/loginscreen.dart';
import 'package:quizapp_quizzapp/nextbutton.dart';
import 'package:quizapp_quizzapp/questions.dart';
import 'package:quizapp_quizzapp/registrationscreen.dart';
import 'package:quizapp_quizzapp/resultscreen.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int? selectedAnswerIndex;
  int questionIndex = 0;
  int score = 0;

  late Stream<QuerySnapshot> quizappStream;
  List<Question> quizQuestions = [
    Question(
        correctAnswerIndex: 1,
        question: 'What widget would you use for repeating content in flutter?',
        options: [
          'A)  ExpandedView',
          'B)  ListView',
          'C)  Stack',
          'D)  ArrayView',
        ]),
    Question(
        correctAnswerIndex: 0,
        question:
            ' What is the key configuration file used when building a flutter project?',
        options: [
          'A)  pubspec.yaml',
          'B)  pubspec.xml',
          'C)  config.html',
          'D)  root.xml',
        ]),
    Question(
        correctAnswerIndex: 2,
        question:
            'Who developed the flutter framework and continues to maintain it today?',
        options: [
          'A)  Facebook',
          'B)  Microsoft',
          'C)  Google',
          'D)  Oracle',
        ]),
    Question(
        correctAnswerIndex: 1,
        question:
            ' Which programming language is used to build Flutter applications?',
        options: [
          'A)  Kotlin ',
          'B)  Dart ',
          'C)  Java',
          'D)  Go',
        ]),
    Question(
        correctAnswerIndex: 1,
        question:
            'Which component allows us to specify the distance between widgets on the screen?',
        options: [
          'A)  SafeArea',
          'B)  SizedBox',
          'C)  table',
          'D)  AppBar',
        ]),
    Question(
        correctAnswerIndex: 0,
        question:
            ' When building for iOS, Flutter is restricted to an __ compilation strategy',
        options: [
          'A)  AOT (ahead-of-time)',
          'B)  JIT (Just-in-time)',
          'C)  Transcompilation',
          'D)  Recompilation',
        ]),
    Question(
        correctAnswerIndex: 2,
        question:
            ' Which release mode will not contain any debugging data when run?',
        options: [
          'A)  Profile',
          'B)  Debug',
          'C)  Release',
          'D)  Test',
        ]),
    Question(
        correctAnswerIndex: 1,
        question:
            ' What element is used as an identifier for components when programming in Flutter?',
        options: [
          'A)  Widgets',
          'B)  Keys',
          'C)  Elements',
          'D)  Serial',
        ]),
    Question(
        correctAnswerIndex: 2,
        question:
            ' What type of test can examine your code as a complete system?',
        options: [
          'A)  Unit tests',
          'B)  Widget tests',
          'C)  Integration Tests',
          'D)  All of the above',
        ]),
    Question(
        correctAnswerIndex: 0,
        question:
            'What type of Flutter animation allows you to represent real-world behavior?',
        options: [
          'A)  Physics-based',
          'B)  Maths-based',
          'C)  Graph-based',
          'D)  Sim-based',
        ]),
  ];

  @override
  void initState() {
    super.initState();
    // Fetch data from Firebase Firestore

    quizappStream = FirebaseFirestore.instance
        .collection('quizzes')
        .snapshots(); // Stream to listen to Firestore changes
  }

  void pickAnswer(int index) {
    if (selectedAnswerIndex == null) {
      setState(() {
        selectedAnswerIndex = index;
      });

      final question = quizQuestions[questionIndex];

      if (selectedAnswerIndex == question.correctAnswerIndex) {
        setState(() {
          score++;
        });
        print("Correct! Score: $score");
      } else {
        print("Incorrect. Score: $score");
      }
    }
  }

  void goToNextQuestion() {
    setState(() {
      if (questionIndex < quizQuestions.length - 1) {
        questionIndex++;
        selectedAnswerIndex = null;
      } else {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
              builder: (_) => ResultScreen(
                    score: score,
                    totalQuestions: quizQuestions.length,
                  )),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(252, 123, 32, 139),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(252, 123, 32, 139),
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.all(10),
          child: const Text(
            'Quiz Quiz',
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Registrationpage()));
              },
              child: Text(
                "Logout",
                style: TextStyle(color: Colors.white),
              )),
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: quizappStream, // Stream of Firestore data
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text('No data available.'));
          }

          final quizQuestions = snapshot.data!.docs.map((doc) {
            return Question.fromFirestore(
                doc); // Map Firestore data to your model
          }).toList();

          final question = quizQuestions[questionIndex];
          bool isLastQuestion = questionIndex == quizQuestions.length - 1;

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(25),
                child: Text(
                  quizQuestions[questionIndex].question,
                  style: const TextStyle(fontSize: 20, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 47),
              /*  Container(
                height: 500,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                    color: Colors.white),
                child: */
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: question.options.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: selectedAnswerIndex == null
                              ? () => pickAnswer(index)
                              : null,
                          child: AnswerCard(
                            currentIndex: index,
                            question: question.options[index],
                            isSelected: selectedAnswerIndex == index,
                            selectedAnswerIndex: selectedAnswerIndex,
                            correctAnswerIndex: question.correctAnswerIndex,
                            isAnswerCorrect: selectedAnswerIndex != null &&
                                selectedAnswerIndex ==
                                    question.correctAnswerIndex,
                            isAnswerIncorrect: selectedAnswerIndex != null &&
                                selectedAnswerIndex !=
                                    question.correctAnswerIndex,
                          ),
                        );
                      },
                    ),
                  ),
                  isLastQuestion
                      ? MyTextButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (_) => ResultScreen(
                                  score: score,
                                  totalQuestions: quizQuestions.length,
                                ),
                              ),
                            );
                          },
                          label: 'Finish',
                        )
                      : MyTextButton(
                          onPressed: selectedAnswerIndex != null
                              ? goToNextQuestion
                              : null,
                          label: 'Next',
                        ),
                ],
              ),
              // ),
            ],
          );
        },
      ),
    );
  }
}
