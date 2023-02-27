import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    var resultText = 'You did it!';
    if (resultScore >= 9000) {
      resultText = 'You are awesome!';
    } else if (resultScore >= 5000) {
      resultText = 'YOU ARE ALRIGHT!';
    } else if (resultScore <= 1000) {
      resultText = 'YOU ARE BAD';
    } else {
      resultText = 'You are awful...';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          TextButton(onPressed: resetHandler, child: Text('Restart Quiz!'))
        ],
      ),
    );
  }
}
