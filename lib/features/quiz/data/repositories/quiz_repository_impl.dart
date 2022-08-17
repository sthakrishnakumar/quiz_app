import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/app_error.dart';
import '../../domain/repository/quiz_repository.dart';
import '../data_source/quiz_data_source.dart';
import '../models/quiz_model.dart';

class QuizRepositoryImpl implements QuizRepository {
  QuizDataSource quizDataSource;
  QuizRepositoryImpl(this.quizDataSource);
  @override
  Future<Either<AppError, List<QuizModel>>> quiz() async {
    try {
      final result = await quizDataSource.quiz();
      return Right(result);
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }
}

final quizRepoProvider = Provider<QuizRepository>((ref) {
  return QuizRepositoryImpl(ref.watch(quizDataSourceProvider));
});
