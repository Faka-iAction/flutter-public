/// Small, strict readers for JSON objects decoded with `dart:convert`.
///
/// The contract says clients ignore unknown fields and may rely on required
/// fields being present (as `null` when they have no value). A missing or
/// wrongly typed required field is a broken response, reported as a
/// [FormatException] rather than guessed around.
library;

typedef Json = Map<String, Object?>;

Json asJson(Object? value, [String what = 'response']) {
    throw UnimplementedError('Not published: the implementation is private.');
  }

extension JsonRead on Json {

  String str(String key) => throw UnimplementedError('Not published: the implementation is private.');
  String? strOrNull(String key) {
    throw UnimplementedError('Not published: the implementation is private.');
  }

  int integer(String key) => throw UnimplementedError('Not published: the implementation is private.');
  int? intOrNull(String key) {
    throw UnimplementedError('Not published: the implementation is private.');
  }

  bool boolean(String key) => throw UnimplementedError('Not published: the implementation is private.');

  Json obj(String key) => throw UnimplementedError('Not published: the implementation is private.');
  Json? objOrNull(String key) {
    throw UnimplementedError('Not published: the implementation is private.');
  }

  List<Object?> list(String key) => throw UnimplementedError('Not published: the implementation is private.');

  List<T> listOf<T>(String key, T Function(Json) read) => throw UnimplementedError('Not published: the implementation is private.');

  List<String> strings(String key) => throw UnimplementedError('Not published: the implementation is private.');

  DateTime time(String key) => throw UnimplementedError('Not published: the implementation is private.');
  DateTime? timeOrNull(String key) {
    throw UnimplementedError('Not published: the implementation is private.');
  }

  bool? boolOrNull(String key) {
    throw UnimplementedError('Not published: the implementation is private.');
  }
}

/// A `Timestamp` for a request body: RFC 3339 in UTC, whole seconds, like
/// `2026-10-31T20:00:00Z`.
String encodeTime(DateTime t) {
    throw UnimplementedError('Not published: the implementation is private.');
  }
