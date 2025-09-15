import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'home_screen.dart';

Future<void> main() async {
  await Supabase.initialize(
    // TODO() : IMPORTANT!!! make this key and url private when committing to github
    url: 'https://yzujasgkedpvjiwovsic.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inl6dWphc2drZWRwdmppd292c2ljIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTc5MTk0MDYsImV4cCI6MjA3MzQ5NTQwNn0.h1fiWKWXfHb3djo2NUaVXeG8nchfC2uUTe7Df7P-5_E',
  );
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
      home: HomeScreen(),
    );
  }
}
