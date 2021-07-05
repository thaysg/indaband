import 'package:flutter/material.dart';
import 'package:indaband/components/body.dart';
import 'package:indaband/models/question_model.dart';
import 'package:indaband/player_screen/components/buttons_music.dart';

import 'components/album_widget.dart';
import 'components/detail_music.dart';
import 'components/music_slider.dart';
import 'components/time_music.dart';
import 'controller/challenge_controller.dart';

class PlayerScreen extends StatefulWidget {
  final List<QuestionModel> questions;
  const PlayerScreen({
    Key? key,
    required this.questions,
  }) : super(key: key);

  @override
  _PlayerScreenState createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  double sliderValue = 0.2;
  final controller = ChallengeController();
  final pageController = PageController();

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      controller.currentPage = pageController.page!.toInt() + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BodyScreen(
          myWidget: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 16,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * .5,
                  //width: MediaQuery.of(context).size.width,
                  child: PageView(
                    physics: NeverScrollableScrollPhysics(),
                    controller: pageController,
                    children: widget.questions
                        .map(
                          (e) => AlbumWidget(
                            question: e,
                          ),
                        )
                        .toList(),
                  ),
                ),
                DetailMuscic(),
                Expanded(
                  child: MusicSlider(
                    sliderValue: sliderValue,
                    onChange: (v) {
                      setState(() {
                        sliderValue = v;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: TimeMusic(),
                ),
                Expanded(
                  child: ButtonsMusic(
                    onTapRewind: () {},
                    iconRewind: Icons.fast_rewind,
                    sizeRewind: 24,
                    onTapPlay: () {},
                    iconPlay: Icons.play_circle,
                    sizePlay: 66,
                    onTapForward: () {},
                    iconForward: Icons.fast_forward,
                    sizeForward: 24,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Expanded(
                  flex: 3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.volume_down,
                        size: 20,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: MusicSlider(
                          sliderValue: sliderValue,
                          onChange: (v) {
                            setState(() {
                              sliderValue = v;
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.volume_up,
                        size: 20,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
