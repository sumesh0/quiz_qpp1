import 'package:flutter/material.dart';
import 'package:quiz_qpp/home.dart';
import 'package:quiz_qpp/data/questions.dart';
import 'package:quiz_qpp/question_summary.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen({super.key, required this.chosenAnswers, required this.summaryData});

  List<String> chosenAnswers;

  List<Map<String, Object>> getSummaryData()
  {
    List<Map<String, Object>> summary = [];

    for(var i=0;i<chosenAnswers.length;i++)
      {
        summary.add({
          'question_index': i,
           'question':  question[i].text,
           'correct_answer': question[i].answer[0],
          'user_answer': chosenAnswers[i],
        },);
      }
     return summary;
}
  List<Map<String, Object>> summaryData;

  levelUp()
  {
    summaryData = getSummaryData();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
          width: double.infinity,
          height: 820,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("You answered 5 of y question correctly"),
             const SizedBox(height: 30,),
               Expanded(child: Column(

                 children: summaryData.map((data){
                   return  Row(

                     children: [
                       ColoredBox(color: Colors.white),
                       Text(((data['question_index'] as int)+ 1).toString(),),
                       Column(
                         children: [
                           Text(data['question'] as String),
                           const SizedBox(height: 5,),
                           Text(data['user_answer'] as String),
                           Text(data['correct_answer'] as String),
                         ],
                       )
                     ],
                   );
                 }).toList(),
               ),),
              const SizedBox(height: 30,),

              TextButton.icon(
                  style: TextButton.styleFrom(),
                  onPressed:(){},
                  icon: const Icon(Icons.restart_alt,color: Colors.white,),
                label: const Text("Restart Quiz",style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500,),),
      ),
            ],
          ),
      ),
    );
  }
}
