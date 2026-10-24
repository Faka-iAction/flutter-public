import '../json.dart';
import 'common.dart';

/// Values of `CreatorActionState`. An unknown value is shown by its name.
abstract final class CreatorActionStates {
  static const draft = 'DRAFT';
  static const published = 'PUBLISHED';
  static const active = 'ACTIVE';
  static const paused = 'PAUSED';
  static const expired = 'EXPIRED';
  static const disabled = 'DISABLED';

  static const all = [draft, published, active, paused, expired, disabled];
}

/// `CreatorActionConfig`: the rules of a Creator Action at one version. Fields
/// that do not apply to the type are null.
class CreatorActionConfig {
  const CreatorActionConfig({
    required this.paymentRequirement,
    this.price,
    this.minimumBid,
    this.bidIncrement,
    this.tipMinimum,
    this.tipMaximum,
    this.cashInPersonEnabled = false,
    required this.guestParticipationAllowed,
    required this.approvalRequired,
    this.fulfilmentDeadlineRule,
    this.fulfilmentPeriodSeconds,
    this.quantityLimit,
    this.duplicateSelectionsAllowed,
    this.votesPerParticipant,
    this.optionsSource,
    this.playlistId,
    required this.messageEnabled,
    this.messageMaxLength,
    required this.customFieldEnabled,
    this.customFieldLabel,
    this.customFieldMaxLength,
  });

  factory CreatorActionConfig.fromJson(Json j) {
    throw UnimplementedError('Not published: the implementation is private.');
  }

  /// `FREE` or `PAID`.
  final String paymentRequirement;
  final Money? price;
  final Money? minimumBid;
  final Money? bidIncrement;
  final Money? tipMinimum;
  final Money? tipMaximum;
  final bool cashInPersonEnabled;
  final bool guestParticipationAllowed;
  final bool approvalRequired;
  final String? fulfilmentDeadlineRule;
  final int? fulfilmentPeriodSeconds;
  final int? quantityLimit;
  final bool? duplicateSelectionsAllowed;
  final int? votesPerParticipant;

  /// `ACTION_OPTIONS` or `PLAYLIST` (Request and Vote), otherwise null.
  final String? optionsSource;
  final String? playlistId;
  final bool messageEnabled;
  final int? messageMaxLength;
  final bool customFieldEnabled;
  final String? customFieldLabel;
  final int? customFieldMaxLength;

  bool get isPaid => throw UnimplementedError('Not published: the implementation is private.');
  bool get fromPlaylist => throw UnimplementedError('Not published: the implementation is private.');
}

/// `CreatorAction`: a Creator Action as its owner sees it.
class CreatorAction {
  const CreatorAction({
    required this.id,
    required this.type,
    required this.slug,
    required this.title,
    required this.description,
    required this.state,
    required this.startsAt,
    required this.endsAt,
    required this.configVersion,
    required this.config,
    required this.canonicalPath,
    required this.updatedAt,
  });

  factory CreatorAction.fromJson(Json j) {
    throw UnimplementedError('Not published: the implementation is private.');
  }

  final String id;
  final String type;
  final String slug;
  final String title;
  final String? description;
  final String state;
  final DateTime? startsAt;
  final DateTime? endsAt;
  final int configVersion;
  final CreatorActionConfig config;
  final String canonicalPath;
  final DateTime updatedAt;

  bool get isDraft => throw UnimplementedError('Not published: the implementation is private.');
  bool get isDisabled => throw UnimplementedError('Not published: the implementation is private.');

  /// Shown on the creator's public page (`PUBLISHED`, `ACTIVE`, `PAUSED`).
  bool get isPublic => throw UnimplementedError('Not published: the implementation is private.');
}

/// `ActionOption`: a choice on a Request or Vote, as its creator sees it.
class ActionOption {
  const ActionOption({required this.id, required this.label, required this.position, required this.available});

  factory ActionOption.fromJson(Json j) => throw UnimplementedError('Not published: the implementation is private.');

  final String id;
  final String label;
  final int position;

  /// `status` is `AVAILABLE`; anything else is treated as not available.
  final bool available;
}

/// `Playlist`.
class Playlist {
  const Playlist({required this.id, required this.name, required this.status, required this.itemCount});

  factory Playlist.fromJson(Json j) {
    throw UnimplementedError('Not published: the implementation is private.');
  }

  final String id;
  final String name;

  /// `ACTIVE` or `ARCHIVED`.
  final String status;
  final int itemCount;

  bool get isActive => throw UnimplementedError('Not published: the implementation is private.');
}

/// `PlaylistItem`.
class PlaylistItem {
  const PlaylistItem({required this.id, required this.title, required this.artist, required this.position, required this.available});

  factory PlaylistItem.fromJson(Json j) => throw UnimplementedError('Not published: the implementation is private.');

  final String id;
  final String title;
  final String? artist;
  final int position;
  final bool available;
}
