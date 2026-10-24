import 'package:flutter/widgets.dart';

/// SEAM: camera QR scanning.
///
/// Camera scanning is a device addition on top of web parity (architecture
/// 25.2). No camera package is wired in yet: the maintained options need a
/// real device or emulator to exercise, and tests and analysis here must run
/// without one. Until a scanner is chosen and tested on devices, the app uses
/// [NoCameraQrScanner] and Discover offers the same typed-code entry as the
/// web. To add scanning, implement this interface (returning the raw text the
/// code encodes, or null if the person cancels) and pass it to `FakaApp`.
/// Whatever it returns is parsed with `DeepLinks.qrCodeFromTyped` and
/// resolved with `resolveQr`, never opened directly.
abstract interface class QrScanner {
  /// Whether a camera scanner is available on this build.
  bool get isAvailable;

  /// Opens the scanner and returns the scanned text, or null.
  Future<String?> scan(BuildContext context);
}

class NoCameraQrScanner implements QrScanner {
  const NoCameraQrScanner();

  @override
  bool get isAvailable => throw UnimplementedError('Not published: the implementation is private.');

  @override
  Future<String?> scan(BuildContext context) async => throw UnimplementedError('Not published: the implementation is private.');
}
