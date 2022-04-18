import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final void Function() _selectHandler;
  final String _answer;
  const Answer(this._answer, this._selectHandler, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        child: Text(_answer),
        onPressed: _selectHandler,
        style: ElevatedButton.styleFrom(
          primary: Colors.blue,
          onPrimary: Colors.white,
        ),
      ),
    );
  }
}
