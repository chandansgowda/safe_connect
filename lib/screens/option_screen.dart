import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:safe_connect/screens/diseases_options_screen.dart';
import 'package:safe_connect/screens/questions_screen.dart';

class OptionScreen extends StatelessWidget {
  const OptionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff53679),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Select options",
              style: GoogleFonts.poppins(
                  fontSize: 24, fontWeight: FontWeight.w600,
              color: Colors.white
              ),
            ),
            SizedBox(
              height: 50,
            ),
            ContainerButton(
              onPressed: () {
                Navigator.pushNamed(context, QuestionsScreen.routeName);
              },
              text: "Take Quiz",
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              "OR",
              style: TextStyle(fontSize: 21,color: Colors.white),
            ),
            SizedBox(
              height: 50,
            ),
            ContainerButton(
                text: "Self Certify",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DiseasesOptionsScreen(),
                    ),
                  );
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

  const ContainerButton(
      {super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.2),
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: Colors.white70,width: 2),
        ),
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Center(
            child: Text(
              text,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700,color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
