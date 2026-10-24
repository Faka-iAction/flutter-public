import 'dart:convert';

import '../api/json.dart';
import 'key_value_store.dart';

/// The guest session of this device (CONVENTIONS 12.6).
///
/// The token is the guest's secret: it is shown once by `createGuestSession`,
/// sent only in the `X-Guest-Token` header, never put in a URL or a log, and
/// cannot be recovered if lost. The guest's Actions can only be read back by
/// `id`, so the ids are kept here too, newest first: they are what the guest's
/// Activity shows, as the web keeps them in the browser.
class GuestStore {
  GuestStore(this._store);

  static const _tokenKey = 'faka.guest.session';
  static const _actionsKey = 'faka.guest.actions';

  /// The app keeps at most this many guest Action references.
  static const maxActions = 100;

  final KeyValueStore _store;

  Future<GuestCredentials?> credentials() async {
    throw UnimplementedError('Not published: the implementation is private.');
  }

  Future<void> saveCredentials(GuestCredentials c) => throw UnimplementedError('Not published: the implementation is private.');

  Future<void> clearCredentials() => throw UnimplementedError('Not published: the implementation is private.');

  Future<List<String>> actionIds() async {
    throw UnimplementedError('Not published: the implementation is private.');
  }

  Future<void> addActionId(String id) async {
    throw UnimplementedError('Not published: the implementation is private.');
  }

  Future<void> clearActions() => throw UnimplementedError('Not published: the implementation is private.');
}

class GuestCredentials {
  const GuestCredentials({required this.token, required this.expiresAt});
  final String token;
  final DateTime expiresAt;

  bool expired(DateTime now) => throw UnimplementedError('Not published: the implementation is private.');
}
