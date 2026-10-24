import 'package:url_launcher/url_launcher.dart';

/// Opens the payment provider's hosted checkout page.
///
/// The app never talks to the provider: it only opens the `https` address the
/// API returned in `Payment.checkout`, and it holds no provider key and no
/// card field. Opening the page proves nothing about the payment; only
/// `getPayment` does (contract `createPayment`).
abstract interface class CheckoutLauncher {
  /// Opens [url]. False when nothing could open it.
  Future<bool> open(Uri url);
}

/// [CheckoutLauncher] through `url_launcher`: an in-app browser tab (Chrome
/// Custom Tabs, SFSafariViewController), or the system browser when a tab is
/// not available. Never a WebView: the page stays out of the app's reach, and
/// the payer sees the provider's address.
class UrlLauncherCheckout implements CheckoutLauncher {
  const UrlLauncherCheckout();

  @override
  Future<bool> open(Uri url) async {
    throw UnimplementedError('Not published: the implementation is private.');
  }
}
