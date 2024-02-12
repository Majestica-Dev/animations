import 'dart:math';

import 'package:flutter/material.dart';

import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  path: 'Explicit',
  name: 'Snow Effect',
  type: AnimatedBuilder,
)
Widget smoothLoadingIndicator(BuildContext context) {
  return const SnowEffect();
}

class SnowEffect extends StatefulWidget {
  const SnowEffect({super.key});

  @override
  State<SnowEffect> createState() => _SnowEffectState();
}

class _SnowEffectState extends State<SnowEffect> with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> animation;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..forward();

    animation = TweenSequence<Offset>(
      <TweenSequenceItem<Offset>>[
        TweenSequenceItem(
          tween: Tween(
              begin: Offset(0, Random().nextInt(1000).toDouble()),
              end: Offset(
                1000,
                Random().nextInt(1000).toDouble(),
              )),
          weight: 0.5,
        ),
      ],
    ).animate(animationController);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return Positioned(
          top: animation.value.dx,
          left: animation.value.dy,
          child: child!,
        );
      },
      child: const Icon(
        Icons.ac_unit_rounded,
        color: Colors.grey,
      ),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
