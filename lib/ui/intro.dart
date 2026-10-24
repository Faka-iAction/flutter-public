import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'ref_icons.dart';
import 'theme.dart';

/// Launch, splash and onboarding (ui repository, onboarding/design.md and
/// screens 01 to 05): a full-screen layer above the app, which is inert while
/// it shows. Launch and splash run on every cold start; the three onboarding
/// slides only until the person has finished or skipped them once.
///
/// The layer is deliberately light: fixed lime and ink, whatever the theme.
class IntroLayer extends StatefulWidget {
  const IntroLayer({
    super.key,
    required this.child,
    required this.showOnboarding,
    required this.onFinished,
    this.launchFor = const Duration(milliseconds: 900),
    this.splashUntil = const Duration(milliseconds: 3300),
  });

  /// The app behind the layer.
  final Widget child;

  /// Whether the onboarding slides follow the splash (first run only).
  final bool showOnboarding;

  /// Called once when the layer closes. [signIn] is true for "I already have
  /// an account"; [onboarded] when the slides were seen to the end or skipped.
  final void Function({required bool signIn, required bool onboarded}) onFinished;

  final Duration launchFor;
  final Duration splashUntil;

  static const lime = Color(0xFFE6F802);
  static const ink = Color(0xFF14171A);
  static const limeTint = Color(0xFFF9FDC0);
  static const muted = Color(0xFF5A646E);
  static const line = Color(0xFFE3E8ED);
  static const dot = Color(0xFFD5DAA0);

  /// The logo's aspect ratio (1379:1545): always size by height.
  static const logoAspect = 1379 / 1545;

  @override
  State<IntroLayer> createState() => throw UnimplementedError('Not published: the implementation is private.');
}
