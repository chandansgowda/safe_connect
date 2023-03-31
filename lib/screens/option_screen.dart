import 'package:flutter/material.dart';
import 'package:safe_connect/screens/diseases_options_screen.dart';
import 'package:safe_connect/screens/questions_screen.dart';

class OptionScreen extends StatelessWidget {
  const OptionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select Options"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ContainerButton(onPressed: (){
              Navigator.pushNamed(context, QuestionsScreen.routeName);
            },text: "Take Quiz",),
            SizedBox(
              height: 50,
            ),
            Text("OR"),
            SizedBox(
              height: 50,
            ),
            ContainerButton(text: "Self Certify", onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>DiseasesOptionsScreen()));
            }),
          ],
        ),
      ),
    );
  }
}

class ContainerButton extends StatelessWidget {
  final String text;
  final Function() onPressed;

  const ContainerButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xffea1f62),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Center(child: Text(text)),
        ),
      ),
    );
  }
}
