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

  bool backButton = false;

  bool playButton = false;

  bool forwardButton = false;

  double initialSong = 0.00;

  double finalSong = 5.10;

  double sliderSoundValue = 0.2;

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
                  width: MediaQuery.of(context).size.width * 343,
                  height: MediaQuery.of(context).size.height * .368,
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
                    sliderValue: initialSong.toDouble(),
                    min: 0,
                    max: 100,
                    onChange: (v) {
                      setState(() {
                        initialSong = v;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: TimeMusic(
                    initialValue: initialSong.toStringAsFixed(2),
                    finalValue: finalSong.toStringAsFixed(2),
                  ),
                ),
                Expanded(
                  child: ButtonsMusic(
                    onTapRewind: () {
                      setState(() {
                        backButton = !backButton;
                      });
                    },
                    iconRewind: Icons.skip_previous,
                    backColor: backButton
                        ? Colors.white
                        : Color(0xFFFFFFFF).withOpacity(.38),
                    sizeRewind: 24,
                    onTapPlay: () {
                      setState(() {
                        playButton = !playButton;
                      });
                    },
                    iconPlay: playButton
                        ? Icons.pause_circle_filled
                        : Icons.play_circle_filled,
                    playColor: Colors.white,
                    sizePlay: 66,
                    onTapForward: () {
                      setState(() {
                        forwardButton = !forwardButton;
                      });
                    },
                    iconForward: Icons.skip_next,
                    sizeForward: 24,
                    forwardColor: forwardButton
                        ? Colors.white
                        : Color(0xFFFFFFFF).withOpacity(.38),
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
                          sliderValue: sliderSoundValue,
                          onChange: (s) {
                            setState(() {
                              sliderSoundValue = s;
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
