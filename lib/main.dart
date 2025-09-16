import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'home_screen.dart';

void main() async {;
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
      title: 'Flutter Row Column ListTile Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}
