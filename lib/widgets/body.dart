import 'package:flutter/material.dart';
import 'package:the_camper_quiz/widgets/quiz.dart';
import 'package:the_camper_quiz/widgets/custom_text.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => new _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            new Card(
              elevation: 10.0,
              child: new Container(
                height: MediaQuery.of(context).size.width / 1.2,
                width: MediaQuery.of(context).size.width / 1.2,
                child: new Image.asset(
                  'assets/images/cover.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            new ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.indigo),
              ),
              onPressed: startQuiz,
              child: new CustomText(
                "Commencer le quiz",
                factor: 1.1,
                fontStyle: FontStyle.italic,
              )
            ),
          ],
        )
    );
  }

  void startQuiz() {
    Navigator.push(
        context,
        new MaterialPageRoute(
            builder: (BuildContext context) {
              return new Quiz();
            })
    );
  }
}