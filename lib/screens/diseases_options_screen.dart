import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:safe_connect/screens/web_view_screen.dart';

class DiseasesOptionsScreen extends StatelessWidget {
  static const routeName = 'diseases-options-screen';
  const DiseasesOptionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Map<String,dynamic> data=ModalRoute.of(context)!.settings.arguments as Map<String,dynamic>;
    // List<dynamic> diseases=data['disease'];
    List<dynamic> diseases = [
      {"name": "Gonorrhea", "percent": 62.34},
      {"name": "AIDS", "percent": 13.34},
      {"name": "Syphllis", "percent": 10.62}
    ];
    print(diseases);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sam"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(child: Text("Diseases")),
          Column(
            children: diseases.map((disease) {
              return Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.yellow,
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
                            style: TextStyle(fontSize: 18),
                          ),
                          CircularPercentIndicator(
                            radius: 30,
                            percent: disease['percent'] / 100,
                            center: Text(
                                disease['percent'].toInt().toString() + "%"),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        ContainerButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>WebViewScreen(),));
                          },
                          text: "Know More",
                          backgroundColor: Colors.grey,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10)),
                        ),
                        ContainerButton(
                          onPressed: () {},
                          text: "Join community",
                          backgroundColor: Colors.green,
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(10)),
                        ),

                      ],
                    )
                  ],
                ),
              );
            }).toList(),
          ),
        ],
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
            child: Center(child: Text(text,style: TextStyle(fontSize: 16),)),
          ),
        ),
      ),
    );
  }
}
