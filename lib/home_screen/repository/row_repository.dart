import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:indaband/models/row_album_model.dart';

class RowRepository {
  Future<List<RowAlbumModel>> getAlbum() async {
    final response =
        await rootBundle.loadString("assets/database/row_album.json");
    final list = jsonDecode(response) as List;
    final album = list.map((e) => RowAlbumModel.fromMap(e)).toList();
    return album;
  }
}
