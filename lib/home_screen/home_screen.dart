import 'package:flutter/material.dart';
import 'package:indaband/components/body.dart';
import 'package:indaband/components/constants.dart';
import 'package:indaband/components/list_albums.dart';
import 'package:indaband/components/search_widget.dart';
import 'package:indaband/components/text_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        backgroundColor: primaryColor,
        elevation: 0,
      ),
      body: BodyScreen(
        myWidget: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
          ),
          child: ListView(
            children: [
              TextWidget(
                title: 'Discover',
                textStyle: textTitle,
              ),
              SearchWidget(),
              ListAlbums(),
              TextWidget(
                title: 'Most Played',
                textStyle: textCategories,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
