import 'dart:convert';

import 'json.dart';

/// One field-level problem from `Problem.errors` (CONVENTIONS 8.1).
class FieldProblem {
  const FieldProblem({required this.field, required this.code, this.detail});

  factory FieldProblem.fromJson(Json j) => throw UnimplementedError('Not published: the implementation is private.');

  final String field;
  final String code;
  final String? detail;
}

/// A failed API call. Built from the `application/problem+json` envelope when
/// the server sent one, otherwise from the HTTP status alone (a proxy can send
/// a non-JSON error body, and the client must still cope; CONVENTIONS 8.1).
///
/// Clients branch on [code] and on [FieldProblem.code], never on [title] or
/// [detail]. An unknown code is handled by its [status].
class ApiException implements Exception {
  const ApiException({
    required this.status,
    required this.code,
    required this.title,
    this.detail,
    this.correlationId,
    this.errors = const [],
    this.retryAfter,
  });

  /// HTTP status, or 0 when no response was received (see [isNetwork]).
  final int status;
  final String code;
  final String title;
  final String? detail;
  final String? correlationId;
  final List<FieldProblem> errors;

  /// From a `Retry-After` header on a 429 or 503.
  final Duration? retryAfter;

  static const networkCode = 'NETWORK_UNAVAILABLE';
  static const malformedCode = 'MALFORMED_RESPONSE';

  /// No response reached the app (offline, timeout, connection dropped). Not
  /// a contract code; the request may or may not have been processed.
  bool get isNetwork => throw UnimplementedError('Not published: the implementation is private.');

  factory ApiException.network({String? correlationId}) => throw UnimplementedError('Not published: the implementation is private.');

  factory ApiException.malformed(int status, {String? correlationId}) => throw UnimplementedError('Not published: the implementation is private.');

  /// Parses a response body. Falls back to a code derived from [status] when
  /// the body is not the envelope.
  factory ApiException.fromResponse({
    required int status,
    required String body,
    String? headerCorrelationId,
    Duration? retryAfter,
  }) {
    throw UnimplementedError('Not published: the implementation is private.');
  }

  /// The code a client assumes when only the status is known.
  static String fallbackCode(int status) => throw UnimplementedError('Not published: the implementation is private.');

  /// The field error codes for one field, for showing them next to it.
  Iterable<FieldProblem> forField(String field) => throw UnimplementedError('Not published: the implementation is private.');

  @override
  String toString() => throw UnimplementedError('Not published: the implementation is private.');
}
