import 'package:flutter/material.dart';
import 'question.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final correctMark = Icon(Icons.check, color: Colors.green);
  final wrongMark = Icon(Icons.close, color: Colors.red);
  List<Icon> scoreKeeper = [];

  List<Question> questionBank = [
    Question(q: 'You can lead a cow down stairs but not up stairs.', a: false),
    Question(
        q: 'Approximately one quarter of human bones are in the feet.',
        a: true),
    Question(q: 'A slug\'s blood is green.', a: true),
  ];

  var currentQuestion = 0;

  @override
  Widget build(BuildContext context) {
    var trueButton = Padding(
      padding: EdgeInsets.all(16.0),
      child: TextButton(
        style: TextButton.styleFrom(
            padding: EdgeInsets.only(top: 20.00, bottom: 20.00),
            backgroundColor: Colors.green),
        child: Text(
          'True',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
          ),
        ),
        onPressed: () {
          if (questionBank[currentQuestion].questionAnswer == true) {
            scoreKeeper.add(correctMark);
          } else {
            scoreKeeper.add(wrongMark);
          }

          setState(() {
            if (currentQuestion < questionBank.length - 1) {
              currentQuestion++;
            }
          });
        },
      ),
    );

    var wrongButton = Padding(
      padding: EdgeInsets.all(16.0),
      child: TextButton(
        style: TextButton.styleFrom(
            padding: EdgeInsets.only(top: 20.00, bottom: 20.00),
            backgroundColor: Colors.red),
        child: Text(
          'False',
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
          ),
        ),
        onPressed: () {
          if (questionBank[currentQuestion].questionAnswer == false) {
            scoreKeeper.add(correctMark);
          } else {
            scoreKeeper.add(wrongMark);
          }

          setState(() {
            if (currentQuestion < questionBank.length - 1) {
              currentQuestion++;
            }
          });
        },
      ),
    );

    var questions = Expanded(
      flex: 5,
      child: Center(
        child: Text(
          questionBank[currentQuestion].questionText,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 25.0,
            color: Colors.white,
          ),
        ),
      ),
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        questions,
        trueButton,
        wrongButton,
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Row(children: scoreKeeper),
        ),
      ],
    );
  }
}
