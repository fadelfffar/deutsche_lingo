import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GermanQuizScreen(),
    );
  }
}

class GermanQuizScreen extends StatefulWidget {
  @override
  _GermanQuizScreenState createState() => _GermanQuizScreenState();
}

class _GermanQuizScreenState extends State<GermanQuizScreen> {
  int _selectedIndex = -1; // -1 indicates no selection
  final int _currentStep = 3;
  final int _totalSteps = 5;

  final List<String> options = [
    'Meine Katze',
    'Ich bin müde.',
    'Pizza und Pasta',
    'Ein Auto'
  ];

  void _selectOption(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF0F8FF), // Light blue background
      body: SafeArea(
        child: Column(
          children: [
            // Top Progress Bar
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
              color: Color(0xFF28A9A9), // Teal color
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Using a sized box for spacing to help center the progress dots
                  SizedBox(width: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(_totalSteps, (index) {
                      bool isCurrent = index + 1 == _currentStep;
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        width: isCurrent ? 24.0 : 12.0,
                        height: isCurrent ? 24.0 : 12.0,
                        decoration: BoxDecoration(
                          color: isCurrent ? Colors.white : Colors.white.withOpacity(0.5),
                          shape: BoxShape.circle,
                        ),
                        child: isCurrent
                            ? Center(
                          child: Text(
                            '$_currentStep',
                            style: TextStyle(
                              color: Color(0xFF28A9A9),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                            : null,
                      );
                    }),
                  ),
                  // Owl Icon
                  Icon(Icons.lightbulb_outline, color: Colors.white, size: 40), // Placeholder for owl
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        // Question Card
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 10,
                                offset: Offset(0, 5),
                              ),
                            ],
                          ),
                          child: Text(
                            'Was ist dein Lieblingsessen?',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                        SizedBox(height: 30.0),
                        // Answer Options
                        ...List.generate(options.length, (index) {
                          bool isSelected = _selectedIndex == index;
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: GestureDetector(
                              onTap: () => _selectOption(index),
                              child: Container(
                                width: double.infinity,
                                padding: const EdgeInsets.symmetric(vertical: 16.0),
                                decoration: BoxDecoration(
                                  color: isSelected ? Color(0xFF28A9A9) : Colors.white,
                                  borderRadius: BorderRadius.circular(30.0),
                                  border: Border.all(color: Color(0xFF28A9A9), width: 2),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      options[index],
                                      style: TextStyle(
                                        color: isSelected ? Colors.white : Color(0xFF28A9A9),
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    if (isSelected)
                                      Padding(
                                        padding: const EdgeInsets.only(left: 12.0),
                                        child: Icon(Icons.check, color: Colors.white),
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                      ],
                    ),
                    // Bottom Navigation
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          radius: 24,
                          backgroundColor: Color(0xFF28A9A9),
                          child: Icon(Icons.person_outline, color: Colors.white),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            // Handle 'Weiter' (Next) button press
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 16),
                          ),
                          child: Text(
                            'Weiter',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),
                        CircleAvatar(
                          radius: 24,
                          backgroundColor: Color(0xFF28A9A9),
                          child: Icon(Icons.mic_none, color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
