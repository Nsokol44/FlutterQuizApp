import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';
import './quiz.dart';
import './result.dart';

void main() {
  //use runApp to summon your widget tree and have flutter display it on screen.
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Blue', 'score': 10},
        {'text': 'Black', 'score': 5},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 25}
      ],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Falcon', 'score': 9000},
        {'text': 'Orangutan', 'score': 10},
        {'text': 'Elephant', 'score': 500},
        {'text': 'Chicken', 'score': 8000}
      ],
    },
    {
      'questionText': 'Who\'s your favorite person?',
      'answers': [
        {'text': 'Nick', 'score': 1},
        {'text': 'Nick Sokol', 'score': 9100},
        {'text': 'Jessica', 'score': 10},
        {'text': 'Sarah', 'score': 450}
      ],
    },
  ]; // create a list, can also use static to initialize variable here.
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore = _totalScore + score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions');
    } else {
      print('No more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // Creates a base page design for a widget.
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex <
                _questions
                    .length // The '?' can be used as a way of proposing a conditional before a widget is rendered.
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions)
            : Result(_totalScore,
                _resetQuiz), // the ':' is used as an else, so if the condition has been met then you generate something different.
      ),
    );
  } // Build method
} // MyApp class
//Use final for values that change when assigned/created but do not change after. Only when it runs the value gets locked in.
//Use const for values that will never change at any point in the program. Const is set at compile time.
//const can be added in front of the variable or value. 
//In front of the variable all values and the variable itself are maintained as const.
//In front of the value the values are const, but the variable itself can be modified or re-used for other purposes.
