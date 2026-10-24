import 'package:flutter/material.dart';

import 'ref_icons.dart';

/// The FAKA iAction design system (ui repository: ui-spec.md section 3), the
/// same tokens as the web. Colours are chosen for contrast: body text and
/// buttons meet WCAG AA (4.5:1) on their backgrounds in both themes. Sizes
/// come from the platform, so the person's text-size setting is respected.
@immutable
class FakaColors extends ThemeExtension<FakaColors> {
  const FakaColors({
    required this.muted,
    required this.line,
    required this.card,
    required this.tint,
    required this.ground,
    required this.errBg,
    required this.ok,
    required this.okBg,
    required this.warn,
    required this.warnBg,
    required this.neu,
    required this.neuBg,
    this.brand = const Color(0xFFE6F802),
    this.onBrand = const Color(0xFF14171A),
  });

  /// The brand lime (onboarding/design.md): fills only, never text on white.
  final Color brand;

  /// Ink on lime: text and icons on [brand].
  final Color onBrand;

  /// Secondary text and labels.
  final Color muted;

  /// Hairlines and field borders.
  final Color line;

  /// Cards, tiles and panels.
  final Color card;

  /// Soft primary background: avatars, banners, notices, the current tab.
  final Color tint;

  /// The page around the app on a wide screen.
  final Color ground;
  final Color errBg;
  final Color ok;
  final Color okBg;
  final Color warn;
  final Color warnBg;
  final Color neu;
  final Color neuBg;

  static const light = FakaColors(
    muted: Color(0xFF5A646E),
    line: Color(0xFFE3E8ED),
    card: Color(0xFFF3F6F9),
    tint: Color(0xFFF9FDC0),
    ground: Color(0xFFEDF0F3),
    errBg: Color(0xFFFBEAE8),
    ok: Color(0xFF1B6B3A),
    okBg: Color(0xFFE1F2E6),
    warn: Color(0xFF7A5200),
    warnBg: Color(0xFFFFEFCC),
    neu: Color(0xFF47515B),
    neuBg: Color(0xFFE9ECEF),
  );

  static const dark = FakaColors(
    muted: Color(0xFFA3ACB5),
    line: Color(0xFF23282D),
    card: Color(0xFF1A1D21),
    tint: Color(0xFF2A2F06),
    ground: Color(0xFF0A0B0C),
    errBg: Color(0xFF3A1D1A),
    ok: Color(0xFF8FD6A3),
    okBg: Color(0xFF183222),
    warn: Color(0xFFF0C36A),
    warnBg: Color(0xFF382B0D),
    neu: Color(0xFFB2BAC2),
    neuBg: Color(0xFF262B30),
  );

  static FakaColors of(BuildContext context) => throw UnimplementedError('Not published: the implementation is private.');

  @override
  FakaColors copyWith({
    Color? muted,
    Color? line,
    Color? card,
    Color? tint,
    Color? ground,
    Color? errBg,
    Color? ok,
    Color? okBg,
    Color? warn,
    Color? warnBg,
    Color? neu,
    Color? neuBg,
  }) => throw UnimplementedError('Not published: the implementation is private.');

  @override
  FakaColors lerp(FakaColors? other, double t) {
    throw UnimplementedError('Not published: the implementation is private.');
  }
}

abstract final class FakaTheme {
  /// The widest the content column grows (ui-spec 3.5).
  static const maxContentWidth = 640.0;

  /// Body text (ui-spec 3.2), bundled in assets/fonts.
  static const bodyFont = 'Figtree';

  /// Page titles and the top bar (ui-spec 3.2), bundled in assets/fonts.
  static const displayFont = 'BricolageGrotesque';

  static ThemeData light() => throw UnimplementedError('Not published: the implementation is private.');

  static ThemeData dark() => throw UnimplementedError('Not published: the implementation is private.');
}
