import 'package:flutter/material.dart';

import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  path: 'Tweens',
  name: 'Tween Animation Demo',
  type: TweenAnimationBuilder,
)
Widget tweenAnimationDemoExample(BuildContext context) {
  return const TweenAnimationDemoExample();
}

class TweenAnimationDemoExample extends StatefulWidget {
  const TweenAnimationDemoExample({super.key});

  @override
  State<TweenAnimationDemoExample> createState() =>
      _TweenAnimationDemoExampleState();
}

class _TweenAnimationDemoExampleState extends State<TweenAnimationDemoExample> {
  double scale = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TweenAnimationDemo(scale: scale),
        const SizedBox(height: 20),
        ElevatedButton(
            onPressed: () {
              setState(() {
                if (scale == 1) {
                  scale = 2;
                } else {
                  scale = 1;
                }
              });
            },
            child: const Text('play'))
      ],
    );
  }
}

class TweenAnimationDemo extends StatelessWidget {
  final double scale;

  const TweenAnimationDemo({super.key, required this.scale});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TweenAnimationBuilder(
        tween: Tween<double>(begin: 0, end: scale),
        curve: Curves.easeInOut,
        duration: const Duration(seconds: 1),
        builder: (context, value, child) {
          return Transform.scale(
            scale: value,
            child: child,
          );
        },
        child: const Text(
          'I am child',
        ),
      ),
    );
  }
}
