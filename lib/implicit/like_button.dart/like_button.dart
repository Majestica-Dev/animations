import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  path: 'Implicit',
  name: 'Like Button',
  type: LikeButton,
)
Widget likeButton(BuildContext context) {
  return const Center(
    child: LikeButtonExample(),
  );
}

class LikeButtonExample extends StatelessWidget {
  const LikeButtonExample({super.key});

  @override
  Widget build(BuildContext context) {
    return const LikeButton(
      size: 80,
      likeCount: 0,
      countPostion: CountPostion.bottom,
    );
  }
}
