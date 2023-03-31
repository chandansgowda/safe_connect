import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:safe_connect/screens/home_screen.dart';
import 'package:safe_connect/screens/option_screen.dart';
import 'package:safe_connect/screens/predicted_diseases_screen.dart';
class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SignInScreen(
      providerConfigs: [
        EmailProviderConfiguration(),
      ],
      showAuthActionSwitch: true,
      headerBuilder: (context, constraints, _) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: AspectRatio(
            aspectRatio: 1,
            child: Image.network(
              "https://www.cdc.gov/std/saw/pbyt/images/STI-Badge-Multicolor-02.png",
              width: double.infinity,
              fit: BoxFit.fitHeight,
            ),
          ),
        );
      },
      actions: [
        AuthStateChangeAction<SignedIn>((context, signedIn) async {
          var userData = await FirebaseFirestore.instance.collection("users").doc(signedIn.user!.email).get();
          Map<String, dynamic>? data;
          if(userData.exists) {
            data = userData.data();
            if (data!['disease1'] != null) {
              var response = {
                "disease": [
                  {'name': data!['disease1'], 'percent': data!['dp1']},
                  {'name': data!['disease2'], 'percent': data!['dp2']},
                  {'name': data!['disease1'], 'percent': data!['dp1']}
                ]
              };
              Navigator.pushNamed(context, PredictedDiseasesScreen.routeName,
                  arguments: response);
            }
            else {
              await FirebaseFirestore.instance.collection("users").doc(
                  signedIn.user!.email).set({
                "isDiseaseKnown": false,
                "disease1": "",
                "disease2": "",
                "disease3": "",
                "joinedGroups": []
              });
            }
          }
          else{
            await FirebaseFirestore.instance.collection("users").doc(signedIn.user!.email).set({
              "isDiseaseKnown":false,
              "disease1": "",
              "disease2": "",
              "disease3": "",
              "joinedGroups": []
            });
            //TODO: Send him to select option (quiz/self certify) screen
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=> OptionScreen()));
          }

        }),
      ],
    );
  }
}