// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_import, prefer_relative_imports, directives_ordering

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AppGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:animations/explicit/animated_radianing_icon.dart/animated_radianing_icon.dart'
    as _i2;
import 'package:animations/explicit/radial_menu/radial_menu.dart' as _i3;
import 'package:animations/explicit/rotating_box/rotating_box.dart' as _i4;
import 'package:animations/explicit/snow_effect/snow_effect.dart' as _i5;
import 'package:animations/implicit/animated_align/animated_align.dart' as _i6;
import 'package:animations/implicit/animated_text/animated_text.dart' as _i7;
import 'package:animations/implicit/like_button.dart/like_button.dart' as _i8;
import 'package:animations/implicit/smooth_loading_indicator/smooth_loading_indicator.dart'
    as _i9;
import 'package:animations/staggered/home_page_animated.dart' as _i10;
import 'package:animations/tweens/tween_animation_demo.dart' as _i11;
import 'package:widgetbook/widgetbook.dart' as _i1;

final directories = <_i1.WidgetbookNode>[
  _i1.WidgetbookFolder(
    name: 'Explicit',
    children: [
      _i1.WidgetbookComponent(
        name: 'AnimatedBuilder',
        useCases: [
          _i1.WidgetbookUseCase(
            name: 'Animated Radianing Icon',
            builder: _i2.animatedAlignState,
          ),
          _i1.WidgetbookUseCase(
            name: 'Radial Menu',
            builder: _i3.smoothLoadingIndicator,
          ),
          _i1.WidgetbookUseCase(
            name: 'Rotating Box',
            builder: _i4.smoothLoadingIndicator,
          ),
          _i1.WidgetbookUseCase(
            name: 'Snow Effect',
            builder: _i5.smoothLoadingIndicator,
          ),
        ],
      )
    ],
  ),
  _i1.WidgetbookFolder(
    name: 'Implicit',
    children: [
      _i1.WidgetbookLeafComponent(
        name: 'AnimatedAlign',
        useCase: _i1.WidgetbookUseCase(
          name: 'Animated Align',
          builder: _i6.animatedAlignState,
        ),
      ),
      _i1.WidgetbookLeafComponent(
        name: 'AnimatedText',
        useCase: _i1.WidgetbookUseCase(
          name: 'Animated Text',
          builder: _i7.animatedAlignState,
        ),
      ),
      _i1.WidgetbookComponent(
        name: 'ImplicitlyAnimatedWidget',
        useCases: [
          _i1.WidgetbookUseCase(
            name: 'Like Button',
            builder: _i8.likeButton,
          ),
          _i1.WidgetbookUseCase(
            name: 'Loading Indicator',
            builder: _i9.smoothLoadingIndicator,
          ),
        ],
      ),
    ],
  ),
  _i1.WidgetbookFolder(
    name: 'Staggered',
    children: [
      _i1.WidgetbookLeafComponent(
        name: 'AnimatedBuilder',
        useCase: _i1.WidgetbookUseCase(
          name: 'Home Page Animated',
          builder: _i10.smoothLoadingIndicator,
        ),
      )
    ],
  ),
  _i1.WidgetbookFolder(
    name: 'Tweens',
    children: [
      _i1.WidgetbookLeafComponent(
        name: 'TweenAnimationBuilder',
        useCase: _i1.WidgetbookUseCase(
          name: 'Tween Animation Demo',
          builder: _i11.tweenAnimationDemoExample,
        ),
      )
    ],
  ),
];
