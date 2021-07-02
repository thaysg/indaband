import 'package:flutter/material.dart';
import 'package:indaband/components/constants.dart';

class TextWidget extends StatelessWidget {
  final String title;
  final TextStyle textStyle;
  const TextWidget({
    Key? key,
    required this.title,
    required this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Text(
        title,
        style: textStyle,
      ),
    );
  }
}

class TextTitle extends StatelessWidget {
  final String title;
  const TextTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: textTitle,
    );
  }
}

class TextCategories extends StatelessWidget {
  final String title;
  const TextCategories({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: textCategories,
    );
  }
}

class TextAlbums extends StatelessWidget {
  final String title;
  const TextAlbums({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: textAlbums,
    );
  }
}
