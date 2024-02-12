import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vector_math/vector_math_64.dart' hide Colors;

class RadialMenu extends StatefulWidget {
  const RadialMenu({super.key});

  @override
  State<RadialMenu> createState() => _RadialMenuState();
}

class _RadialMenuState extends State<RadialMenu>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scale;
  late Animation<double> translation;
  late Animation<double> rotation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );

    scale = Tween<double>(begin: 1.5, end: 0.0).animate(
      CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn),
    );

    translation = Tween<double>(begin: 0, end: 100).animate(
      CurvedAnimation(parent: controller, curve: Curves.linear),
    );

    rotation = Tween<double>(begin: 0, end: 360).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0, 0.7, curve: Curves.decelerate),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return RadialAnimation(
      controller: controller,
      scale: scale,
      translation: translation,
      rotation: rotation,
    );
  }
}

class RadialAnimation extends StatelessWidget {
  final AnimationController controller;
  final Animation<double> scale;
  final Animation<double> translation;
  final Animation<double> rotation;

  const RadialAnimation({
    required this.controller,
    required this.scale,
    required this.translation,
    required this.rotation,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedBuilder(
          animation: controller,
          builder: (context, child) {
            return Transform.rotate(
              angle: radians(rotation.value),
              child: SizedBox.square(
                dimension: 250,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    _buildButton(
                      0,
                      color: Colors.red,
                      icon: FontAwesomeIcons.thumbtack,
                    ),
                    _buildButton(
                      45,
                      color: Colors.green,
                      icon: FontAwesomeIcons.sprayCan,
                    ),
                    _buildButton(
                      90,
                      color: Colors.orange,
                      icon: FontAwesomeIcons.fire,
                    ),
                    _buildButton(
                      135,
                      color: Colors.blue,
                      icon: FontAwesomeIcons.kiwiBird,
                    ),
                    _buildButton(
                      180,
                      color: Colors.black,
                      icon: FontAwesomeIcons.cat,
                    ),
                    _buildButton(
                      225,
                      color: Colors.indigo,
                      icon: FontAwesomeIcons.paw,
                    ),
                    _buildButton(
                      270,
                      color: Colors.pink,
                      icon: FontAwesomeIcons.bong,
                    ),
                    _buildButton(
                      315,
                      color: Colors.yellow,
                      icon: FontAwesomeIcons.bolt,
                    ),
                    Transform.scale(
                      scale: scale.value - 1.5,
                      child: FloatingActionButton(
                        onPressed: _close,
                        backgroundColor: Colors.red,
                        child: const Icon(
                          FontAwesomeIcons.circleXmark,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Transform.scale(
                      scale: scale.value,
                      child: FloatingActionButton(
                        onPressed: _open,
                        child: const Icon(
                          FontAwesomeIcons.solidCircleDot,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildButton(
    double angle, {
    required Color color,
    required IconData icon,
  }) {
    final double rad = radians(angle);
    return Transform(
      transform: Matrix4.identity()
        ..translate(
          (translation.value) * cos(rad),
          (translation.value) * sin(rad),
        ),
      child: FloatingActionButton(
        onPressed: _close,
        backgroundColor: color,
        child: Icon(icon),
      ),
    );
  }

  _open() {
    controller.forward();
  }

  _close() {
    controller.reverse();
  }
}
