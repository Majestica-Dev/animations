import 'package:flutter/material.dart';

import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  path: 'Staggered',
  name: 'Home Page Animated',
  type: AnimatedBuilder,
)
Widget smoothLoadingIndicator(BuildContext context) {
  return const HomePageAnimated();
}

class HomePageAnimated extends StatefulWidget {
  const HomePageAnimated({super.key});

  @override
  State<HomePageAnimated> createState() => _HomePageAnimatedState();
}

class _HomePageAnimatedState extends State<HomePageAnimated>
    with TickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..forward();
  }

  @override
  Widget build(BuildContext context) {
    return HomePageAnimatedBuilder(
      animation: animationController,
      builder: (context, child, animation) {
        return ListView(
          children: [
            const SizedBox(height: 10),
            Opacity(
              opacity: animation.headerOpacity.value,
              child: Container(
                width: 300,
                height: 300,
                color: Colors.red,
              ),
            ),
            const SizedBox(height: 10),
            SlideTransition(
              position: animation.rowOffset,
              child: Row(
                children: [
                  Container(
                    width: 300,
                    height: 300,
                    color: Colors.blue,
                  ),
                  const SizedBox(width: 10),
                  Container(
                    width: 300,
                    height: 300,
                    color: Colors.red,
                  ),
                ],
              ),
            ),
          ],
        );
      },
      child: Container(
        width: 300,
        height: 300,
        color: Colors.red,
      ),
    );
  }

  @override
  void dispose() {
    animationController.dispose();

    super.dispose();
  }
}

class HomePageAnimatedBuilder extends StatelessWidget {
  final MyTransitionBuilder builder;
  final AnimationController animation;
  final Widget? child;

  const HomePageAnimatedBuilder({
    super.key,
    required this.builder,
    required this.animation,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return builder(context, child!, HomePageEnterAnimation(animation));
      },
      child: child,
    );
  }
}

typedef MyTransitionBuilder = Widget Function(
  BuildContext context,
  Widget child,
  HomePageEnterAnimation animation,
);

class HomePageEnterAnimation {
  final AnimationController animation;
  final Animation<double> headerOpacity;
  final Animation<Offset> rowOffset;

  HomePageEnterAnimation(
    this.animation,
  )   : headerOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: animation,
            curve: Curves.easeIn,
          ),
        ),
        rowOffset =
            Tween<Offset>(begin: const Offset(0, 5), end: Offset.zero).animate(
          CurvedAnimation(
            parent: animation,
            curve: Curves.easeOut,
          ),
        );
}
