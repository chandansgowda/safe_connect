import 'package:flutter/material.dart';
import 'package:safe_connect/screens/groups_screen.dart';

class DiseasesOptionsScreen extends StatelessWidget {
  const DiseasesOptionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> diseases = [
      'AIDS',
      'Chlamydia',
      'Genital Herpes',
      'Gonorrhea',
      'HPV',
      'Hepatitis A',
      'Hepatitis B',
      'Hepatitis C',
      'Hepatitis D',
      'Syphllis',
      'Trichomoniasis'
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text("Title"),
      ),
      body: ListView(
        children: diseases
            .map(
              (disease) => GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>GroupsScreen(diseaseName: disease)));
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Color(0xfff0f0f0), width: 2)),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        disease,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color(0xff3b8bf0),
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
