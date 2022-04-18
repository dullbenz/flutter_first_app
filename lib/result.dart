import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int totalScore;
  final void Function() resetHandler;
  const Result(this.totalScore, this.resetHandler, {Key? key})
      : super(key: key);

  String get resultPhrase {
    if (totalScore <= 8) {
      return 'You are awesome and innocent!';
    } else if (totalScore <= 12) {
      return 'Pretty likeable!';
    } else {
      return 'You are so bad!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: <Widget>[
        Text(
          resultPhrase,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextButton(
          onPressed: resetHandler,
          child: const Text('ResetButton'),
        ),
      ]),
    );
  }
}
