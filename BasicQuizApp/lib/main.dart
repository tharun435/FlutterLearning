import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  var questionIndex = 0;

  void answerQuestion() {
    setState(() {
      questionIndex = questionIndex + 1;
    });

    print(questionIndex);
    //print('Answer Choosen!');
  }

  @override
  Widget build(BuildContext context) {
    var questions = [
      {
        'questionText': 'what\'s your favrite color?',
        'answers': ['Black', 'Red', 'Green', 'White'],
      },
      {
        'questionText': 'what\'s your favorite animal?',
        'answers': ['Lion', 'Tiger', 'Elephant', 'Fox'],
      },
      {
        'questionText': 'who\'s your favorite Instructor?',
        'answers': ['MAx', 'Min', 'Sum', 'AVg'],
      },
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Quiz App')),
        body: questionIndex < questions.length
            ? Column(
                children: [
                  Question(questions[questionIndex]['questionText']),
                  ...(questions[questionIndex]['answers'] as List<String>)
                      .map((answer) {
                    return Answer(answerQuestion, answer);
                  }).toList()
                ],
              )
            : Center(child: Text("Hurray You have Completed The Quiz")),
      ),
    );
  }
}
