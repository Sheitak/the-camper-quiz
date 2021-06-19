import 'package:flutter/material.dart';
import 'package:the_camper_quiz/widgets/home.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz Game',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Question games ... Quizzes are good'),
      debugShowCheckedModeBanner: false,
    );
  }
}