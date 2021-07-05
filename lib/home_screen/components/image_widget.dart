import 'package:flutter/material.dart';

import '../../components/text_span_widget.dart';

class ImageWidget extends StatelessWidget {
  final AssetImage picture;
  final String title;
  final String subtitle;
  const ImageWidget({
    Key? key,
    required this.picture,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 24,
        horizontal: 6,
      ),
      child: Stack(
        children: [
          Container(
            width: 208,
            height: 230,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: picture,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: 56,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF000000).withOpacity(0),
                    Color(0xFF000000),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.play_circle),
                  ),
                  TextSpanWidget(
                    title: title,
                    subtitle: subtitle,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
