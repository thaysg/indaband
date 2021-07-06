import 'package:flutter/material.dart';

class MusicSlider extends StatelessWidget {
  final double sliderValue;
  final int? min;
  final int? max;
  final ValueChanged onChange;
  const MusicSlider({
    Key? key,
    required this.sliderValue,
    required this.onChange,
    this.min,
    this.max,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderThemeData(
        trackShape: CustomTrackShape(),
        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 6),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Slider(
          activeColor: Colors.white,
          inactiveColor: Colors.white.withOpacity(.2),
          value: sliderValue,
          onChanged: onChange,
        ),
      ),
    );
  }
}

class CustomTrackShape extends RoundedRectSliderTrackShape {
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final double trackHeight = 1;
    final double trackLeft = offset.dx;
    final double trackTop =
        offset.dy + (parentBox.size.height - trackHeight) / 2;
    final double trackWidth = parentBox.size.width;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}
