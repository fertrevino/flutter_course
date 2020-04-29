import 'package:flutter/material.dart';

import 'quiz.dart';
import 'result.dart';

void main() {
  MyApp app = MyApp();
  runApp(app);
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var totalScore = 0;
  static const questions = [
    {
      'questionText': 'What is your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 20},
        {'text': 'Green', 'score': 30},
      ]
    },
    {
      'questionText': 'What is your favorite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 10},
        {'text': 'Snake', 'score': 30},
        {'text': 'Elephant', 'score': 40},
        {'text': 'Lion', 'score': 70},
      ]
    },
    {
      'questionText': 'Who is th best?',
      'answers': [
        {'text': 'Fer', 'score': 10},
        {'text': 'Ferny', 'score': 30},
      ]
    },
  ];

  void _answerQuestion(int score) {
    _questionIndex++;
    totalScore += score;
    setState(() {});
    if (_questionIndex < questions.length) {
      print('We have more questions!');
    }
  }

  void _resetQuiz() {
    setState(() {});
    totalScore = 0;
    _questionIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My first App'),
          centerTitle: true,
        ),
        body: _questionIndex < questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: questions,
              )
            : Result(totalScore, _resetQuiz),
      ),
    );
  }
}
