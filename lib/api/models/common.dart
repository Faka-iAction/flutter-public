import '../json.dart';

/// `Money`: an integer count of minor units and an ISO 4217 code. Never a
/// floating-point number (CONVENTIONS 4).
class Money {
  const Money({required this.amountMinor, required this.currency});

  factory Money.fromJson(Json j) => throw UnimplementedError('Not published: the implementation is private.');

  final int amountMinor;
  final String currency;

  Json toJson() => throw UnimplementedError('Not published: the implementation is private.');

  @override
  bool operator ==(Object other) => throw UnimplementedError('Not published: the implementation is private.');

  @override
  int get hashCode => throw UnimplementedError('Not published: the implementation is private.');
}

Money? moneyOrNull(Json j, String key) {
    throw UnimplementedError('Not published: the implementation is private.');
  }

/// `PageInfo` (CONVENTIONS 6). The cursor is opaque: it is passed back as it
/// came and never built, changed or decoded.
class PageInfo {
  const PageInfo({required this.limit, required this.hasMore, required this.nextCursor});

  factory PageInfo.fromJson(Json j) => throw UnimplementedError('Not published: the implementation is private.');

  final int limit;
  final bool hasMore;
  final String? nextCursor;
}

/// The pagination envelope `{items, page}` shared by every collection.
class ApiPage<T> {
  const ApiPage({required this.items, required this.page});

  factory ApiPage.fromJson(Json j, T Function(Json) read) => throw UnimplementedError('Not published: the implementation is private.');

  final List<T> items;
  final PageInfo page;

  /// The cursor for the next page, or null at the end.
  String? get nextCursor => throw UnimplementedError('Not published: the implementation is private.');
}
