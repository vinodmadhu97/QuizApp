import 'package:flutter/material.dart';
import 'Ui/QuizApp.dart';



final ThemeData _appTheme = _buildAppTheme();

ThemeData _buildAppTheme() {

  final ThemeData base = ThemeData.dark();

  return base.copyWith(
    brightness: Brightness.dark,
    accentColor: Colors.red,
    primaryColor: Colors.green,
    scaffoldBackgroundColor: Colors.yellow,
    backgroundColor: Colors.blue,
    textTheme: _appTextTheme(base.textTheme),


  );
}

TextTheme _appTextTheme(TextTheme base){
  return base.copyWith(
    headline: base.headline.copyWith(
      fontWeight: FontWeight.w500,

    ),
    title: base.title.copyWith(
      fontSize: 18,
    ),
    caption: base.caption.copyWith(
      fontWeight: FontWeight.w400,
    ),
    body1:base.body1.copyWith(

          fontSize: 50,
          fontWeight: FontWeight.w500,
          color: Colors.white ,
          fontFamily: "Lobster"

    ),
    button: base.button.copyWith(
      letterSpacing: 3,
      color: Colors.redAccent,

    )
  ).apply(
    //APPY THE FONT FOR WHOLE OF THE APPICATION USING TEXTTHEME OBJECT
    fontFamily: "Lobster"
  );

}



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      theme: _appTheme,
      /* ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.red,
        textTheme: TextTheme(
          headline: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold
          ),

          body1: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.grey.shade700,

          )
        ),

      ),*/

      home: QuizApp(),
    );
  }
}


