import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() {
  return runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State {
  var _questionIndex = 0;
  var _totalScore = 0;

  final _questions = const [
    {
      'questions': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Blue', 'score': 7},
        {'text': 'Black', 'score': 10},
        {'text': 'White', 'score': 1},
        {'text': 'Red', 'score': 4}
      ],
    },
    {
      'questions': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Elephant', 'score': 7},
        {'text': 'Panda', 'score': 10},
        {'text': 'Dog', 'score': 1},
        {'text': 'Cat', 'score': 4}
      ],
    },
    {
      'questions': 'What\'s your favorite?',
      'answers': [
        {'text': 'YS', 'score': 7},
        {'text': 'TL', 'score': 10},
        {'text': 'Others', 'score': 1},
        {'text': 'BOUN', 'score': 4}
      ],
    }
  ];

  void _restartQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
   
    print('Answer2 is chosen');
    if (_questionIndex < _questions.length) {
      print('We have more questions');
    } else {
      print('We have no more question');
    }
    _totalScore += score;
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('This is my first app'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                questions: _questions,
                questionIndex: _questionIndex,
                answerQuestion: _answerQuestion,
              )
            : Result(_totalScore, _restartQuiz),
      ),
    );
  }
}
