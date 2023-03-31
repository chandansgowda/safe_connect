import 'package:flutter/material.dart';
import 'package:safe_connect/screens/groups_screen.dart';
import 'package:safe_connect/services.dart';

class DiseasesOptionsScreen extends StatelessWidget {
  static const routeName='/diseases-options-screen';
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
      'Syphilis',
      'Trichomoniasis'
    ];
    return Scaffold(
      backgroundColor: Color(0xffea1f62),
      appBar: AppBar(
        backgroundColor: Color(0xffea1f62),
        elevation: 0,
        title: Text("Title"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: diseases
              .map(
                (disease) => GestureDetector(
                  onTap: (){
                    Services.changeSelfCertifyVal(disease: disease).then((value) =>Navigator.push(context, MaterialPageRoute(builder: (context)=>GroupsScreen(diseaseName: disease))));
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Color(0xfff0f0f0), width: 2)),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          disease,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
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
      ),
    );
  }
}
