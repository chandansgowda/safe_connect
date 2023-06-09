import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:safe_connect/models/questions.dart';
import 'package:safe_connect/screens/predicted_diseases_screen.dart';
import 'package:safe_connect/services.dart';

class QuestionsScreen extends StatefulWidget {
  static const routeName = '/questions-screen';
  int index = 0;
  bool isLoading = false;
  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  @override
  Widget build(BuildContext context) {
    final questionsList = Provider.of<Symptoms>(context).questionsList;

    return Scaffold(
      backgroundColor: Color(0xfff53679),
      body: SafeArea(
        child: Padding(
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
                      setState(() {
                        widget.isLoading=true;
                      });
                      Services.getDiseases(questionsList).then((response) {
                        setState(() {
                          widget.isLoading=false;
                        });
                        Services.updateDiseases(
                            d1: response['disease'][0]['name'],
                            dp1: response['disease'][0]['percent'],
                            d2: response['disease'][1]['name'],
                            dp2: response['disease'][1]['percent'],
                            d3: response['disease'][2]['name'],
                            dp3: response['disease'][2]['percent']);
                        Navigator.pushNamed(
                            context, PredictedDiseasesScreen.routeName,
                            arguments: response);
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
                              ),
                            ),
                          ),
                        ),
                        duration: const Duration(seconds: 1),
                        behavior: SnackBarBehavior.floating,
                        padding: const EdgeInsets.all(10),
                      ),
                    );
                  }
                },
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xffFFEAEA),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Center(
                      child: widget.isLoading
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : Text(
                              widget.index == 22 ? "Submit" : "Next question",
                              style: GoogleFonts.acme(
                                  color:Color(0xffea1f62),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500),
                            ),
                    ),
                  ),
                ),
              ),
            ],
          ),
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
        Expanded(
          flex: 1,
          child: Center(
              child: Text(
            widget.question.questionText,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500, fontSize: 16.5,color: Colors.white),
          )),
        ),
        Expanded(
          flex: 3,
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 14),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white.withOpacity(0.1)),
            child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: ListView(
                  children: widget.question.options.map((option) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          widget.question.answer = option['value'];
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        decoration: BoxDecoration(
                          color: widget.question.answer == option['value']
                              ? Color(0xffeeeffc).withOpacity(0.5)
                              : Color(0xffeeeffc).withOpacity(0.2),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            width: widget.question.answer == option['value']
                                ? 1
                                : 2,
                            color: widget.question.answer == option['value']
                                ? Colors.white
                                : const Color(0xffd8dce6),
                          ),
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text(
                              option['option'],
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                  color:
                                      widget.question.answer == option['value']
                                          ? Colors.white
                                          : Color(0xffeeeffc),
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                )),
          ),
        ),
      ],
    );
  }
}
