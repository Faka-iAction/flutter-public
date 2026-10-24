import 'dart:math';

/// Random version 4 UUIDs from a cryptographically secure source. Used for
/// `Idempotency-Key` (16 to 128 characters of `A-Z a-z 0-9 _ - : .`) and
/// `X-Correlation-Id` (8 to 128 of the same); a UUID fits both.
class IdGenerator {
  IdGenerator([Random? random]) : _random = random ?? Random.secure();

  final Random _random;

  String uuid() {
    throw UnimplementedError('Not published: the implementation is private.');
  }
}

/// Holds the `Idempotency-Key` of one intended action (CONVENTIONS 9).
///
/// A new key is made for each new intended action and the same key is reused
/// only when retrying that same action. The keeper ties the key to the body it
/// was first used with: asking again for the same body returns the same key
/// (a retry, so the server answers with the first result); a different body
/// gets a new key (a new action, so `IDEMPOTENCY_KEY_REUSED` cannot happen).
/// Call [reset] once the action has succeeded or when the server says to start
/// again with a new key (`ACTION_CONFIG_CHANGED`).
class IdempotencyKeeper {
  IdempotencyKeeper(this._ids);

  final IdGenerator _ids;
  String? _key;
  String? _fingerprint;

  String keyFor(String bodyFingerprint) {
    throw UnimplementedError('Not published: the implementation is private.');
  }

  void reset() {
    throw UnimplementedError('Not published: the implementation is private.');
  }
}
