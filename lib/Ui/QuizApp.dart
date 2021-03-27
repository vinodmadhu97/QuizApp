import 'package:flutter/material.dart';
import 'package:quiz_app/model.dart';

class QuizApp extends StatefulWidget {
  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {

  int _correntQuestionIndex = 0;

  List question = [
    Model.name("Istanbul is the capital of Turkey?", false),
    Model.name("1kg=100g ?", false),
    Model.name("Penguin is the bird?", true),
    Model.name("Italy is the capital of France?", false),
    Model.name("China is the largest country in the world?", false),


  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.grey.shade500,
      appBar: AppBar(
        title: Text("Quiz App"),
        centerTitle: true,
        //backgroundColor: Colors.grey.shade700,
      ),

      //we use [Builder] here to use a context that is a descendant of scaffold.of() in snackbar
      body: Builder(
        builder:(BuildContext context) => Container(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: Image.asset("images/flag.png",height: 180,width: 250,)),
             // Spacer()

              Container(
                width: 300,
                height: 200,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade700,width: 2.0),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Center(child: Text(question[_correntQuestionIndex].questionText,
                    //this properties added from theme data object in main class
                    // style: TextStyle(
                    //   color: Colors.grey.shade700,
                    //   fontSize: 16.0,
                    //   fontWeight: FontWeight.w500
                    //   ),
                    ),
                  ),
                ),
              ),


              Padding(
                padding: const EdgeInsets.all(35.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                    RaisedButton(
                        onPressed: ()=>_checkResult(true,context),
                        color: Colors.grey.shade700,
                        child: Text("TRUE",style: TextStyle(
                          color: Colors.white,

                        ),),
                    ),

                    RaisedButton(
                      onPressed: ()=>_checkResult(false,context),
                      color: Colors.grey.shade700,
                      child: Text("FALSE",style: TextStyle(
                        color: Colors.white,

                      ),),
                    ),

                    RaisedButton(
                      onPressed: ()=>_changeQuestion(),
                      color: Colors.grey.shade700,
                      child: Icon(Icons.arrow_forward)
                    )
                  ],
                ),
              )


            ],
          ),

        ),
      ),
    );
  }

  _checkResult(value, BuildContext context) {
    if(question[_correntQuestionIndex].isQuestionCorrect == value){

      final snackbar = SnackBar(
        duration: Duration(milliseconds: 1000),
          content: Text("Correct...!",style: TextStyle(

            color: Colors.green,
            fontSize: 15.0,
          ),),
          backgroundColor: Colors.greenAccent

    );


      Scaffold.of(context).showSnackBar(snackbar);
      setState(() {
        if(_correntQuestionIndex < question.length-1){
          _updateQuestion();
        }else{_correntQuestionIndex = 0;}

      });

      print("correct");

    }else{
      final snackbar = SnackBar(
        duration: Duration(milliseconds: 1000),
        content: Text("Incorrect...!",style: TextStyle(
          color: Colors.white,
          fontSize: 15.0,
        ),),
        backgroundColor: Colors.redAccent,

      );

      Scaffold.of(context).showSnackBar(snackbar);
      print("incorrect");
    }

  }

  _updateQuestion(){
    _correntQuestionIndex++;
  }

  _changeQuestion() {
    setState(() {
      if(_correntQuestionIndex < question.length-1){
        _correntQuestionIndex++;
      }
      else{
        _correntQuestionIndex = 0;
      }

    });

  }
}
