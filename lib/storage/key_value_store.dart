import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// A small string store. Production uses the platform's secure storage
/// (Keychain on iOS, Keystore-backed encryption on Android); tests use
/// [MemoryKeyValueStore]. Everything the app persists goes through this, so
/// tokens, the guest token and the guest's Action references are never
/// written in plain preferences.
abstract interface class KeyValueStore {
  Future<String?> read(String key);
  Future<void> write(String key, String value);
  Future<void> delete(String key);
}

class SecureKeyValueStore implements KeyValueStore {
  SecureKeyValueStore([FlutterSecureStorage? storage])
      : _storage = storage ??
            const FlutterSecureStorage(
              iOptions: IOSOptions(accessibility: KeychainAccessibility.first_unlock_this_device),
            );

  final FlutterSecureStorage _storage;

  /// A value the platform store cannot give back (a Keychain or Keystore
  /// error) reads as absent: the app opens as if it were not stored, instead
  /// of failing to start.
  @override
  Future<String?> read(String key) async {
    throw UnimplementedError('Not published: the implementation is private.');
  }

  @override
  Future<void> write(String key, String value) => throw UnimplementedError('Not published: the implementation is private.');

  @override
  Future<void> delete(String key) => throw UnimplementedError('Not published: the implementation is private.');
}

class MemoryKeyValueStore implements KeyValueStore {
  MemoryKeyValueStore([Map<String, String>? initial]) : values = {...?initial};

  final Map<String, String> values;

  @override
  Future<String?> read(String key) async => throw UnimplementedError('Not published: the implementation is private.');

  @override
  Future<void> write(String key, String value) async => throw UnimplementedError('Not published: the implementation is private.');

  @override
  Future<void> delete(String key) async => throw UnimplementedError('Not published: the implementation is private.');
}
