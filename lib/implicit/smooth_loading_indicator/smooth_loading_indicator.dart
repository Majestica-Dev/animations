import 'package:flutter/material.dart';

import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  path: 'Implicit',
  name: 'Loading Indicator',
  type: ImplicitlyAnimatedWidget,
)
Widget smoothLoadingIndicator(BuildContext context) {
  return const SmoothLodingIndicatorExample();
}

//Example
class SmoothLodingIndicatorExample extends StatefulWidget {
  const SmoothLodingIndicatorExample({super.key});

  @override
  State<SmoothLodingIndicatorExample> createState() =>
      _SmoothLodingIndicatorExampleState();
}

class _SmoothLodingIndicatorExampleState
    extends State<SmoothLodingIndicatorExample> {
  double progressValue = 0;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SmoothLoadingIndicator(progress: progressValue),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              setState(() {
                if (progressValue > 0.9) {
                  progressValue -= 0.1;
                } else {
                  progressValue += 0.1;
                }
              });
            },
            child: const Text('progress'),
          )
        ],
      ),
    );
  }
}

//SmoothLoadingIndicator
class SmoothLoadingIndicator extends ImplicitlyAnimatedWidget {
  final double progress;
  final Color color;
  final Color backgorundColor;
  final Curve animationCurve;
  final Duration animationDuration;

  const SmoothLoadingIndicator({
    super.key,
    required this.progress,
    this.color = Colors.blue,
    this.backgorundColor = Colors.grey,
    this.animationCurve = Curves.easeInOut,
    this.animationDuration = const Duration(milliseconds: 300),
  }) : super(curve: animationCurve, duration: animationDuration);

  @override
  ImplicitlyAnimatedWidgetState<SmoothLoadingIndicator> createState() =>
      _SmoothLoadingIndicatorState();
}

class _SmoothLoadingIndicatorState
    extends AnimatedWidgetBaseState<SmoothLoadingIndicator> {
  Tween<double>? _progress;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircularProgressIndicator(
          strokeWidth: 10,
          backgroundColor: widget.backgorundColor,
          color: widget.color,
          value: _progress!.evaluate(animation),
        ),
      ],
    );
  }

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _progress = visitor(
      _progress,
      (widget.progress).clamp(0.01, 1.0),
      (targetValue) => Tween<double>(begin: targetValue as double),
    ) as Tween<double>;
  }
}
