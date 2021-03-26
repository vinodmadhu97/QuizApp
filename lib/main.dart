import 'package:flutter/material.dart';
import 'Ui/QuizApp.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(


      home: QuizApp(),
    );
  }
}


