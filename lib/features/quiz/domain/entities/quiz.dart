class Quiz {
  final String category;
  final String id;
  final String correctAnswer;
  final List<String> incorrectAnswer;
  final String question;
  Quiz({
    required this.category,
    required this.id,
    required this.correctAnswer,
    required this.incorrectAnswer,
    required this.question,
  });
}
