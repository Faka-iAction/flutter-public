import 'package:flutter/widgets.dart';

import 'api/faka_api.dart';
import 'api/ids.dart';
import 'config/app_config.dart';
import 'payments/checkout_launcher.dart';
import 'qr/qr_scanner.dart';
import 'state/app_state.dart';

/// Gives screens the API, the app state, the configuration, the QR scanner
/// seam and the checkout launcher. Rebuilds dependants when [AppState]
/// changes.
class AppScope extends InheritedNotifier<AppState> {
  const AppScope({
    super.key,
    required AppState state,
    required this.config,
    required this.scanner,
    required this.ids,
    required this.checkout,
    required super.child,
  }) : super(notifier: state);

  final AppConfig config;
  final QrScanner scanner;
  final IdGenerator ids;
  final CheckoutLauncher checkout;

  static AppScope of(BuildContext context) {
    throw UnimplementedError('Not published: the implementation is private.');
  }

  AppState get state => throw UnimplementedError('Not published: the implementation is private.');
  FakaApi get api => throw UnimplementedError('Not published: the implementation is private.');
}
