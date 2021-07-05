import 'package:flutter/material.dart';
import 'package:indaband/home_screen/components/image_widget.dart';
import 'package:indaband/player_screen/player_screen.dart';

class ListAlbums extends StatelessWidget {
  const ListAlbums({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          GestureDetector(
            onTap: () {},
            child: ImageWidget(
              picture: AssetImage(
                'assets/images/Rectangle 46.png',
              ),
              title: 'Making A Fire ',
              subtitle: 'Foo Fighters',
            ),
          ),
          ImageWidget(
            picture: AssetImage(
              'assets/images/Rectangle 48.png',
            ),
            title: 'WOW ',
            subtitle: 'Tiesto',
          ),
        ],
      ),
    );
  }
}
