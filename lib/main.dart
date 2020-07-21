import 'package:flutter/material.dart';
import 'package:flutter_tutorial_app/questions.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  void _answerQuestion() {
    setState(() {
      _questionIndex += 1;
      print(_questionIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    var questions = [
      'Любимый цвет?',
      'Любимое животное?',
    ];
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('Tutorial App'),
      ),
      body: Column(
        children: [
          Question(questions[_questionIndex]),
          RaisedButton(
            child: Text('Ответ 1'),
            onPressed: _answerQuestion,
          ),
          RaisedButton(
            child: Text('Ответ 2'),
            onPressed: null,
          ),
          RaisedButton(
            child: Text('Ответ 3'),
            onPressed: null,
          ),
        ],
      ),
    ));
  }
}
