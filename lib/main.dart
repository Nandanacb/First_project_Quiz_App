import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:quizapp_quizzapp/quizscreen.dart';
import 'package:quizapp_quizzapp/splashscreen.dart';

void main() async {
  await Hive.initFlutter();
  var box = await Hive.openBox('mybox');

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
  apiKey: "AIzaSyCq_Lb2K_0GfrTXCBKk4D1hDh0kG1-MJvE",
  authDomain: "quizapp-c250d.firebaseapp.com",
  projectId: "quizapp-c250d",
  storageBucket: "quizapp-c250d.firebasestorage.app",
  messagingSenderId: "53066265798",
  appId: "1:53066265798:web:bfdcc1003ec94583dc53c7"

  )); 

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //themeMode: ThemeMode.dark,
      //theme: ThemeData.dark().copyWith(),
      home: Splashscreen(),
    );
  }
}
