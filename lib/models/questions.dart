import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Question {
  String questionText;
  int answer;
  Question({required this.questionText,this.answer=-1});
}

class Symptoms with ChangeNotifier{
  List<Question> questionsList=[
    Question(questionText: "Question 1"),
    Question(questionText: "Question 2"),
    Question(questionText: "Question 3"),
    Question(questionText: "Question 4"),
    Question(questionText: "Question 5"),
    Question(questionText: "Question 6"),
    Question(questionText: "Question 7"),
    Question(questionText: "Question 8"),
    Question(questionText: "Question 9"),
    Question(questionText: "Question 10"),
    Question(questionText: "Question 11"),
    Question(questionText: "Question 12"),
    Question(questionText: "Question 13"),
    Question(questionText: "Question 14"),
    Question(questionText: "Question 15"),
    Question(questionText: "Question 16"),
    Question(questionText: "Question 17"),
    Question(questionText: "Question 18"),
    Question(questionText: "Question 19"),
    Question(questionText: "Question 20"),
    Question(questionText: "Question 21"),
    Question(questionText: "Question 22"),
    Question(questionText: "Question 23"),
  ];
}