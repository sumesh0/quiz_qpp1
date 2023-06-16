import 'package:flutter/material.dart';
import 'package:quiz_qpp/home.dart';
import 'package:quiz_qpp/question_screen.dart';
import 'package:quiz_qpp/data/questions.dart';
import 'package:quiz_qpp/result_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  Widget? activeScreen;

  @override
  void initState()
  {
     activeScreen = HomePage(screenSwitch);
     super.initState();
  }
    List<String> selectedAnswer = [];
  void chooseAnswer(String answer)
  {
    selectedAnswer.add(answer);

    if(selectedAnswer.length == question.length)
      {
        setState(() {
          selectedAnswer = [];
          activeScreen = ResultScreen(chosenAnswers: selectedAnswer, summaryData: [],);
        });
      }
  }
  screenSwitch()
  {
    setState(() {
      activeScreen = QuestionScreen(onSelectedAnswer: chooseAnswer,);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.deepPurpleAccent,
                  Colors.deepPurple,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )
          ),
         child: activeScreen,
        ),
      ),
    );
  }
}

