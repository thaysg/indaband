import 'package:flutter/material.dart';
import 'package:indaband/components/text_span_widget.dart';

/* class QuizCardWidget extends StatelessWidget {
  final String title;

  final VoidCallback onTap;
  final String picture;

  const QuizCardWidget({
    Key? key,
    required this.title,
    required this.onTap,
    required this.picture,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: onTap,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                picture,
                height: 137,
                width: 137,
                //fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text('data')
        ],
      ),
    );
  }
} */

class QuizCardWidget extends StatelessWidget {
  final String subTitle;
  final String band;
  final VoidCallback onTap;
  final String picture;

  const QuizCardWidget({
    Key? key,
    required this.subTitle,
    required this.onTap,
    required this.picture,
    required this.band,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: GestureDetector(
            onTap: onTap,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              elevation: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  picture,
                  height: 160,
                  width: 160,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        TextSpanWidget(
          title: subTitle,
          subtitle: band,
        ),
      ],
    );
  }
}
