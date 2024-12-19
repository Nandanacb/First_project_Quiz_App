import 'package:flutter/material.dart';
import 'package:quizapp_quizzapp/registrationscreen.dart';

class Firstpage extends StatefulWidget {
  const Firstpage({super.key});
  @override
  State<Firstpage> createState() => _FirstpageState();
}

class _FirstpageState extends State<Firstpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(252, 123, 32, 139),
      body: Column(
        children: [
          

           Container(
             height: 400,
             width: double.infinity,
            decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/brain.jpeg"),fit: BoxFit.fill)),
          ),
          SizedBox(height: 10),
          Center(
              child: Text(
            "Quiz Quiz",
            style: TextStyle(
                fontSize: 70, fontWeight: FontWeight.bold, color: Colors.white),
          )),
          
          Text(
            "It's time to relax.Let's learn by playing",
            style: TextStyle(fontSize: 15, color: Colors.white),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 80,
          ),
          Container(
            height: 50,
            width: 250,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Center(
                child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Registrationpage()));
                    },
                    child: Text(
                      "Let's start",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.purple),
                    ))),
          ),
        ],
      ),
    );
  }
}
