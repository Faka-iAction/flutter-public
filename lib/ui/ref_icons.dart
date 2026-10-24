import 'package:flutter/material.dart';

/// The reference's icon set (ui-spec 3.4 Icons): 24×24, stroke 2, round caps
/// and joins, drawn from the same paths as `private/ui/reference`. Only the
/// path commands those icons use are read: M L H V (and lower case) and Z,
/// plus circles.
enum RefIcons {
  search(['M16 16l4.5 4.5'], [(11, 11, 6.5)]),
  qr(['M4 4h6v6H4z', 'M14 4h6v6h-6z', 'M4 14h6v6H4z', 'M14 14h2v2h-2z', 'M18 14h2', 'M14 18v2', 'M18 18h2v2'], []),
  filter(['M4 7h10', 'M18 7h2', 'M4 17h2', 'M10 17h10'], [(16, 7, 2), (8, 17, 2)]),
  chevronRight(['M9 5l7 7-7 7'], []),
  chevronDown(['M6 9l6 6 6-6'], []),
  invite(['M3 20c.6-3.4 3-5 6-5s5.4 1.6 6 5', 'M18 8v6', 'M15 11h6'], [(9, 8, 3.5)]),
  group(['M12 4l8 4-8 4-8-4z', 'M4 12l8 4 8-4', 'M4 16l8 4 8-4'], []),
  back(['M15 5l-7 7 7 7'], []),
  info(['M12 11v6', 'M12 7.5h.01'], [(12, 12, 9)]),
  plus(['M12 5v14', 'M5 12h14'], []),
  target([], [(12, 12, 8), (12, 12, 3)]),
  activity(['M12 7.5V12l3 2'], [(12, 12, 8.5)]),
  following(['M12 20s-7-4.4-7-10a4 4 0 0 1 7-2.4A4 4 0 0 1 19 10c0 5.6-7 10-7 10z'], []),
  profile(['M5 20c.8-3.6 3.5-5.5 7-5.5s6.2 1.9 7 5.5'], [(12, 8.5, 3.5)]),
  home(['M4 11l8-6.5 8 6.5V20H4z'], []),
  list(['M9 6h11', 'M9 12h11', 'M9 18h11', 'M4.5 6h.01', 'M4.5 12h.01', 'M4.5 18h.01'], []),
  more(['M5 12h.01', 'M12 12h.01', 'M19 12h.01'], []),
  bell(['M6 17v-6a6 6 0 0 1 12 0v6l1.5 2h-15z', 'M10 21h4'], []),
  share(['M8.2 10.8l7.6-3.6', 'M8.2 13.2l7.6 3.6'], [(6, 12, 2.5), (18, 6, 2.5), (18, 18, 2.5)]),
  flag(['M5 21V4', 'M5 4h11l-2 4 2 4H5'], []),
  copy(['M9 9h10v10H9z', 'M5 15V5h10'], []),
  // The onboarding illustrations (onboarding/reference-prototype.html).
  note(['M9 18V6l10-2v12'], [(6.5, 18, 2.5), (16.5, 16, 2.5)]),
  check(['M5 12.5l4.5 4.5L19 7.5'], []),
  message(['M4 5h16v11H9l-5 4z'], []);

  const RefIcons(this.paths, this.circles);

  final List<String> paths;
  final List<(double, double, double)> circles;
}

/// One reference icon in the current icon colour.
class RefIcon extends StatelessWidget {
  const RefIcon(this.icon, {super.key, this.size = 24, this.color, this.semanticLabel});

  final RefIcons icon;
  final double size;
  final Color? color;
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError('Not published: the implementation is private.');
  }
}
