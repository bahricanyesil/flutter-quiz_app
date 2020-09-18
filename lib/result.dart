import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function restartQuiz;

  Result(this.resultScore, this.restartQuiz);

  String get textPhrase {
    String text;
    if (resultScore <= 8) {
      text = 'You are awesome and innocent';
    } else if (resultScore <= 12) {
      text = 'You are okey';
    } else if (resultScore <= 16) {
      text = 'You are eehh...';
    } else {
      text = 'You are bad!!!!??!?!?!';
    }
    return text;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            textPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            child: Text('Restart Quiz!'),
            textColor: Colors.blue,
            onPressed: restartQuiz,
          )
        ],
      ),
    );
  }
}
