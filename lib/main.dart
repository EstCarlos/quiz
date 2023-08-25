import 'package:flutter/material.dart';
import 'quiz.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(QuizzApp());
}

class QuizzApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: HomePage(),
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Key key = UniqueKey();

  void restartApp() {
    setState(() {
      key = UniqueKey();
    });
  }

  List<Icon> scoreIcon = [];
  int correct = 0;
  int questionIndex = 0; // Add this line to track the question index

  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = questions[questionIndex].answer; // Use the correct question
    setState(() {
      if (userPickedAnswer == correctAnswer) {
        scoreIcon.add(
          Icon(
            Icons.check,
            color: Colors.green,
          ),
        );
        correct++;
      } else {
        scoreIcon.add(
          Icon(
            Icons.close,
            color: Colors.red,
          ),
        );
      }
      if (questionIndex < questions.length - 1) {
        questionIndex++;
      } else {
        // Use rflutter_alert library to show an alert dialog
        Alert(
          context: context,
          title: 'Puntuación',
          desc: 'Tu puntuación es $correct de ${questions.length}',
          buttons: [
            DialogButton(
              child: Text(
                "COOL",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () => Navigator.pop(context),
              width: 120,
            )
          ],
        ).show();
        questionIndex = 0;
        scoreIcon.clear();
        correct = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 4,
          child: Padding(
            padding: EdgeInsets.all(5.0),
            child: Center(
              child: Text(
                questions[questionIndex].question, // Use the correct question
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: TextButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green)),
              child: Text(
                'Verdadero',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                ),
              ),
              onPressed: () {
                checkAnswer(true);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red)),
              child: Text(
                'Falso',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                checkAnswer(false);
              },
            ),
          ),
        ),
        Row(
          children: scoreIcon,
        )
      ],
    );
  }
}