import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  path: 'Implicit',
  name: 'Animated Text',
  type: AnimatedText,
)
Widget animatedAlignState(BuildContext context) {
  return const Center(child: AnimatedText());
}

class AnimatedText extends StatelessWidget {
  const AnimatedText({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(
      repeatForever: true,
      animatedTexts: [
        TyperAnimatedText('Number one of our world'),
        FadeAnimatedText('Number one of our world'),
        RotateAnimatedText('Number one of our world'),
        ScaleAnimatedText('Number one of our world'),
        ColorizeAnimatedText(
          'Number one of our world',
          textStyle: const TextStyle(fontSize: 30),
          colors: [Colors.blue, Colors.red],
        ),
        WavyAnimatedText('Number one of our world'),
      ],
    );
  }
}
