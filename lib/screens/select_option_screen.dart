import 'package:flutter/material.dart';
import 'package:safe_connect/screens/questions_screen.dart';

class SelectOptionScreen extends StatelessWidget {
  const SelectOptionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select Option"),
      ),
      body: Column(
        children: [
          ElevatedButton(onPressed: (){
            //TODO: Navigate to list of diseases screen
          }, child: Text("Self Certify")),
          ElevatedButton(onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (_)=> QuestionsScreen()));
          }, child: Text("Take Quiz")),
        ],
      ),
    );
  }
}
