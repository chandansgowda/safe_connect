import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Question {
  String questionText;
  int answer;
  Question({required this.questionText,this.answer=-1});
}

class Symptoms with ChangeNotifier{
  List<Question> questionsList=[
    Question(questionText: "Have you noticed any changes in your ability to perform daily activities that require muscle strength, such as lifting, carrying or climbing stairs?"),
    Question(questionText: "Have you noticed any white or discolored patches on the back of your throat or tonsils?"),
    Question(questionText: "Have you experienced any chills or sweating or high fever?If so, how frequent is it?"),
    Question(questionText: "Have you had any extra marital contacts lately?"),
    Question(questionText: "Have you experienced any pain, stiffness or discomfort in your joints?"),
    Question(questionText: "How frequently have you been vomiting?"),
    Question(questionText: "Have you noticed any yellowing of your skin ?"),
    Question(questionText: "Have you noticed any yellowing of the whites of your eyes lately?"),
    Question(questionText: "Have you experienced any itching or skin rashes?"),
    Question(questionText: "Have you experienced any persistent feelings of exhaustion or tiredness?"),
    Question(questionText: "Have you experienced any persistent feelings of sluggishness or reduced energy levels?"),
    Question(questionText: "Have you experienced any abdominal pain or discomfort? if so, on a scale of 1 to 10, how severe is the pain?"),
    Question(questionText: "Have you experienced any feelings of nausea or queasiness?"),
    Question(questionText: "Have you experienced a noticeable decrease in your appetite?"),
    Question(questionText: "Have you noticed any small sores on your skin ?"),
    Question(questionText: "Have you noticed any ulcers on mucous membranes (such as inside your mouth or nose)?"),
    Question(questionText: "How long have you had the scabs?"),
    Question(questionText: "Have you experienced any lower stomach pain or discomfort?On a scale of 1 to 10, how severe is the pain?"),
    Question(questionText: "Do you experience a painful urination ? Does the pain occur throughout the entire urination process?"),
    Question(questionText: "Have you experienced any difficulty swallowing or pain while swallowing?How severe is the soreness of your throat?"),
    Question(questionText: "Have you noticed any skin rashes on your body?What is the severity of the rashes?"),
    Question(questionText: "Have you noticed that your urine is darker in color than usual? Since when are you experiencing this?"),
    Question(questionText: "Have you experienced any unintended weight loss recently?"),
  ];
}