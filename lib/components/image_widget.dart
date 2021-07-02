import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  final AssetImage picture;
  const ImageWidget({
    Key? key,
    required this.picture,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 6),
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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.play_circle),
                  ),
                  Text(
                    'data',
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
