import '../json.dart';

/// `SignInIdentifier`: an email address or a phone number in E.164.
class SignInIdentifier {
  const SignInIdentifier.email(this.value) : type = 'email';
  const SignInIdentifier.phone(this.value) : type = 'phone';

  final String type;
  final String value;

  bool get isEmail => throw UnimplementedError('Not published: the implementation is private.');

  Json toJson() => throw UnimplementedError('Not published: the implementation is private.');
}

/// `VerificationChallenge`: returned when a one-time code was requested. It
/// says nothing about whether the identifier is registered.
class VerificationChallenge {
  const VerificationChallenge({required this.verificationId, required this.expiresIn, required this.resendAfter});

  factory VerificationChallenge.fromJson(Json j) => throw UnimplementedError('Not published: the implementation is private.');

  final String verificationId;
  final int expiresIn;
  final int resendAfter;
}

/// `TokenPair`. Both tokens are opaque; lifetimes come from the server.
class TokenPair {
  const TokenPair({
    required this.accessToken,
    required this.expiresIn,
    required this.refreshToken,
    required this.refreshExpiresIn,
  });

  factory TokenPair.fromJson(Json j) {
    throw UnimplementedError('Not published: the implementation is private.');
  }

  final String accessToken;
  final int expiresIn;
  final String refreshToken;
  final int refreshExpiresIn;
}

/// `Member`: the signed-in member's own private record.
class Member {
  const Member({
    required this.id,
    required this.displayName,
    required this.country,
    required this.locale,
    required this.hasPassword,
  });

  factory Member.fromJson(Json j) => throw UnimplementedError('Not published: the implementation is private.');

  final String id;
  final String? displayName;
  final String? country;
  final String? locale;
  final bool hasPassword;
}

/// `SignInResult`.
class SignInResult {
  const SignInResult({required this.tokens, required this.member, required this.memberCreated});

  factory SignInResult.fromJson(Json j) => throw UnimplementedError('Not published: the implementation is private.');

  final TokenPair tokens;
  final Member member;
  final bool memberCreated;
}

/// `MemberCapabilities`. The list is open; unknown codes are ignored.
class MemberCapabilities {
  const MemberCapabilities(this.codes);

  factory MemberCapabilities.fromJson(Json j) => throw UnimplementedError('Not published: the implementation is private.');

  final Set<String> codes;

  bool get isCreator => throw UnimplementedError('Not published: the implementation is private.');
}

/// `MemberIdentifier`: one verified way a member signs in.
class MemberIdentifier {
  const MemberIdentifier({required this.id, required this.type, required this.provider, required this.value});

  factory MemberIdentifier.fromJson(Json j) => throw UnimplementedError('Not published: the implementation is private.');

  final String id;

  /// `email`, `phone` or `social`.
  final String type;

  /// `google` or `apple` for a social identity, otherwise null.
  final String? provider;
  final String? value;
}
