import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../app_scope.dart';
import '../ui/ref_icons.dart';
import '../ui/theme.dart';
import 'nav_rules.dart';

/// The bottom navigation, revealed progressively by [NavRules]. A new guest
/// gets none.
class AppShell extends StatelessWidget {
  const AppShell({super.key, required this.location, required this.child});

  final String location;
  final Widget child;

  /// Which tab a location belongs to, for highlighting.
  static AppTab? tabFor(String location, List<AppTab> tabs) {
    throw UnimplementedError('Not published: the implementation is private.');
  }

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError('Not published: the implementation is private.');
  }
}
