import 'package:flutter/material.dart';
import 'package:flutter_tutorial_app/quiz.dart';
import 'package:flutter_tutorial_app/result.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

final _questions = const [
  {
    'questionText': 'Любимый цвет?',
    'answers': [
      {'text': 'Черный', 'score': 5},
      {'text': 'Белый', 'score': 8},
      {'text': 'Синий', 'score': 1},
      {'text': 'Красный', 'score': 3},
      {'text': 'Фильдипесовый', 'score': 20}
    ]
  },
  {
    'questionText': 'Любимое животное?',
    'answers': [
      {'text': 'Собака', 'score': 5},
      {'text': 'Кошка', 'score': 8},
      {'text': 'Ёж', 'score': 3},
      {'text': 'Лошадь', 'score': 7},
      {'text': 'Коза', 'score': 1}
    ]
  },
  {
    'questionText': 'Любымое блюдо?',
    'answers': [
      {'text': 'Пельмени', 'score': 10},
      {'text': 'Суши', 'score': 12},
      {'text': 'Макароны', 'score': 5},
      {'text': 'Лошадь в кляре', 'score': 20},
      {'text': 'Молоко', 'score': 1}
    ]
  },
];
var _questionIndex = 0;
var _totalScore = 0;

class _MyAppState extends State<MyApp> {
  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex += 1;
      if (_questionIndex < _questions.length) {
        print('Еще есть вопросы');
      } else {
        print('Вопросов нет');
      }

      print(_questionIndex);
    });
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('Tutorial App'),
      ),
      body: _questionIndex < _questions.length
          ? Quiz(
              answerQuestion: _answerQuestion,
              questions: _questions,
              questionIndex: _questionIndex,
            )
          : Result(_totalScore, _resetQuiz),
    ));
  }
}
