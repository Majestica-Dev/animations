import 'package:animations/explicit/radial_menu/custom_radial_menu.dart';
import 'package:flutter/material.dart';

import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  path: 'Explicit',
  name: 'Radial Menu',
  type: AnimatedBuilder,
)
Widget smoothLoadingIndicator(BuildContext context) {
  return const Center(child: RadialMenu());
}
