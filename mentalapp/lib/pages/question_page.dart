import 'package:flutter/material.dart';
import 'package:mentalapp/pages/home_page.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({super.key});

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  final List<String> questions = [
    'Have you been feeling down, or depressed?',
    'Have you lost interest or pleasure in things you used to enjoy?',
    'Have you noticed any significant changes in your weight recently, without trying to gain or lose weight?',
    'Have you been feeling tired or lacking energy?',
    'Have you been experiencing feelings of worthlessness or excessive guilt?',
    'Have you had difficulty concentrating or making decisions?',
    'Have you been having thoughts of death or suicide?',
    'Have you noticed a decrease or increase in your appetite?',
    'Have you been feeling restless or have you been moving more slowly than usual?',
  ];

  int currentQuestionIndex = 0;
  int totalScore = 0; // To keep track of the score
  List<int> responses = []; // Store user responses

  void _nextQuestion(int response) {
    responses.add(response); // Store the response for the current question
    totalScore += response; // Add the response to the total score

    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
      });
    } else {
      _showDoneDialog(); // Show completion dialog
    }
  }

  void _showDoneDialog() {
    String scoreCategory;

    if (totalScore < 5) {
      scoreCategory = "Low";
    } else if (totalScore < 10) {
      scoreCategory = "Medium";
    } else {
      scoreCategory = "Severe";
    }

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Questionnaire Complete'),
          content: Text(
            'Thank you for completing the questionnaire!\n\n'
            'Your Total Score: $totalScore\n'
            'Severity: $scoreCategory',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              },
              child: const Text('Done'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(243, 243, 243, 1),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Progress: ${currentQuestionIndex + 1}/${questions.length}',
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  questions[currentQuestionIndex],
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 20),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(4, (index) {
                  return Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 34, 34, 34),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                        ),
                        onPressed: () {
                          _nextQuestion(index); // Pass the button index as the response
                        },
                        child: Text(
                          '$index', // Show response level from 0 to 3
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
