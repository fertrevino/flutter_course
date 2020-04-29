import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetQuiz;

  Result(this.resultScore, this.resetQuiz);

  String get resultPhrase {
    var resultText = 'You did it';
    if (this.resultScore <= 50) {
      resultText = 'You are awersome and innocent!';
    } else if (this.resultScore < 100) {
      resultText = 'You are awersome and innocent, kind of';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            child: Text('Restart quiz'),
            onPressed: resetQuiz,
            textColor: Colors.green,
          )
        ],
      ),
    );
  }
}
