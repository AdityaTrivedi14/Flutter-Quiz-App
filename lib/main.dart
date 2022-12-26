// import 'dart:html';

import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

// void main(){
//   runApp(MyApp());
// }

void main() => runApp(MyApp());

class MyApp extends StatefulWidget{

  @override
  State<StatefulWidget> createState(){
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final questions = const [
      {
        'questionText': 'What\'s your favorite color?', 
        'answers': ['Black', 'Red', 'Green', 'White'],
      },
      {
        'questionText': 'What\'s your favorite animal?', 
        'answers': ['Rabbit', 'Snake', 'Elephant', 'Lion'],
      },
      {
        'questionText': 'Who\'s your favorite instructor?', 
        'answers': ['Max', 'Manu', 'Aditya', 'Brad'],
      },
    ];

  var _questionIndex = 0;

  void _answerQuestion() {

    setState(() {
      _questionIndex = _questionIndex + 1; 
    });
    print(_questionIndex);
    if(_questionIndex < questions.length){

    }
  }

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < questions.length ? Column(
          children: [
            Question(
              questions[_questionIndex]['questionText'],
            ),
            ...(questions[_questionIndex]['answers'] as List<String>).map((answer) {
              return Answer(_answerQuestion, answer);
            }).toList()
        ],) :Center(child: Text('You did it!'),),
      ),
    );
  }
}
