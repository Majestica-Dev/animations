import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  path: 'Explicit',
  name: 'Rotating Box',
  type: AnimatedBuilder,
)
Widget smoothLoadingIndicator(BuildContext context) {
  return const RotatingBox();
}

class RotatingBox extends StatefulWidget {
  const RotatingBox({super.key});

  @override
  State<RotatingBox> createState() => _RotatingBoxState();
}

class _RotatingBoxState extends State<RotatingBox>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> rotateAnimation;
  late Animation sizeAnimation;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..forward();

    sizeAnimation = TweenSequence<double>(
      <TweenSequenceItem<double>>[
        TweenSequenceItem(
          tween: Tween(begin: 1, end: 1.5),
          weight: 0.5,
        ),
        TweenSequenceItem(
          tween: Tween(begin: 1.5, end: 0),
          weight: 1,
        )
      ],
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.5, 1, curve: Curves.linear),
      ),
    );

    rotateAnimation = TweenSequence<double>(
      <TweenSequenceItem<double>>[
        TweenSequenceItem<double>(
          tween: Tween<double>(
            begin: 0,
            
            end: math.pi / 4,
          ).chain(CurveTween(curve: Curves.easeOutCubic)),
          weight: 1,
        ),
        TweenSequenceItem<double>(
          tween: Tween<double>(
            begin: math.pi / 4,
            end: -math.pi / 4,
          ).chain(CurveTween(curve: Curves.easeInOutCubic)),
          weight: 2,
        ),
        TweenSequenceItem<double>(
          tween: Tween<double>(
            begin: -math.pi / 4,
            end: math.pi * 12 + math.pi / 4,
          ).chain(CurveTween(curve: Curves.easeInOutCubic)),
          weight: 6,
        ),
        TweenSequenceItem<double>(
          tween: Tween<double>(
            begin: math.pi / 4,
            end: 0,
          ).chain(CurveTween(curve: Curves.easeInCubic)),
          weight: 2,
        ),
      ],
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.0, 0.5),
      ),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: rotateAnimation,
      builder: (context, child) {
        return Center(
          child: Transform.rotate(
            angle: rotateAnimation.value,
            child: Transform.scale(
              scale: sizeAnimation.value,
              child: const Icon(
                Icons.woman,
                size: 300,
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
