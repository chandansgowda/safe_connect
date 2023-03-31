import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Question {
  String questionText;
  int answer;
  List<Map> options;
  Question(
      {required this.questionText, this.answer = -1, required this.options});
}

class Symptoms with ChangeNotifier {
  List<Question> questionsList = [
    Question(
        questionText:
            "Have you noticed any changes in your ability to perform daily activities that require muscle strength?",
        options: [
          {
            "option": "No changes in ability to perform daily activities",
            "value": 0,
          },
          {
            "option":
                "Slight difficulty with lifting, carrying or climbing stairs",
            "value": 2,
          },
          {
            "option":
                "Moderate difficulty with lifting, carrying or climbing stairs",
            "value": 4,
          },
          {
            "option":
                "Severe difficulty with lifting, carrying or climbing stairs",
            "value": 6,
          },
          {
            "option":
                "Unable to perform daily activities that require muscle strength",
            "value": 9
          }
        ]),
    Question(
        questionText:
            "Have you noticed any white or discolored patches on the back of your throat or tonsils?",
        options: [
          {
            "option":
                "Yes, I have noticed white patches on my throat or tonsils",
            "value": 6,
          },
          {
            "option":
                "Yes, I have noticed discolored patches on my throat or tonsils",
            "value": 5,
          },
          {
            "option":
                "Yes, I have noticed both white and discolored patches on my throat or tonsils",
            "value": 9,
          },
          {
            "option":
                "No, I have not noticed any white or discolored patches on my throat or tonsils",
            "value": 2
          }
        ]),
    Question(
        questionText:
            "Have you experienced any chills or sweating or high fever?If so, how frequent is it?",
        options: [
          {
            "option":
                "Yes, I have experienced chills and/or sweating and/or high fever frequently (daily or almost daily)",
            "value": 9
          },
          {
            "option":
                "Yes, I have experienced chills and/or sweating and/or high fever sometimes (a few times a week)",
            "value": 5,
          },
          {
            "option":
                "Yes, I have experienced chills and/or sweating and/or high fever rarely (once or twice a month)",
            "value": 3,
          },
          {
            "option":
                "No, I have not experienced chills and/or sweating and/or high fever",
            "value": 1
          }
        ]),
    Question(
        questionText: "Have you had any extra marital contacts lately?",
        options: [
          {"option": "Never", "value": 0},
          {
            "option": "Occasionally",
            "value": 2,
          },
          {
            "option": "Sometimes",
            "value": 4,
          },
          {
            "option": "Less frequently",
            "value": 5,
          },
          {
            "option": "More frequently",
            "value": 7,
          },
          {"option": "Always", "value": 9}
        ]),
    Question(
        questionText:
            "Have you experienced any pain, stiffness or discomfort in your joints?",
        options: [
          {
            "option": "Yes, frequently",
            "value": 8,
          },
          {
            "option": "Yes, Sometimes",
            "value": 6,
          },
          {
            "option": "No, not at all",
            "value": 1,
          },
          {"option": "Yes, Ocassionally", "value": 3}
        ]),
    Question(questionText: "How frequently have you been vomiting?", options: [
      {
        "option": "Never",
        "value": 0,
      },
      {
        "option": "Rarely (once or twice a month)",
        "value": 2,
      },
      {
        "option": "Occasionally (a few times a month)",
        "value": 4,
      },
      {
        "option": "Frequently (once or twice a week)",
        "value": 6,
      },
      {"option": "Very frequently (more than twice a week)", "value": 9},
    ]),
    Question(
        questionText: "Have you noticed any yellowing of your skin ?",
        options: [
          {
            "option": "Yes, my skin has turned yellow",
            "value": 8,
          },
          {
            "option": "No, my skin is not yellow",
            "value": 1,
          },
          {"option": "I am not sure", "value": 3}
        ]),
    Question(
        questionText:
            "Have you noticed any yellowing of the whites of your eyes lately?",
        options: [
          {
            "option": " No, my eyes look normal",
            "value": 1,
          },
          {
            "option": "Yes, I have noticed a slight yellowing",
            "value": 5,
          },
          {"option": "Yes, my eyes are noticeably yellow", "value": 8}
        ]),
    Question(
        questionText: "Have you experienced any itching or skin rashes?",
        options: [
          {
            "option": "Never",
            "value": 0,
          },
          {
            "option": "Occasionally",
            "value": 2,
          },
          {
            "option": "Sometimes",
            "value": 4,
          },
          {
            "option": "Less frequently",
            "value": 5,
          },
          {
            "option": "More frequently",
            "value": 7,
          },
          {"option": "Always", "value": 9}
        ]),
    Question(
        questionText:
            "Have you experienced any persistent feelings of exhaustion or tiredness?",
        options: [
          {"option": "Never", "value": 0},
          {"option": "Occasionally", "value": 2},
          {"option": "Sometimes", "value": 4},
          {"option": "Less frequently", "value": 5},
          {"option": "More frequently", "value": 7},
          {"option": "Always", "value": 9}
        ]),
    Question(
        questionText:
            "Have you experienced any persistent feelings of sluggishness or reduced energy levels?",
        options: [
          {
            "option":
                "Yes, I have been feeling sluggish or fatigued most of the time.",
            "value": 7
          },
          {
            "option":
                "I have been feeling tired and drained despite getting enough rest and sleep",
            "value": 4
          },
          {
            "option":
                "I have noticed a significant decrease in my overall energy levels and stamina",
            "value": 9
          },
          {
            "option":
                "I have been feeling weak and lethargic even after mild physical activities",
            "value": 8
          },
          {
            "option":
                "No, I haven't experienced any persistent feelings of sluggishness or reduced energy levels",
            "value": 1
          }
        ]),
    Question(
        questionText:
            "Have you experienced any abdominal pain or discomfort? how severe is the pain?",
        options: [
          {"option": "Mild discomfort", "value": 0},
          {"option": "Slight pain", "value": 1},
          {"option": "Severe pain", "value": 3},
          {"option": "Excruciating pain", "value": 5},
          {"option": "Agonizing pain", "value": 7},
          {"option": "Worst pain imaginable", "value": 9}
        ]),
    Question(
        questionText:
            "Have you experienced any feelings of nausea or queasiness?",
        options: [
          {"option": "Never", "value": 0},
          {"option": "Occasionally", "value": 2},
          {"option": "Sometimes", "value": 4},
          {"option": "Less frequently", "value": 5},
          {"option": "More frequently", "value": 7},
          {"option": "Always", "value": 9}
        ]),
    Question(
        questionText:
            "Have you experienced a noticeable decrease in your appetite?",
        options: [
          {
            "option": "Yes, I have had a significant decrease in my appetite",
            "value": 8
          },
          {
            "option":
                "I have had some decrease in my appetite, but it's not too severe",
            "value": 5
          },
          {"option": "No, my appetite has been normal", "value": 0}
        ]),
    Question(
        questionText: "Have you noticed any small sores on your skin ?",
        options: [
          {
            "option":
                "The sores are not severe and do not cause any pain or discomfort",
            "value": 2
          },
          {
            "option":
                "The sores are mild and only cause minor pain or discomfort",
            "value": 4
          },
          {
            "option":
                "The sores are moderate and cause significant pain or discomfort",
            "value": 6
          },
          {
            "option":
                "The sores are severe and cause intense pain or discomfort",
            "value": 9
          }
        ]),
    Question(
        questionText: "How would you categorize the ulcers ( if any )?",
        options: [
          {"option": "Mild", "value": 2},
          {"option": "Moderate", "value": 5},
          {"option": "Severe", "value": 8}
        ]),
    Question(questionText: "How long have you had the scabs?", options: [
      {"option": "Never", "value": 0},
      {"option": "Occasionally", "value": 2},
      {"option": "Sometimes", "value": 4},
      {"option": "Less frequently", "value": 5},
      {"option": "More frequently", "value": 7},
      {"option": "Always", "value": 9}
    ]),
    Question(
        questionText:
            "Have you experienced any lower stomach pain or discomfort?On a scale of 1 to 10, how severe is the pain?",
        options: [
          {"option": "No pain", "value": 0},
          {"option": "Mild pain", "value": 3},
          {"option": "Moderate pain", "value": 5},
          {"option": "Severe pain", "value": 7},
          {"option": "Very severe pain", "value": 9}
        ]),
    Question(
        questionText:
            "Do you experience a painful urination ? Does the pain occur throughout the entire urination process?",
        options: [
          {
            "option":
                "Yes, the pain occurs throughout the entire urination process",
            "value": 9
          },
          {"option": "Yes, the pain occurs occasionally", "value": 5},
          {
            "option":
                "No, the pain occurs only at the beginning or end of urination",
            "value": 0
          }
        ]),
    Question(
        questionText:
            "Have you experienced any difficulty swallowing or pain while swallowing?How severe is the soreness of your throat?",
        options: [
          {
            "option": "Yes, I am experiencing difficulty swallowing",
            "value": 8
          },
          {
            "option": "Yes, I am experiencing pain while swallowing",
            "value": 6
          },
          {
            "option":
                "No, I am not experiencing any difficulty or pain while swallowing",
            "value": 2
          }
        ]),
    Question(
        questionText:
            "Have you noticed any skin rashes on your body?What is the severity of the rashes?",
        options: [
          {"option": "Mild - few small patches or spots", "value": 3},
          {"option": "Moderate - several patches or spots", "value": 6},
          {
            "option":
                "Severe - large areas or widespread rash, or accompanied by severe itching or pain",
            "value": 9
          }
        ]),
    Question(
        questionText:
            "Have you noticed that your urine is darker in color than usual? Since when are you experiencing this?",
        options: [
          {"option": "Less than a week", "value": 3},
          {"option": "1-2 weeks", "value": 5},
          {"option": "2-4 weeks", "value": 7},
          {"option": "More than 4 weeks", "value": 9}
        ]),
    Question(
        questionText:
            "Have you experienced any unintended weight loss recently?",
        options: [
          {
            "option":
                "Yes, I have experienced unintended weight loss of Less than 5 pounds (2.3 kg)",
            "value": 3
          },
          {
            "option":
                "Yes, I have experienced unintended weight loss of 5-10 pounds (2.3-4.5 kg)",
            "value": 5
          },
          {
            "option":
                "Yes, I have experienced unintended weight loss of 10-15 pounds (4.5-6.8 kg)",
            "value": 7
          },
          {
            "option":
                "Yes, I have experienced unintended weight loss of More than 15 pounds (6.8 kg)",
            "value": 9
          },
          {
            "option":
                "No, I have not experienced any unintended weight loss recently",
            "value": 0
          }
        ]),
  ];
}
