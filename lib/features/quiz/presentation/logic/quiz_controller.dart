import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app/core/app_error.dart';
import 'package:quiz_app/features/quiz/data/models/quiz_model.dart';
import 'package:quiz_app/features/quiz/data/repositories/quiz_repository_impl.dart';
import 'package:quiz_app/features/quiz/domain/repository/quiz_repository.dart';

class QuizNotifier extends StateNotifier<AsyncValue<List<QuizModel>>> {
  QuizNotifier(this.quizRepository) : super(const AsyncValue.loading()) {
    quiz();
  }
  QuizRepository quizRepository;
  quiz() async {
    final result = await quizRepository.quiz();
    result.fold(
      (l) => state = AsyncValue.error(AppError(l.message)),
      (r) => state = AsyncValue.data(r),
    );
  }
}

final quizNotifierProvider =
    StateNotifierProvider<QuizNotifier, AsyncValue<List<QuizModel>>>((ref) {
  return QuizNotifier(ref.watch(quizRepoProvider));
});
