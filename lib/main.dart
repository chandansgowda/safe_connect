import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:safe_connect/firebase_options.dart';
import 'package:safe_connect/models/questions.dart';
import 'package:safe_connect/screens/auth_gate.dart';
import 'package:safe_connect/screens/diseases_options_screen.dart';
import 'package:safe_connect/screens/predicted_diseases_screen.dart';
import 'package:safe_connect/screens/questions_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
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
        home: AuthGate(),
        theme: ThemeData.light().copyWith(
          inputDecorationTheme: InputDecorationTheme(
            labelStyle: TextStyle(color: Colors.pink),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          outlinedButtonTheme: OutlinedButtonThemeData(
            style: ButtonStyle(
              padding: MaterialStateProperty.all<EdgeInsets>(
                const EdgeInsets.all(16),
              ),
              backgroundColor: MaterialStateProperty.all<Color>(Colors.pink),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            ),
          ),
        ),
        routes: {
          QuestionsScreen.routeName:(context)=>QuestionsScreen(),
          DiseasesOptionsScreen.routeName:(context)=>DiseasesOptionsScreen(),
          PredictedDiseasesScreen.routeName:(context)=>PredictedDiseasesScreen()
        },
      ),
    );
  }
}
