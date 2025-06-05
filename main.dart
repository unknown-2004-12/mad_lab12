import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
void main(){
  runApp(MaterialApp(
    home: quizApp(),
    debugShowCheckedModeBanner: false,
  ));
}
class quizApp extends StatefulWidget {
  const quizApp({super.key});
  @override
  State<quizApp> createState() => _quizAppState();
}
class _quizAppState extends State<quizApp> {
  final List<Map<String, dynamic>> _questions = [
    {
      'q': 'What is the capital of France?',
      'o': ['Paris', 'London', 'Berlin', 'Madrid'],
      'a': '0',
    },
    {
      'q': 'What is 2 + 2?',
      'o': ['3', '4', '5', '6'],
      'a': '1',
    },
    {
      'q': 'What is the largest planet in our solar system?',
      'o': ['Earth', 'Mars', 'Jupiter', 'Saturn'],
      'a': '2',
    },
  ];
  int i = 0;
  int score = 0;
  void answer(int selected){
    if( selected == _questions[i]['a']){
      score++;
    }
    setState(() {
      i++;
    });
  }
  void reset(){
    setState(() {
      i = 0;
      score = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    var q = _questions[i];
    if (i >= _questions.length){
      return Scaffold(
        appBar: AppBar(
          title: const Text('Result'),
        ),
        body: Center(
          child: Column(
            children: [
              Text('Score: $score / $_questions.length'),
              ElevatedButton(
                onPressed: () => reset(),
                child: Text('Restart Quiz'),
              ),
            ],
          ),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Q${i+1}: ${q['q']}',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            ...(q['o'] as List<String>).asMap().entries.map(
              (entry) => ElevatedButton(
                onPressed: () => answer(entry.key),
                child: Text(entry.value),
              ),
            )
          ],
        ),
      ),
    );
  }
}
