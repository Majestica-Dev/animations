import 'package:flutter/material.dart';

import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  path: 'Explicit',
  name: 'Animated Radianing Icon',
  type: AnimatedBuilder,
)
Widget animatedAlignState(BuildContext context) {
  return Center(
    child: Container(
      color: Colors.blue,
      width: 200,
      height: 200,
      child: const Center(
        child: AnimatedRadianingIcon(),
      ),
    ),
  );
}

class AnimatedRadianingIcon extends StatefulWidget {
  const AnimatedRadianingIcon({super.key});

  @override
  State<AnimatedRadianingIcon> createState() => _AnimatedRadianingIconState();
}

class _AnimatedRadianingIconState extends State<AnimatedRadianingIcon>
    with TickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )
      ..forward()
      ..repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) {
        return DecoratedBox(
          decoration: ShapeDecoration(
            shape: const CircleBorder(),
            color: Colors.white.withOpacity(0.5),
          ),
          child: Padding(
            padding: EdgeInsets.all(8 * animationController.value),
            child: child,
          ),
        );
      },
      child: DecoratedBox(
        decoration: const ShapeDecoration(
          shape: CircleBorder(),
          color: Colors.white,
        ),
        child: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.calendar_today_outlined,
            color: Colors.blue,
            size: 24,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
