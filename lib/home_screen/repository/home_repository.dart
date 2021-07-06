import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:indaband/models/player_model.dart';

class HomeRepository {
  Future<List<QuizModel>> getQuizzes() async {
    final response =
        await rootBundle.loadString("assets/database/quizzes.json");
    final list = jsonDecode(response) as List;
    final quizzes = list.map((e) => QuizModel.fromMap(e)).toList();
    return quizzes;
  }
}
