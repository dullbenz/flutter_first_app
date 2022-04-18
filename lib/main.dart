import 'package:flutter/material.dart';

import 'result.dart';
import 'quiz.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;
  final _questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': {
        {'text': 'Black', 'score': 4},
        {'text': 'Red', 'score': 2},
        {'text': 'Green', 'score': 1},
        {'text': 'White', 'score': 3},
      },
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': {
        {'text': 'Rabit', 'score': 1},
        {'text': 'Snake', 'score': 0},
        {'text': 'Elephant', 'score': 4},
        {'text': 'Lion', 'score': 4},
      },
    },
    {
      'questionText': 'Who\'s your favorite instructor?',
      'answers': {
        {'text': 'Max', 'score': 5},
        {'text': 'Leo', 'score': 3},
        {'text': 'Harris', 'score': 3},
        {'text': 'Dion', 'score': 1},
      },
    },
  ];

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(
        () => _questionIndex = (_questionIndex + 1) /* % _questions.length*/);
    // _questionIndex = (_questionIndex + 1) % 2;
    print(_questionIndex);
  }

  void _resetAnswers() {
    setState(() {
      _totalScore = 0;
      _questionIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    // return const MaterialApp(home: Text('Hello again Now!'));
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetAnswers),
      ),
    );
  }
}
