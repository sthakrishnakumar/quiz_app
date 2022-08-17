import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app/core/api_client.dart';
import 'package:quiz_app/core/app_constant.dart';
import 'package:quiz_app/features/quiz/data/models/quiz_model.dart';

abstract class QuizDataSource {
  Future<List<QuizModel>> quiz();
}

class QuizDataSourceImpl implements QuizDataSource {
  ApiClient apiClient;
  QuizDataSourceImpl(this.apiClient);
  @override
  Future<List<QuizModel>> quiz() async {
    final result = await apiClient.request(endpoint: AppConstant.quiz);
    return List.from(result).map((e) => QuizModel.fromJson(e)).toList();
  }
}

final quizDataSourceProvider = Provider<QuizDataSource>((ref) {
  return QuizDataSourceImpl(ref.watch(apiClientProvider));
});
