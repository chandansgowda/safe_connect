import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:safe_connect/models/questions.dart';

import 'package:http/http.dart' as http;

class Services{

  Future<Map<String,dynamic>> getDiseases(List<Question> questionsList) async{
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
}