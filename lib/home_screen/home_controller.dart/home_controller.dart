import 'package:flutter/widgets.dart';
import 'package:indaband/home_screen/repository/home_repository.dart';
import 'package:indaband/models/player_model.dart';

import 'home_state.dart';

class HomeController {
  final stateNotifier = ValueNotifier<HomeState>(HomeState.empty);
  set state(HomeState state) => stateNotifier.value = state;
  HomeState get state => stateNotifier.value;

  List<QuizModel>? quizzes;

  final repository = HomeRepository();

  void getQuizzes() async {
    state = HomeState.loading;

    quizzes = await repository.getQuizzes();
    state = HomeState.success;
  }
}
