import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:safe_connect/screens/groups_screen.dart';
import 'package:safe_connect/screens/web_view_screen.dart';

class PredictedDiseasesScreen extends StatelessWidget {
  static const routeName = 'predicted-diseases-screen';
  const PredictedDiseasesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> data =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    List<dynamic> diseases = data['disease'];

    // List<dynamic> diseases = [
    //   {"name": "Gonorrhea", "percent": 62.34},
    //   {"name": "AIDS", "percent": 13.34},
    //   {"name": "Syphllis", "percent": 10.62}
    // ];
    return Scaffold(
      backgroundColor: Color(0xffea1f62),
      appBar: AppBar(
        backgroundColor: Color(0xffea1f62),
        elevation: 0,
        title: const Text("Predicted diseases"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          children: diseases.map((disease) {
            return Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.3),
                borderRadius: BorderRadius.circular(10),
              ),
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          disease['name'],
                          style: TextStyle(fontSize: 21,fontWeight: FontWeight.w700),
                        ),
                        CircularPercentIndicator(
                          radius: 30,
                          percent: disease['percent'] / 100,
                          center:
                              Text(disease['percent'].toInt().toString() + "%"),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      ContainerButton(
                        onPressed: () async{
                          var auth = FirebaseAuth.instance.currentUser;
                          var response=await FirebaseFirestore.instance.collection('diseases').doc(disease['name']).get();
                          var url=response['KnowMoreUrl'];
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => WebViewScreen(webLink: url),
                            ),
                          );
                        },
                        text: "Know More",
                        backgroundColor: Color(0xffFFEAEA),
                        borderRadius:
                            BorderRadius.only(bottomLeft: Radius.circular(10)),
                      ),
                      Container(
                        width: 2,
                      ),
                      ContainerButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  GroupsScreen(diseaseName: disease['name']),
                            ),
                          );
                        },
                        text: "Community",
                        backgroundColor: Color(0xffFFEAEA),
                        borderRadius:
                            BorderRadius.only(bottomRight: Radius.circular(10)),
                      ),
                    ],
                  )
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class ContainerButton extends StatelessWidget {
  final String text;
  final BorderRadius borderRadius;
  final Function() onPressed;
  final Color backgroundColor;

  const ContainerButton(
      {super.key,
      required this.text,
      required this.borderRadius,
      required this.onPressed,
      required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: borderRadius,
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Center(
                child: Text(
              text,
              style: TextStyle(
                  fontSize: 16,
                  color: Color(0xffea1f62),
                  fontWeight: FontWeight.w500),
            )),
          ),
        ),
      ),
    );
  }
}
