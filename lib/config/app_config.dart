/// Build-time configuration, one set per build flavour.
///
/// Values come from `--dart-define-from-file=config/<flavour>.json` (or single
/// `--dart-define` values). Nothing here is a secret: the API base URL and the
/// web origin are public. No real host name is committed: `local` points at a
/// developer machine and every other flavour uses a placeholder under the
/// reserved `.invalid` top-level domain until the product owner supplies the
/// real one at build time.
class AppConfig {
  const AppConfig({
    required this.flavour,
    required this.apiBaseUrl,
    required this.webOrigin,
    this.extraLinkHosts = const [],
  });

  /// `local`, `staging` or `production`.
  final String flavour;

  /// Base of the API including the version path, for example
  /// `http://localhost:8000/api/v1`. Every operation path is appended to it.
  final Uri apiBaseUrl;

  /// The public web origin that serves `/@handle`, `/q/{id}` and `/a/{id}`.
  /// Used to build share links and to allowlist incoming app links.
  final Uri webOrigin;

  /// Further hosts whose https links the app accepts (for example a redirect
  /// domain). The web origin's host is always accepted.
  final List<String> extraLinkHosts;

  static const String localApiBaseUrl = 'http://localhost:8000/api/v1';
  static const String localWebOrigin = 'http://localhost:8000';
  static const String placeholderApiBaseUrl = 'https://api.example.invalid/api/v1';
  static const String placeholderWebOrigin = 'https://example.invalid';

  /// Reads the compile-time environment. With no defines at all this is the
  /// `local` flavour.
  factory AppConfig.fromEnvironment() {
    throw UnimplementedError('Not published: the implementation is private.');
  }

  /// Hosts whose links the app opens in-app.
  Set<String> get linkHosts => throw UnimplementedError('Not published: the implementation is private.');

  /// Problems that make this configuration unusable. Empty when it is fine.
  List<String> problems() {
    throw UnimplementedError('Not published: the implementation is private.');
  }

  /// Absolute web link for a path such as `/@djthandi`.
  Uri webLink(String path) => throw UnimplementedError('Not published: the implementation is private.');
}
