import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app/features/quiz/presentation/logic/quiz_controller.dart';

class QuizPage extends ConsumerStatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _QuizPageState();
}

class _QuizPageState extends ConsumerState<QuizPage> {
  @override
  Widget build(BuildContext context) {
    final quiz = ref.watch(quizNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz Page'),
      ),
      body: quiz.when(
        data: (d) {
          return Column(
            children: [
              ...d.map(
                (e) => Text(e.question),
              )
            ],
          );
        },
        error: (err, s) => Text(err.toString()),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
