import 'package:dartz/dartz.dart';
import 'package:quiz_app/core/app_error.dart';
import 'package:quiz_app/features/quiz/data/models/quiz_model.dart';

abstract class QuizRepository {
  Future<Either<AppError, List<QuizModel>>> quiz();
}
