import 'package:cloud_firestore/cloud_firestore.dart';

class Question {
  final String question;
  final List<String> options;
  final int correctAnswerIndex;

  Question({
    required this.question,
    required this.options,
    required this.correctAnswerIndex,
  });

  // Factory method to create a Question object from a Firestore document
  factory Question.fromFirestore(DocumentSnapshot doc) {
    var data = doc.data() as Map<String, dynamic>;

    print("Document Data: $data");
    return Question(
      question: data['question'] ?? '', // Adjust Firestore field names
      options: List<String>.from(data['options'] ?? []), // Ensure 'options' is a list
      correctAnswerIndex: data[
          'correctAnswerIndex'] ?? 0, // Adjust this field based on your Firestore
    );
  }
}
