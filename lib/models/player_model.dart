import 'dart:convert';

import 'question_model.dart';

enum Album {
  album1,
  album2,
  album3,
  album4,
  album5,
  album6,
}

extension AlbumStringExt on String {
  Album get parse => {
        "album1": Album.album1,
        "album2": Album.album2,
        "album3": Album.album3,
        "album4": Album.album4,
        "whoAmI": Album.album5,
        "verses": Album.album6,
      }[this]!;
}

extension AlbumExt on Album {
  String get parse => {
        Album.album1: "album1",
        Album.album2: "album2",
        Album.album3: "album3",
        Album.album4: "album4",
        Album.album5: "album5",
        Album.album6: "album6",
      }[this]!;
}

class QuizModel {
  final String title;
  final List<QuestionModel> questions;
  final int questionAnswerd;
  final String image;
  final Album album;
  final String subTitle;
  final String band;

  QuizModel({
    required this.title,
    required this.questions,
    this.questionAnswerd = 0,
    required this.image,
    required this.album,
    required this.subTitle,
    required this.band,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'questions': questions.map((x) => x.toMap()).toList(),
      'questionAnswerd': questionAnswerd,
      'image': image,
      'album': album.parse,
      'subTitle': subTitle,
      'band': band,
    };
  }

  factory QuizModel.fromMap(Map<String, dynamic> map) {
    return QuizModel(
      title: map['title'],
      questions: List<QuestionModel>.from(
          map['questions']?.map((x) => QuestionModel.fromMap(x))),
      questionAnswerd: map['questionAnswerd'],
      image: map['image'],
      album: map['album'].toString().parse,
      subTitle: map['subTitle'],
      band: map['band'],
    );
  }

  String toJson() => json.encode(toMap());

  factory QuizModel.fromJson(String source) =>
      QuizModel.fromMap(json.decode(source));
}
