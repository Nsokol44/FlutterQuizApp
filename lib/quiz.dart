import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerQuestion;

  Quiz(
      {required this.questions,
      required this.answerQuestion,
      required this.questionIndex});
  @override
  Widget build(BuildContext context) {
    return Column(
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        Question(questions[questionIndex]['questionText'] as String),
        // <Widget>[] call a list of widgets but it's better to define the list beforehand,
        // ignore: prefer_const_constructors
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
            .map((answer) {
          return Answer(
              () => answerQuestion(answer['score']), answer['text'] as String);
        }).toList()
        //Three dots is called the spread operator. Takes results of a list and adds those elements from the widget
        //To another list.
      ],
    );
  }
}
