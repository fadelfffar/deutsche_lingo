import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

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

// Second Quiz Screen with France language question
class SecondQuestionScreen extends StatefulWidget {
  @override
  _SecondQuestionScreenState createState() => _SecondQuestionScreenState();
}

class _SecondQuestionScreenState extends State<SecondQuestionScreen> {
  int? selectedAnswerIndex;
  bool hasAnswered = false;

  // Second question data
  final Question currentQuestion = Question(
    questionText: "What is France National language?",
    answers: [
      Answer(text: "English", isCorrect: false),
      Answer(text: "German", isCorrect: false),
      Answer(text: "French", isCorrect: true),
      Answer(text: "Spanish", isCorrect: false),
    ],
  );

  void handleAnswerTap(int index) {
    if (hasAnswered) return;

    setState(() {
      selectedAnswerIndex = index;
      hasAnswered = true;
    });

    bool isCorrect = currentQuestion.answers[index].isCorrect;

    if (isCorrect) {
      Future.delayed(Duration(milliseconds: 500), () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CompletionScreen(),
          ),
        );
      });
    }
  }

  Color getAnswerColor(int index) {
    if (!hasAnswered) return Colors.purple.shade50;

    if (currentQuestion.answers[index].isCorrect) {
      return Colors.green.shade100;
    } else if (selectedAnswerIndex == index) {
      return Colors.red.shade100;
    }
    return Colors.grey.shade100;
  }

  Color getBorderColor(int index) {
    if (!hasAnswered) return Colors.purple;

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
        title: Text('Question 2 of 2'),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Rive Animation Container
            Container(
              height: 120,
              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                color: Colors.purple.shade50,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.purple, width: 2),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(13),
                child: RiveAnimation.asset(
                  'assets/untitled.riv',
                  fit: BoxFit.contain,
                  // Use a fallback if animation fails to load
                  onInit: (artboard) {
                    print('Rive animation loaded successfully');
                  },
                ),
              ),
            ),

            // Question Section
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.purple.shade50,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.purple, width: 2),
              ),
              child: Text(
                currentQuestion.questionText,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple.shade800,
                ),
                textAlign: TextAlign.center,
              ),
            ),

            SizedBox(height: 30),

            // Rest of the existing code remains the same...
            Text(
              'Select an answer:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.grey.shade700,
              ),
            ),

            SizedBox(height: 15),

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
                                  String.fromCharCode(65 + index),
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
                      ? '🎉 Excellent! Quiz completed successfully!'
                      : '❌ Incorrect. The correct answer is French.',
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

// First Quiz Screen (updated with Rive animation)
class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int? selectedAnswerIndex;
  bool hasAnswered = false;

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

    bool isCorrect = currentQuestion.answers[index].isCorrect;

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
        title: Text('Question 1 of 2'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Rive Animation Container
            Container(
              height: 120,
              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.blue, width: 2),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(13),
                child: RiveAnimation.asset(
                  'assets/untitled.riv',
                  fit: BoxFit.contain,
                  // Optional: Add animation controls
                  onInit: (artboard) {
                    print('Rive animation initialized');
                  },
                ),
              ),
            ),

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

            // Rest of the quiz UI remains the same...
            Text(
              'Select an answer:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.grey.shade700,
              ),
            ),

            SizedBox(height: 15),

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
                                  String.fromCharCode(65 + index),
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
                      ? '🎉 Correct! Moving to next question...'
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

// Completion Screen
class CompletionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz Complete'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Rive Animation Container for completion
              Container(
                height: 200,
                margin: EdgeInsets.only(bottom: 30),
                decoration: BoxDecoration(
                  color: Colors.green.shade50,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.green, width: 3),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 2,
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
              ),

              Text(
                'Congratulations!',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.green.shade800,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'You have successfully completed the quiz!',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.green.shade600,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                ),
                child: Text(
                  'Restart Quiz',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App with Rive',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: QuizScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
