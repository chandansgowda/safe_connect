import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:safe_connect/models/questions.dart';
import 'package:safe_connect/screens/diseases_options_screen.dart';
import 'package:safe_connect/services.dart';

class QuestionsScreen extends StatefulWidget {
  static const routeName = '/questions-screen';
  int index = 0;
  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  @override
  Widget build(BuildContext context) {
    final questionsList = Provider.of<Symptoms>(context).questionsList;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Title"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: QuestionBody(
                question: questionsList[widget.index],
                questionNumber: widget.index,
              ),
            ),
            GestureDetector(
              onTap: () async {
                if (questionsList[widget.index].answer != -1) {
                  if (widget.index == 22) {
                    //TODO:Navigate to next screen
                    Services().getDiseases(questionsList).then((response) {
                      Navigator.pushNamed(context, DiseasesOptionsScreen.routeName,arguments: response);
                    });
                  } else {
                    setState(() {
                      widget.index = widget.index + 1;
                    });
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.grey.shade200.withOpacity(0.5),
                      content: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                          child: Container(
                              height: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Center(
                                  child: Text(
                                "Select the option",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              )))),
                      duration: const Duration(seconds: 1),
                      behavior: SnackBarBehavior.floating,
                      padding: const EdgeInsets.all(10),
                    ),
                  );
                }
              },
              child: Container(
                color: Colors.red,
                child: Center(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.index == 22 ? "Submit" : "Next question",
                    style: const TextStyle(fontSize: 16),
                  ),
                )),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class QuestionBody extends StatefulWidget {
  Question question;
  int questionNumber;
  QuestionBody({required this.question, required this.questionNumber});

  @override
  State<QuestionBody> createState() => _QuestionBodyState();
}

class _QuestionBodyState extends State<QuestionBody> {
  List options = [
    ["Never", 0],
    ["Occasionally", 2],
    ["Sometimes", 4],
    ["Less frequently", 5],
    ["More frequently", 7],
    ["Always", 9]
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Center(
            child: Text(
          "${widget.questionNumber + 1}. " + widget.question.questionText,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18),
        )),
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: options
                  .map((option) => GestureDetector(
                        onTap: () {
                          setState(() {
                            widget.question.answer = option[1];
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          decoration: BoxDecoration(
                              color: widget.question.answer == option[1]
                                  ? const Color(0xffb1e9d6)
                                  : const Color(0xfff0f0f0),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                  color: widget.question.answer == option[1]
                                      ? const Color(0xff7cd8bb)
                                      : const Color(0xfff0f0f0),
                                  width: 2)),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Text(
                                option[0],
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ),
                      ))
                  .toList(),
            )),
      ],
    );
  }
}