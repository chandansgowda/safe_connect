import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Symptom {
  String symptomName;
  int value;
  Symptom({required this.symptomName,this.value=0});
}

class Symptoms with ChangeNotifier{
  List<Symptom> symptomsList=[
    Symptom(symptomName: "Symptom 1"),
    Symptom(symptomName: "Symptom 2"),
    Symptom(symptomName: "Symptom 3"),
    Symptom(symptomName: "Symptom 4"),
    Symptom(symptomName: "Symptom 5"),
    Symptom(symptomName: "Symptom 6"),
    Symptom(symptomName: "Symptom 7"),
    Symptom(symptomName: "Symptom 8"),
    Symptom(symptomName: "Symptom 9"),
    Symptom(symptomName: "Symptom 10"),
    Symptom(symptomName: "Symptom 11"),
    Symptom(symptomName: "Symptom 12"),
    Symptom(symptomName: "Symptom 13"),
    Symptom(symptomName: "Symptom 14"),
    Symptom(symptomName: "Symptom 15"),
    Symptom(symptomName: "Symptom 16"),
    Symptom(symptomName: "Symptom 17"),
    Symptom(symptomName: "Symptom 18"),
    Symptom(symptomName: "Symptom 19"),
    Symptom(symptomName: "Symptom 20"),
    Symptom(symptomName: "Symptom 21"),
    Symptom(symptomName: "Symptom 22"),
    Symptom(symptomName: "Symptom 23"),
  ];
}