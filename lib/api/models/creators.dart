import '../json.dart';

/// `CreatorLink`.
class CreatorLink {
  const CreatorLink({required this.type, required this.label, required this.url});

  factory CreatorLink.fromJson(Json j) => throw UnimplementedError('Not published: the implementation is private.');

  /// `social` or `livestream`.
  final String type;
  final String? label;
  final String url;

  /// [url] as an http(s) address with a host, or null when it is not one. The
  /// screens show and open only these, so a malformed link from the server is
  /// left out instead of throwing while a page builds.
  Uri? get webUri {
    throw UnimplementedError('Not published: the implementation is private.');
  }
}

/// `PublicCreatorSummary` (allowlisted public projection, used in lists).
class PublicCreatorSummary {
  const PublicCreatorSummary({
    required this.id,
    required this.handle,
    required this.displayName,
    required this.imageUrl,
    required this.category,
    required this.country,
    required this.city,
    required this.languages,
    required this.verificationState,
  });

  factory PublicCreatorSummary.fromJson(Json j) => throw UnimplementedError('Not published: the implementation is private.');

  final String id;
  final String handle;
  final String displayName;
  final String? imageUrl;
  final String category;
  final String country;
  final String? city;
  final List<String> languages;

  /// `unverified` or `verified`; an unknown value is treated as `unverified`.
  final String verificationState;

  bool get isVerified => throw UnimplementedError('Not published: the implementation is private.');
}

/// `PublicCreatorProfile` (allowlisted public projection).
class PublicCreatorProfile {
  const PublicCreatorProfile({
    required this.id,
    required this.handle,
    required this.displayName,
    required this.bio,
    required this.imageUrl,
    required this.category,
    required this.country,
    required this.city,
    required this.languages,
    required this.verificationState,
    required this.links,
    required this.canonicalPath,
    required this.redirectedFrom,
  });

  factory PublicCreatorProfile.fromJson(Json j) => throw UnimplementedError('Not published: the implementation is private.');

  final String id;
  final String handle;
  final String displayName;
  final String? bio;
  final String? imageUrl;
  final String category;
  final String country;
  final String? city;
  final List<String> languages;
  final String verificationState;
  final List<CreatorLink> links;
  final String canonicalPath;

  /// Non-null when an old handle was requested; [handle] is then current and
  /// the client replaces any stored handle with it (CONVENTIONS 3).
  final String? redirectedFrom;
}

/// `CreatorProfile`: the signed-in creator's own profile.
class CreatorProfile {
  const CreatorProfile({
    required this.id,
    required this.handle,
    required this.displayName,
    required this.bio,
    required this.category,
    required this.country,
    required this.city,
    required this.languages,
    required this.verificationState,
    required this.visibility,
    required this.canonicalPath,
    this.links = const [],
  });

  factory CreatorProfile.fromJson(Json j) {
    throw UnimplementedError('Not published: the implementation is private.');
  }

  final String id;
  final String handle;
  final String displayName;
  final String? bio;
  final String category;
  final String country;
  final String? city;
  final List<String> languages;
  final String verificationState;

  /// The public links (`updateOwnCreatorProfile` replaces them as a whole).
  final List<CreatorLink> links;

  /// `public` or `suspended`; further values may be added.
  final String visibility;
  final String canonicalPath;

  bool get isPublic => throw UnimplementedError('Not published: the implementation is private.');
}

/// `FollowedCreator`.
class FollowedCreator {
  const FollowedCreator({required this.creator, required this.followedAt});

  factory FollowedCreator.fromJson(Json j) => throw UnimplementedError('Not published: the implementation is private.');

  final PublicCreatorSummary creator;
  final DateTime followedAt;
}

/// `QrDestination`.
class QrDestination {
  const QrDestination({required this.type, required this.creatorHandle, required this.actionSlug, required this.canonicalPath});

  factory QrDestination.fromJson(Json j) => throw UnimplementedError('Not published: the implementation is private.');

  /// `creator_profile` or `creator_action`; further values may be added.
  final String type;
  final String creatorHandle;
  final String? actionSlug;
  final String canonicalPath;
}

/// `QrResolution`. Any status other than `active` means "this code cannot be
/// used".
class QrResolution {
  const QrResolution({required this.qrId, required this.status, required this.destination});

  factory QrResolution.fromJson(Json j) {
    throw UnimplementedError('Not published: the implementation is private.');
  }

  final String qrId;
  final String status;
  final QrDestination? destination;

  bool get isActive => throw UnimplementedError('Not published: the implementation is private.');
  bool get isRevoked => throw UnimplementedError('Not published: the implementation is private.');
}
