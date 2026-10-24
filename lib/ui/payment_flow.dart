/// What the participant screens share when money is involved: opening the
/// provider's checkout page and wording a refusal. Presentation only: what is
/// charged, and whether it was paid, is always the server's answer.
library;

import '../api/faka_api.dart';
import '../app_scope.dart';
import 'widgets.dart';

abstract final class PaymentFlow {
  /// Opens the provider's page for [p] in a browser tab. A checkout type the
  /// app does not know opens the Action's web page instead, as the contract
  /// says. False when nothing opened. Opening proves nothing about the
  /// payment.
  static Future<bool> openCheckout(AppScope scope, Payment p) async {
    throw UnimplementedError('Not published: the implementation is private.');
  }

  /// The first online method in [methods] (server-decided), preferring
  /// [preferred] when the server still offers it.
  static String? onlineMethod(List<PaymentMethodOption> methods, {String? preferred}) {
    throw UnimplementedError('Not published: the implementation is private.');
  }

  static bool offersCash(List<PaymentMethodOption> methods) => throw UnimplementedError('Not published: the implementation is private.');

  static const notOpened = 'The secure payment page did not open. Use "Continue to secure payment" below.';
  static const unavailable = 'Paying on FAKA iAction is not available right now. Nothing was charged. Please come back later.';

  /// A refused payment step, in the web's words. Nothing in these cases was
  /// charged.
  static String failure(ApiException e) => throw UnimplementedError('Not published: the implementation is private.');
}
