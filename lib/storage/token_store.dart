import 'dart:convert';

import '../api/json.dart';
import '../api/models/identity.dart';
import 'key_value_store.dart';

/// The member's API session as stored on the device.
class StoredTokens {
  const StoredTokens({
    required this.accessToken,
    required this.accessExpiresAt,
    required this.refreshToken,
    required this.refreshExpiresAt,
  });

  /// Lifetimes are the server's (`expiresIn`, `refreshExpiresIn`), counted
  /// from [receivedAt]; they are never hard-coded (CONVENTIONS 12.1).
  factory StoredTokens.fromPair(TokenPair pair, DateTime receivedAt) => throw UnimplementedError('Not published: the implementation is private.');

  final String accessToken;
  final DateTime accessExpiresAt;
  final String refreshToken;
  final DateTime refreshExpiresAt;

  /// True a little before the real expiry, so a request is not sent with a
  /// token that dies in flight.
  bool accessExpired(DateTime now) => throw UnimplementedError('Not published: the implementation is private.');
  bool refreshExpired(DateTime now) => throw UnimplementedError('Not published: the implementation is private.');

  Json toJson() => throw UnimplementedError('Not published: the implementation is private.');

  static StoredTokens? tryParse(String? raw) {
    throw UnimplementedError('Not published: the implementation is private.');
  }
}

/// Keeps the member's tokens in secure storage. In memory a copy is cached so
/// that every request does not hit the keystore.
class TokenStore {
  TokenStore(this._store);

  static const _key = 'faka.member.tokens';

  final KeyValueStore _store;
  StoredTokens? _cached;
  bool _loaded = false;

  Future<StoredTokens?> read() async {
    throw UnimplementedError('Not published: the implementation is private.');
  }

  Future<void> save(StoredTokens tokens) async {
    throw UnimplementedError('Not published: the implementation is private.');
  }

  Future<void> clear() async {
    throw UnimplementedError('Not published: the implementation is private.');
  }
}
