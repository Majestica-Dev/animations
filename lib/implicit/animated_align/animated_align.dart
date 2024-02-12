import 'package:flutter/material.dart';

import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  path: 'Implicit',
  name: 'Animated Align',
  type: AnimatedAlign,
)
Widget animatedAlignState(BuildContext context) {
  return const AnimatedAlignState();
}

class AnimatedAlignState extends StatefulWidget {
  const AnimatedAlignState({super.key});

  @override
  State<AnimatedAlignState> createState() => _AnimatedAlignStateState();
}

//Animated Align
class _AnimatedAlignStateState extends State<AnimatedAlignState> {
  AlignmentGeometry alignment = Alignment.center;
  @override
  Widget build(BuildContext context) {
    return AnimatedAlign(
      alignment: alignment,
      duration: const Duration(milliseconds: 1000),
      curve: Curves.easeOut,
      child: TextButton(
        onPressed: () {
          setState(() {
            if (alignment == Alignment.bottomRight) {
              alignment = Alignment.center;
            } else {
              alignment = Alignment.bottomRight;
            }
          });
        },
        child: Text('Animated $alignment'),
      ),
    );
  }
}
