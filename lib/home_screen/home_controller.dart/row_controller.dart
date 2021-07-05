import 'package:flutter/widgets.dart';
import 'package:indaband/home_screen/repository/row_repository.dart';
import 'package:indaband/models/row_album_model.dart';

import 'home_state.dart';

class RowController {
  final stateNotifier = ValueNotifier<HomeState>(HomeState.empty);
  set state(HomeState state) => stateNotifier.value = state;
  HomeState get state => stateNotifier.value;
  List<RowAlbumModel>? album;
  final data = RowRepository();

  void getAlbum() async {
    state = HomeState.loading;

    album = await data.getAlbum();
    state = HomeState.success;
  }
}
