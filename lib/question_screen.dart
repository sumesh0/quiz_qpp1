import 'package:flutter/material.dart';
import 'package:quiz_qpp/answer_button.dart';
import 'package:quiz_qpp/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.onSelectedAnswer,});


  final void Function(String answer) onSelectedAnswer;
  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currentQIndex = 0;

  void answerQuestion(String selectedAnswer){
    widget.onSelectedAnswer(selectedAnswer);
    setState(() {
      currentQIndex++;
    });
  }
  @override
  Widget build(BuildContext context) {

    final currentQ = question[currentQIndex];

    return Padding(
      padding: const EdgeInsets.only(left: 10,right: 10),
      child: SizedBox(
          width: double.infinity,
            child: Container(
              margin:  const EdgeInsets.all(40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                   Text(
                    currentQ.text,
                    style: GoogleFonts.lato(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                     textAlign: TextAlign.center,
                  ),
                const SizedBox(height: 30,),
                ...currentQ.getShuffledAnswer().map((answers){
                  return AnswerButton(answerText: answers, onTap: (){
                    answerQuestion(answers);
                  },);
                }),
                ],
              ),
            ),
      ),
    );
  }
}
