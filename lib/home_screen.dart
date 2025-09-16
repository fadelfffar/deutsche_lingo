import 'package:deutsche_lingo/second_question_screen.dart';
import 'package:flutter/material.dart';

// Question model class
class Question {
  final String questionText;
  final List<Answer> answers;

  Question({required this.questionText, required this.answers});
}

// Answer model class
class Answer {
  final String text;
  final bool isCorrect;

  Answer({required this.text, required this.isCorrect});
}

// Next screen to navigate to
class NextQuestionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Next Question'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle,
              size: 100,
              color: Colors.green,
            ),
            SizedBox(height: 20),
            Text(
              'Correct Answer!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Go Back'),
            ),
          ],
        ),
      ),
    );
  }
}

// Main Quiz Screen
class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int? selectedAnswerIndex;
  bool hasAnswered = false;

  // Sample question data
  final Question currentQuestion = Question(
    questionText: "What is the capital of France?",
    answers: [
      Answer(text: "London", isCorrect: false),
      Answer(text: "Berlin", isCorrect: false),
      Answer(text: "Paris", isCorrect: true),
      Answer(text: "Madrid", isCorrect: false),
    ],
  );

  void handleAnswerTap(int index) {
    if (hasAnswered) return;

    setState(() {
      selectedAnswerIndex = index;
      hasAnswered = true;
    });

    // Check if the selected answer is correct
    bool isCorrect = currentQuestion.answers[index].isCorrect;

    // Navigate to next screen if answer is correct
    if (isCorrect) {
      Future.delayed(Duration(milliseconds: 500), () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SecondQuestionScreen(),
          ),
        );
      });
    }
  }

  Color getAnswerColor(int index) {
    if (!hasAnswered) return Colors.blue.shade50;

    if (currentQuestion.answers[index].isCorrect) {
      return Colors.green.shade100;
    } else if (selectedAnswerIndex == index) {
      return Colors.red.shade100;
    }
    return Colors.grey.shade100;
  }

  Color getBorderColor(int index) {
    if (!hasAnswered) return Colors.blue;

    if (currentQuestion.answers[index].isCorrect) {
      return Colors.green;
    } else if (selectedAnswerIndex == index) {
      return Colors.red;
    }
    return Colors.grey;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz Question'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Question Section
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.blue, width: 2),
              ),
              child: Text(
                currentQuestion.questionText,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue.shade800,
                ),
                textAlign: TextAlign.center,
              ),
            ),

            SizedBox(height: 30),

            // Answers Section
            Text(
              'Select an answer:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.grey.shade700,
              ),
            ),

            SizedBox(height: 15),

            // Answer Options
            Expanded(
              child: ListView.builder(
                itemCount: currentQuestion.answers.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 12),
                    child: InkWell(
                      onTap: () => handleAnswerTap(index),
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: getAnswerColor(index),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: getBorderColor(index),
                            width: 2,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              spreadRadius: 1,
                              blurRadius: 3,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: getBorderColor(index),
                              ),
                              child: Center(
                                child: Text(
                                  String.fromCharCode(65 + index), // A, B, C, D
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 15),
                            Expanded(
                              child: Text(
                                currentQuestion.answers[index].text,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            if (hasAnswered && currentQuestion.answers[index].isCorrect)
                              Icon(Icons.check_circle, color: Colors.green, size: 24),
                            if (hasAnswered && selectedAnswerIndex == index && !currentQuestion.answers[index].isCorrect)
                              Icon(Icons.cancel, color: Colors.red, size: 24),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            // Status Message
            if (hasAnswered)
              Container(
                padding: EdgeInsets.all(16),
                margin: EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  color: currentQuestion.answers[selectedAnswerIndex!].isCorrect
                      ? Colors.green.shade50
                      : Colors.red.shade50,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: currentQuestion.answers[selectedAnswerIndex!].isCorrect
                        ? Colors.green
                        : Colors.red,
                  ),
                ),
                child: Text(
                  currentQuestion.answers[selectedAnswerIndex!].isCorrect
                      ? '🎉 Correct! Navigating to next question...'
                      : '❌ Incorrect. Try again!',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: currentQuestion.answers[selectedAnswerIndex!].isCorrect
                        ? Colors.green.shade800
                        : Colors.red.shade800,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

// Main App
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: QuizScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
