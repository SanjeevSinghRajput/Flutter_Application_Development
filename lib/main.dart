import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'Q1. Which Brand is Your Car?',
      'answers': [
        {'text': 'AUDDI', 'score': -2},
        {'text': 'BMW', 'score': -2},
        {'text': 'VOLKS WAGON', 'score': 10},
        {'text': 'ALTO', 'score': -2},
      ],
    },
    {
      'questionText': 'Q2. Which Television is at your home  ?',
      'answers': [
        {'text': 'SONY', 'score': -2},
        {'text': 'ONIDA', 'score': -2},
        {'text': 'TCL', 'score': -2},
        {
          'text':
          'LG',
          'score': 10
        },
      ],
    },
    {
      'questionText': ' Q3.Which Air Condition do you have ? ',
      'answers': [
        {'text': 'VOLTA','score':-2},
        {'text': 'LG', 'score': 10},
        {'text': 'WHIRPOOL','score':-2},
        {'text': 'SAMSUNG','score':-2},
      ],
    },
    {
      'questionText': 'Q4. Which watch you are using ?' ,
      'answers': [
        {'text': 'RADO', 'score': 10},
        {'text': 'ROLEX', 'score': -2},
        {'text': 'CASIO','score':-2},
        {'text': 'BULGARI', 'score': -2},
      ],
    },


    {
      'questionText': 'Q5. Which Bike you are using ?' ,
      'answers': [
        {'text': 'YAMHA', 'score': 10},
        {'text': 'DUCATI', 'score': -2},
        {'text': 'SUZUKI','score':-2},
        {'text': 'HAYABUSA', 'score': -2},
      ],
    },

  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('No more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Citizen home appliance survey'),

          backgroundColor: Color(0xFF00E679),
        ),
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: _questionIndex < _questions.length
              ? Quiz(
            answerQuestion: _answerQuestion,
            questionIndex: _questionIndex,
            questions: _questions,
          ) //Quiz
              : Result(_totalScore, _resetQuiz),
        ), //Padding
      ), //Scaffold
      debugShowCheckedModeBanner: false,
    ); //MaterialApp
  }
}
