import 'package:flutter/material.dart';

import 'question.dart';
import 'answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final void Function(int) answerQuestion;
  final int questionIndex;

  const Quiz({
    required this.questions,
    required this.answerQuestion,
    required this.questionIndex,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(
          questions[questionIndex]['questionText'] as String,
        ),
        // ...(questions[questionIndex]['answers'] as Set<String>)
        //     .map((answer) => Answer(answer, answerQuestion)),
        for (var answer
            in questions[questionIndex]['answers'] as Set<Map<String, Object>>)
          Answer(answer['text'] as String,
              () => answerQuestion(answer['score'] as int)),
      ],
    );
  }
}
