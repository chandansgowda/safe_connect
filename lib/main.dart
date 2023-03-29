import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:safe_connect/models/questions.dart';
import 'package:safe_connect/screens/home_screen.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>Symptoms()),
      ],
      child: MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}
