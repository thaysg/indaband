import 'package:flutter/material.dart';
import 'package:indaband/components/constants.dart';

class TimeMusic extends StatelessWidget {
  const TimeMusic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '0:00',
          style: timeStyle,
        ),
        Text(
          '3:50',
          style: timeStyle,
        ),
      ],
    );
  }
}
