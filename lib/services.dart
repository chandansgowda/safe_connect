import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:safe_connect/models/questions.dart';

import 'package:http/http.dart' as http;

class Services{

  static Future<Map<String,dynamic>> getDiseases(List<Question> questionsList) async{
    List<int> data=[];
    questionsList.forEach((element) {
      data.add(element.answer);
    });
    String val=data.map((i) => i.toString()).join(",");
    var url=Uri.parse("https://brahmakeerthi.pythonanywhere.com/disease_predictor");
    var response= await http.post(url,body: {
      "disease":val
    });
    return json.decode(response.body);
  }

  static Future<void> addUserDataToFirebase(
      {required String d1, required String d2, required String d3, required List<String> joinedGroups}) async{
    await FirebaseFirestore.instance.collection('users').doc('a@a.com').set({
      "isDiseaseKnown":true,
      "disease1": d1,
      "disease2": d2,
      "disease3": d3,
      "joinedGroups": joinedGroups
    });
  }
}