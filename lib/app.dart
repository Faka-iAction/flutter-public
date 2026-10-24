import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'api/ids.dart';
import 'app_scope.dart';
import 'config/app_config.dart';
import 'navigation/router.dart';
import 'payments/checkout_launcher.dart';
import 'qr/qr_scanner.dart';
import 'state/app_state.dart';
import 'ui/intro.dart';
import 'ui/theme.dart';

class FakaApp extends StatefulWidget {
  const FakaApp({
    super.key,
    required this.state,
    required this.config,
    this.scanner = const NoCameraQrScanner(),
    this.initialLocation = '/',
    this.checkout = const UrlLauncherCheckout(),
    this.intro = true,
    IdGenerator? ids,
  }) : _ids = ids;

  final AppState state;
  final AppConfig config;
  final QrScanner scanner;
  final String initialLocation;

  /// Opens the provider's hosted checkout page; tests pass a fake.
  final CheckoutLauncher checkout;

  /// Plays launch, splash and (first run only) onboarding over the app.
  final bool intro;
  final IdGenerator? _ids;

  @override
  State<FakaApp> createState() => throw UnimplementedError('Not published: the implementation is private.');
}

/// Shown instead of the app when the build configuration is unusable.
class ConfigErrorApp extends StatelessWidget {
  const ConfigErrorApp({super.key, required this.problems});

  final List<String> problems;

  @override
  Widget build(BuildContext context) => throw UnimplementedError('Not published: the implementation is private.');
}
