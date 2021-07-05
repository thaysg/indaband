import 'package:flutter/material.dart';
import 'package:indaband/components/text_span_widget.dart';

class RowAlbum extends StatelessWidget {
  final VoidCallback onTap;
  final String subTitle;
  final String band;
  final String picture;
  const RowAlbum({
    Key? key,
    required this.onTap,
    required this.subTitle,
    required this.band,
    required this.picture,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 24,
          horizontal: 6,
        ),
        child: Stack(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              elevation: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  picture,
                  width: 208,
                  height: 230,
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
                      title: subTitle,
                      subtitle: band,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
