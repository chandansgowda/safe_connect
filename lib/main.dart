import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:safe_connect/firebase_options.dart';
import 'package:safe_connect/models/questions.dart';
import 'package:safe_connect/screens/diseases_options_screen.dart';
import 'package:safe_connect/screens/questions_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        home: QuestionsScreen(),
        routes: {
          QuestionsScreen.routeName:(context)=>QuestionsScreen(),
          DiseasesOptionsScreen.routeName:(context)=>DiseasesOptionsScreen(),
        },
      ),
    );
  }
}
