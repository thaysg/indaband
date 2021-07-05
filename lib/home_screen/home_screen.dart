import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:indaband/components/body.dart';
import 'package:indaband/components/constants.dart';
import 'package:indaband/home_screen/components/list_albums.dart';
import 'package:indaband/home_screen/components/most_played_widget.dart';
import 'package:indaband/home_screen/components/row_album.dart';
import 'package:indaband/home_screen/components/search_widget.dart';
import 'package:indaband/components/text_widget.dart';
import 'package:indaband/player_screen/player_screen.dart';

import 'home_controller.dart/home_controller.dart';
import 'home_controller.dart/row_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = HomeController();
  final rowController = RowController();

  void initState() {
    super.initState();
    controller.getQuizzes();
    controller.stateNotifier.addListener(() {
      setState(() {});
    });
    rowController.getAlbum();
    rowController.stateNotifier.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final transitionType = ContainerTransitionType.fade;

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
              //ListAlbums(),
              SizedBox(
                height: 230,
                //width: 500,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: rowController.album!
                        .map(
                          (e) => RowAlbum(
                            onTap: () {
                              Navigator.push(
                                context,
                                PageRouteBuilder(
                                  transitionDuration:
                                      Duration(milliseconds: 600),
                                  transitionsBuilder: (context, animation,
                                      animationTime, child) {
                                    animation = CurvedAnimation(
                                      parent: animation,
                                      curve: Curves.easeInCirc,
                                    );
                                    return ScaleTransition(
                                      alignment: Alignment.center,
                                      scale: animation,
                                      child: child,
                                    );
                                  },
                                  pageBuilder: (
                                    context,
                                    animation,
                                    animationTime,
                                  ) {
                                    return PlayerScreen(
                                      questions: e.questions,
                                    );
                                  },
                                ),
                              );
                              /* Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PlayerScreen(
                                    questions: e.questions,
                                  ),
                                ),
                              );
                              print('object'); */
                              /* OpenContainer(
                                transitionType: transitionType,
                                transitionDuration: Duration(seconds: 3),
                                openBuilder: (context, _) => PlayerScreen(
                                  questions: e.questions,
                                ),
                                closedBuilder:
                                    (context, VoidCallback openContainer) =>
                                        PlayerScreen(
                                  questions: e.questions,
                                ),
                              ); */
                            },
                            picture: e.image,
                            subTitle: e.subTitle,
                            band: e.band,
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
              TextWidget(
                title: 'Most Played',
                textStyle: textCategories,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 8,
                width: MediaQuery.of(context).size.width * 6,
                child: GridView.count(
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  //crossAxisSpacing: 15,
                  mainAxisSpacing: 12,
                  children: controller.quizzes!
                      .map(
                        (e) => QuizCardWidget(
                          onTap: () {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                transitionDuration: Duration(milliseconds: 600),
                                transitionsBuilder:
                                    (context, animation, animationTime, child) {
                                  /* animation = CurvedAnimation(
                                    parent: animation,
                                    curve: Curves.easeInCirc,
                                  ); */
                                  return ScaleTransition(
                                    alignment: Alignment.center,
                                    scale: animation,
                                    child: child,
                                  );
                                },
                                pageBuilder: (
                                  context,
                                  animation,
                                  animationTime,
                                ) {
                                  return PlayerScreen(
                                    questions: e.questions,
                                  );
                                },
                              ),
                            );
                            print('object');
                          },
                          subTitle: e.subTitle,
                          band: e.band,
                          picture: e.image,
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
