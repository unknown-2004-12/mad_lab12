import 'package:flutter/material.dart';

void main() =>
    runApp(MaterialApp(home: QuizApp(), debugShowCheckedModeBanner: false));

// ------------------------ Main Quiz Widget ------------------------
class QuizApp extends StatefulWidget {
  const QuizApp({super.key});
  @override
  State<QuizApp> createState() => _QuizAppState();
}
// ------------------------ State Class ------------------------
class _QuizAppState extends State<QuizApp> {
  // List of questions with options and correct answer index
  final List<Map<String, dynamic>> questions = [
    {
      'q': 'Capital of India?',
      'o': ['Mumbai', 'Delhi', 'Kolkata', 'Chennai'],
      'a': 1
    },
    {
      'q': '5 + 3 = ?',
      'o': ['6', '8', '9', '7'],
      'a': 1
    },
    {
      'q': 'Color of sky?',
      'o': ['Red', 'Blue', 'Green', 'Yellow'],
      'a': 1
    },
  ];
  int i = 0;      // Current question index
  int score = 0;  // Score tracker
  // Called when user selects an answer
  void answer(int selected) {
    if (selected == questions[i]['a']) score++;
    setState(() => i++);
  }
  // Reset quiz
  void reset() {
    setState(() {
        i = 0;
        score = 0;
      });
  }
  @override
  Widget build(BuildContext context) {
    // ------------------ Result Screen ------------------
    if (i >= questions.length) {
      return Scaffold(
        appBar: AppBar(title: Text('Result')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Score: $score / ${questions.length}',
                  style: TextStyle(fontSize: 24)),
              SizedBox(height: 20),
              ElevatedButton(onPressed: () => reset(), child: Text('Play Again'))
            ],
          ),
        ),
      );
    }

    // ------------------ Quiz Screen ------------------
    var q = questions[i];
    return Scaffold(
      appBar: AppBar(title: Text('Quiz App')),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Q${i + 1}: ${q['q']}', style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
            ...(q['o'] as List<String>).asMap().entries.map(
              (entry) => Container(
                margin: EdgeInsets.only(bottom: 10),
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => answer(entry.key),
                  child: Text(entry.value),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}


