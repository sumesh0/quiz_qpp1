import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage(this.startQuiz, {super.key});
   final void Function() startQuiz;
  @override
  Widget build(BuildContext context) {
    return Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Column(
              children: [
                Image.asset('assets/quiz-logo.png',height: 250, width: 300,),
                const SizedBox(height: 40,),
               const Padding(
                  padding:  EdgeInsets.only(left: 25.0),
                  child: Text("Have fun!",style: TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.w500,),),
                ),
                const SizedBox(height: 20,),
                TextButton.icon(
                  onPressed:()
                  {
                    startQuiz();
                  },
                  style: TextButton.styleFrom(minimumSize: const Size(30, 45),side: const BorderSide(width: 2,color: Colors.white)),
                  icon: const Icon(Icons.start,color: Colors.white,),
                  label: const Text("Click here",style: TextStyle(color: Colors.white),),
                ),
              ],
            ),
          ),
    );
  }
}
