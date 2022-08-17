import 'package:quiz_app/features/quiz/domain/entities/quiz.dart';

class QuizModel extends Quiz {
  QuizModel({
    required super.category,
    required super.id,
    required super.correctAnswer,
    required super.incorrectAnswer,
    required super.question,
  });

  factory QuizModel.fromJson(Map<String, dynamic> json) {
    return QuizModel(
      category: json['category'],
      id: json['id'],
      correctAnswer: json['correctAnswer'],
      incorrectAnswer: json['incorrectAnswers'],
      question: json['question'],
    );
  }
}
