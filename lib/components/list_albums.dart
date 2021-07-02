import 'package:flutter/material.dart';
import 'package:indaband/components/image_widget.dart';

class ListAlbums extends StatelessWidget {
  const ListAlbums({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ImageWidget(
            picture: AssetImage(
              'assets/images/Rectangle 46.png',
            ),
          ),
          ImageWidget(
            picture: AssetImage(
              'assets/images/Rectangle 48@3x.png',
            ),
          ),
        ],
      ),
    );
  }
}
