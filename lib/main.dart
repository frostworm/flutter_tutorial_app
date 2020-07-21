import 'package:flutter/material.dart';
import 'package:flutter_tutorial_app/questions.dart';
import 'package:flutter_tutorial_app/answer.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

final questions = const [
  {
    'questionText': 'Любимый цвет?',
    'answers': ['Черный', 'Белый', 'Синий', 'Красный', 'Фильдипесовый']
  },
  {
    'questionText': 'Любимое животное?',
    'answers': ['Собака', 'Кошка', 'Ёж', 'Лошадь', 'Коза']
  },
  {
    'questionText': 'Любымое блюдо?',
    'answers': ['Пельмени', 'Суши', 'Макароны', 'Лошадь в кляре', 'Молоко']
  },
];

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  void _answerQuestion() {
    setState(() {
      if (_questionIndex < questions.length) {
        _questionIndex += 1;
      }
      print(_questionIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('Tutorial App'),
      ),
      body: Column(
        children: [
          Question(questions[_questionIndex]['questionText']),
          ...(questions[_questionIndex]['answers'] as List<String>)
              .map((answer) {
            return Answer(_answerQuestion, answer);
          }).toList()
        ],
      ),
    ));
  }
}
