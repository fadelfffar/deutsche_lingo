import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AnswerModel {
  final String answer;
  bool isCorrect;

  AnswerModel({
    required this.answer,
    required this.isCorrect
});
  // Factory constructor for JSON deserialization
  factory AnswerModel.fromJson(Map<String, dynamic> json) {
    return AnswerModel(
      answer: json['answer'] as String,
      isCorrect: json['is_correct'] as bool,
    );
  }
    // Convert to JSON for database operations
    Map<String, dynamic> toJson() {
      return {
        'answer': answer,
        'is_correct': isCorrect,
      };
    }
}
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final _response = Supabase.instance.client
      .from('answer1')
      .select()
      .asStream();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            Text("Please Answer this question, pick the correct box to answer!", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),),
            Text("What does 'Ich bin müde' mean in English?", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            SizedBox(height: 20,),
            Expanded(
                child: StreamBuilder<List<Map<String, dynamic>>>(
                    stream: _response,
                    builder: (context, snapshot){
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Text("Loading");
                      }
                      if (snapshot.hasData) {
                        final answers = snapshot.data!;
                        return ListView.builder(
                          padding:  EdgeInsets.all(12),
                          itemCount: answers.length,
                          itemBuilder: (context, index) {
                            final answer = answers[index];
                            return Container(
                              child: Text(answer['answer']),
                            );
                          },
                        );
                      }
                      else if (snapshot.hasError) {
                        return Text('Something went wrong');
                      } else if (!snapshot.hasData) {
                        // By default, show a loading spinner.
                        return const CircularProgressIndicator();
                      }
                      return Text("No comments found");
                    }
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
