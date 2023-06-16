import 'package:flutter/material.dart';
import 'package:quiz_qpp/result_screen.dart';
class SummaryData extends StatelessWidget {
  SummaryData(this.summaryData, {super.key});
    List<Map<String, Object>> summaryData = [];
  @override
  Widget build(BuildContext context) {
    return Column(

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
    );
  }
}
