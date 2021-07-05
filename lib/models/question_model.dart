import 'dart:convert';

class QuestionModel {
  final String title;
  /*  final String music;
  final String band; */
  //final List<AnswerModel> answers;

  QuestionModel({
    required this.title,
    /* required this.music,
    required this.band, */
    // required this.answers,
  }) /* : assert(answers.length == 4) */;

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      /*  'music': music,
      'band': band, */
      //'answers': answers.map((x) => x.toMap()).toList(),
    };
  }

  factory QuestionModel.fromMap(Map<String, dynamic> map) {
    return QuestionModel(
      title: map['title'],
      /*  music: map['music'],
      band: map['band'], */

      /*  answers: List<AnswerModel>.from(
          map['answers']?.map((x) => AnswerModel.fromMap(x))), */
    );
  }

  String toJson() => json.encode(toMap());

  factory QuestionModel.fromJson(String source) =>
      QuestionModel.fromMap(json.decode(source));
}
