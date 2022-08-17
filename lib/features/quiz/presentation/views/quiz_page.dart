import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app/features/quiz/presentation/logic/quiz_controller.dart';

import '../../../../core/app_constant.dart';

class QuizPage extends ConsumerStatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _QuizPageState();
}

class _QuizPageState extends ConsumerState<QuizPage> {
  int index = 0;
  bool optionSelected = false;
  Color optionColor = Colors.grey[300]!;
  bool isClicked = false;
  List<Color> optionColors = [
    Colors.grey[300]!,
    Colors.grey[300]!,
    Colors.grey[300]!,
    Colors.grey[300]!,
  ];
  Color selectedColor = Colors.white;

  bool isAnswered = false;

  int? optionID;

  bool option1 = false;
  bool option2 = false;
  bool option3 = false;
  bool option4 = false;

  @override
  Widget build(BuildContext context) {
    final quiz = ref.watch(quizNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz Page'),
      ),
      body: quiz.when(
        data: (data) {
          List options = [
            ...data[index].incorrectAnswer,
            data[index].correctAnswer,
          ];

          List randomOption = [
            ...options..shuffle(),
          ];
          log(randomOption[0]);

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              children: [
                Text("${index + 1}. ${data[index].question}"),
                const SizedBox(
                  height: 30,
                ),
                ListView(
                  shrinkWrap: true,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          option1 = true;
                          option2 = false;
                          option3 = false;
                          option4 = false;

                          isClicked = true;
                        });
                        if (option1) {
                          setState(() {
                            selectedColor = AppConstant.primaryColor;
                            isAnswered = true;
                            optionID = randomOption[0];
                          });
                        }
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        height: 45,
                        decoration: BoxDecoration(
                          color: optionColors[0],
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: option1
                                ? AppConstant.primaryColor
                                : Colors.grey[300]!,
                          ),
                        ),
                        child: Center(
                          child: Text(randomOption[0]),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          option1 = false;
                          option2 = true;
                          option3 = false;
                          option4 = false;

                          isClicked = true;
                        });
                        if (option2) {
                          setState(() {
                            selectedColor = AppConstant.primaryColor;
                            isAnswered = true;
                            optionID = randomOption[1];
                          });
                        }
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        height: 45,
                        decoration: BoxDecoration(
                          color: optionColors[1],
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: option2
                                ? AppConstant.primaryColor
                                : Colors.grey[300]!,
                          ),
                        ),
                        child: Center(
                          child: Text(randomOption[1]),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          option1 = false;
                          option2 = false;
                          option3 = true;
                          option4 = false;

                          isClicked = true;
                        });
                        if (option3) {
                          setState(() {
                            selectedColor = AppConstant.primaryColor;
                            isAnswered = true;
                            optionID = randomOption[2];
                          });
                        }
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        height: 45,
                        decoration: BoxDecoration(
                          color: optionColors[2],
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: option3
                                ? AppConstant.primaryColor
                                : Colors.grey[300]!,
                          ),
                        ),
                        child: Center(
                          child: Text(randomOption[2]),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          option1 = false;
                          option2 = false;
                          option3 = false;
                          option4 = true;

                          isClicked = true;
                        });
                        if (option4) {
                          setState(() {
                            selectedColor = AppConstant.primaryColor;
                            isAnswered = true;
                            optionID = randomOption[3];
                          });
                        }
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        height: 45,
                        decoration: BoxDecoration(
                          color: optionColors[3],
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: option4
                                ? AppConstant.primaryColor
                                : Colors.grey[300]!,
                          ),
                        ),
                        child: Center(
                          child: Text(randomOption[3]),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ],
            ),
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
