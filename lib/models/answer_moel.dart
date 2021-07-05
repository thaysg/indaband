import 'dart:convert';

class AnswerModel {
  final String music;
  final String band;

  AnswerModel({
    required this.music,
    required this.band,
  });

  Map<String, dynamic> toMap() {
    return {
      'music': music,
      'band': band,
    };
  }

  factory AnswerModel.fromMap(Map<String, dynamic> map) {
    return AnswerModel(
      music: map['music'],
      band: map['band'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AnswerModel.fromJson(String source) =>
      AnswerModel.fromMap(json.decode(source));
}
