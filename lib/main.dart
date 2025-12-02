import 'package:flutter/material.dart';

import 'exam_screen.dart';
import 'screens/landing_screen.dart';
import 'screens/signup_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const LingoApp());
}

class LingoApp extends StatefulWidget {
  const LingoApp({super.key});

  @override
  State<LingoApp> createState() => _LingoAppState();
}

class _LingoAppState extends State<LingoApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'For Fajr',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF004D40),
          brightness: Brightness.dark,
        ),
        scaffoldBackgroundColor: Colors.black,
      ),
      home: const LandingScreen(),
      routes: {
        '/signup': (context) => const SignUpScreen(),
        '/exam': (context) => const ExamScreen(studentName: 'Guest'),
      },
    );
  }
}
