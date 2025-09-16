import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AnswerModel {
  final String answer;
  bool isCorrect;

  AnswerModel({
    required this.answer,
    required this.isCorrect
  });
}
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Row with 2 Columns & ListTiles'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        shape: BoxShape.rectangle,
                        border: Border.all(color: Colors.white, width: 3),
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [Colors.blue, Colors.green],
                        ),
                      ),
                      child: ListTile(
                        title: Text("I don't know what to do"),
                        subtitle: Text("This is subtitle"),
                      ),
                    )
                  ],
                ),
              ),
              Divider(),
            ],
          ),
      ),
      );
  }
}