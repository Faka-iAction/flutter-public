import '../json.dart';
import 'common.dart';

/// Values of `ActionType`. Further types may be added; a client that does not
/// know a type sends the participant to the Action's web page.
abstract final class ActionTypes {
  static const request = 'REQUEST';
  static const vote = 'VOTE';
  static const bid = 'BID';
  static const shoutOut = 'SHOUT_OUT';
  static const tip = 'TIP';
}

/// Values of `ActionState` (participant Action). An unknown value is "in
/// progress".
abstract final class ActionStates {
  static const created = 'CREATED';
  static const initiated = 'INITIATED';
  static const submitted = 'SUBMITTED';
  static const accepted = 'ACCEPTED';
  static const fulfilled = 'FULFILLED';
  static const completed = 'COMPLETED';
  static const rejected = 'REJECTED';
  static const cancelled = 'CANCELLED';
  static const expired = 'EXPIRED';
  static const failed = 'FAILED';
}

/// `PaymentMethodOption`.
class PaymentMethodOption {
  const PaymentMethodOption({required this.code, required this.kind, required this.displayName});

  factory PaymentMethodOption.fromJson(Json j) => throw UnimplementedError('Not published: the implementation is private.');

  final String code;
  final String kind;
  final String displayName;
}

/// `FulfilmentDeadlineInfo`.
class FulfilmentDeadlineInfo {
  const FulfilmentDeadlineInfo({required this.rule, required this.periodSeconds});

  factory FulfilmentDeadlineInfo.fromJson(Json j) => throw UnimplementedError('Not published: the implementation is private.');

  /// `AT_ACTION_END`, `AT_SESSION_END` or `FIXED_PERIOD_AFTER_PAYMENT`.
  final String rule;
  final int? periodSeconds;
}

/// `BidRankingSummary`.
class BidRankingSummary {
  const BidRankingSummary({required this.rankedBidCount, required this.topBidTotal});

  factory BidRankingSummary.fromJson(Json j) => throw UnimplementedError('Not published: the implementation is private.');

  final int rankedBidCount;
  final Money? topBidTotal;
}

/// `PublicCreatorAction` (allowlisted public projection).
class PublicCreatorAction {
  const PublicCreatorAction({
    required this.id,
    required this.type,
    required this.slug,
    required this.title,
    required this.description,
    required this.state,
    required this.openForParticipation,
    required this.startsAt,
    required this.endsAt,
    required this.creatorHandle,
    required this.canonicalPath,
    required this.configVersion,
    required this.paymentRequirement,
    required this.price,
    required this.minimumBid,
    required this.bidIncrement,
    required this.tipMinimum,
    required this.tipMaximum,
    required this.tipSuggestedAmounts,
    required this.guestParticipationAllowed,
    required this.approvalRequired,
    required this.acceptedPaymentMethods,
    required this.fulfilmentDeadline,
    required this.hasOptions,
    required this.votesPerParticipant,
    required this.messageEnabled,
    required this.messageMaxLength,
    required this.customFieldEnabled,
    required this.customFieldLabel,
    required this.customFieldMaxLength,
    required this.bidRanking,
  });

  factory PublicCreatorAction.fromJson(Json j) {
    throw UnimplementedError('Not published: the implementation is private.');
  }

  final String id;
  final String type;
  final String slug;
  final String title;
  final String? description;

  /// `PUBLISHED`, `ACTIVE` or `PAUSED`.
  final String state;
  final bool openForParticipation;
  final DateTime? startsAt;
  final DateTime? endsAt;
  final String creatorHandle;
  final String canonicalPath;
  final int configVersion;

  /// `FREE` or `PAID`.
  final String paymentRequirement;
  final Money? price;
  final Money? minimumBid;
  final Money? bidIncrement;
  final Money? tipMinimum;
  final Money? tipMaximum;
  final List<Money> tipSuggestedAmounts;
  final bool guestParticipationAllowed;
  final bool approvalRequired;
  final List<PaymentMethodOption> acceptedPaymentMethods;
  final FulfilmentDeadlineInfo? fulfilmentDeadline;
  final bool hasOptions;
  final int? votesPerParticipant;
  final bool messageEnabled;
  final int? messageMaxLength;
  final bool customFieldEnabled;
  final String? customFieldLabel;
  final int? customFieldMaxLength;
  final BidRankingSummary? bidRanking;

  bool get isPaid => throw UnimplementedError('Not published: the implementation is private.');
}

/// `PublicActionOption`.
class PublicActionOption {
  const PublicActionOption({required this.id, required this.label, required this.secondaryLabel, required this.available});

  factory PublicActionOption.fromJson(Json j) => throw UnimplementedError('Not published: the implementation is private.');

  final String id;
  final String label;
  final String? secondaryLabel;
  final bool available;
}

/// `GuestSessionCreated`, flattened.
class GuestSessionCreated {
  const GuestSessionCreated({required this.sessionId, required this.expiresAt, required this.guestToken});

  factory GuestSessionCreated.fromJson(Json j) {
    throw UnimplementedError('Not published: the implementation is private.');
  }

  final String sessionId;
  final DateTime expiresAt;
  final String guestToken;
}

/// `ActionCreatorActionSummary`.
class ActionCreatorActionSummary {
  const ActionCreatorActionSummary({
    required this.id,
    required this.type,
    required this.slug,
    required this.title,
    required this.creatorHandle,
    required this.creatorDisplayName,
  });

  factory ActionCreatorActionSummary.fromJson(Json j) => throw UnimplementedError('Not published: the implementation is private.');

  final String id;
  final String type;
  final String slug;
  final String title;
  final String creatorHandle;
  final String creatorDisplayName;
}

/// `ActionSelection`.
class ActionSelection {
  const ActionSelection({required this.optionId, required this.label, required this.secondaryLabel});

  factory ActionSelection.fromJson(Json j) => throw UnimplementedError('Not published: the implementation is private.');

  final String optionId;
  final String label;
  final String? secondaryLabel;
}

/// `ActionMessage`.
class ActionMessage {
  const ActionMessage({required this.body, required this.moderationStatus});

  factory ActionMessage.fromJson(Json j) => throw UnimplementedError('Not published: the implementation is private.');

  final String body;

  /// `PENDING`, `APPROVED` or `REJECTED`; further values may be added.
  final String moderationStatus;
}

/// `BidStatus`.
class BidStatus {
  const BidStatus({required this.total, required this.rank, required this.rankedBidCount, required this.raiseCount});

  factory BidStatus.fromJson(Json j) => throw UnimplementedError('Not published: the implementation is private.');

  final Money total;
  final int? rank;
  final int rankedBidCount;
  final int raiseCount;
}

/// `RefundSummary`.
class RefundSummary {
  const RefundSummary({required this.status, required this.reason, required this.amount, required this.requestedAt, required this.succeededAt});

  factory RefundSummary.fromJson(Json j) => throw UnimplementedError('Not published: the implementation is private.');

  final String status;
  final String reason;
  final Money amount;
  final DateTime requestedAt;
  final DateTime? succeededAt;
}

/// `PaymentSummary`.
class PaymentSummary {
  const PaymentSummary({required this.id, required this.purpose, required this.amount, required this.method, required this.state, required this.refund});

  factory PaymentSummary.fromJson(Json j) {
    throw UnimplementedError('Not published: the implementation is private.');
  }

  final String id;
  final String purpose;
  final Money amount;
  final String method;
  final String state;
  final RefundSummary? refund;
}

/// `CashReceiptSummary`.
class CashReceiptSummary {
  const CashReceiptSummary({required this.id, required this.state, required this.amount, required this.reportedAt, required this.confirmedAt, required this.voidedAt});

  factory CashReceiptSummary.fromJson(Json j) => throw UnimplementedError('Not published: the implementation is private.');

  final String id;
  final String state;
  final Money amount;
  final DateTime reportedAt;
  final DateTime? confirmedAt;
  final DateTime? voidedAt;
}

/// `ParticipantAction`: an Action as the participant who made it sees it.
class ParticipantAction {
  const ParticipantAction({
    required this.id,
    required this.type,
    required this.state,
    required this.creatorAction,
    required this.configVersion,
    required this.paymentRequirement,
    required this.amount,
    required this.paymentMethod,
    required this.selection,
    required this.note,
    required this.message,
    required this.customFieldValue,
    required this.bid,
    required this.payments,
    required this.cashReceipt,
    required this.fulfilmentDeadlineAt,
    required this.canCancel,
    required this.canRaise,
    required this.closeReason,
    this.rejectionReason,
    required this.createdAt,
    required this.submittedAt,
    required this.acceptedAt,
    required this.fulfilledAt,
    required this.closedAt,
    required this.updatedAt,
  });

  factory ParticipantAction.fromJson(Json j) {
    throw UnimplementedError('Not published: the implementation is private.');
  }

  final String id;
  final String type;
  final String state;
  final ActionCreatorActionSummary creatorAction;
  final int configVersion;
  final String paymentRequirement;
  final Money? amount;
  final String? paymentMethod;
  final ActionSelection? selection;
  final String? note;
  final ActionMessage? message;
  final String? customFieldValue;
  final BidStatus? bid;
  final List<PaymentSummary> payments;
  final CashReceiptSummary? cashReceipt;
  final DateTime? fulfilmentDeadlineAt;
  final bool canCancel;
  final bool canRaise;
  final String? closeReason;

  /// The creator's own words when they rejected it (alpha.2). Null when not
  /// rejected, when no reason was given, or when the field is absent.
  final String? rejectionReason;
  final DateTime createdAt;
  final DateTime? submittedAt;
  final DateTime? acceptedAt;
  final DateTime? fulfilledAt;
  final DateTime? closedAt;
  final DateTime updatedAt;
}

/// `VoteTallyEntry` (alpha.2): the votes one option received.
class VoteTallyEntry {
  const VoteTallyEntry({required this.optionId, required this.label, required this.votes});

  factory VoteTallyEntry.fromJson(Json j) => throw UnimplementedError('Not published: the implementation is private.');

  final String optionId;
  final String label;
  final int votes;
}

/// `SubmissionResult`.
class SubmissionResult {
  const SubmissionResult({required this.action, required this.paymentRequired, required this.paymentMethods});

  factory SubmissionResult.fromJson(Json j) => throw UnimplementedError('Not published: the implementation is private.');

  final ParticipantAction action;
  final bool paymentRequired;
  final List<PaymentMethodOption> paymentMethods;
}

/// The body of `submitRequest`, `submitVote`, `submitShoutOut`, `submitBid`
/// or `submitTip`. A paid one is then paid with `createPayment` or
/// `reportCashPayment`.
sealed class Submission {
  const Submission(this.configVersion);
  final int configVersion;

  /// Path segment under `/creator-actions/{id}/`.
  String get pathSegment;
  Json toJson();
}

class RequestSubmission extends Submission {
  const RequestSubmission({required int configVersion, required this.optionId, this.note, this.customFieldValue}) : super(configVersion);
  final String optionId;
  final String? note;
  final String? customFieldValue;

  @override
  String get pathSegment => throw UnimplementedError('Not published: the implementation is private.');

  @override
  Json toJson() => throw UnimplementedError('Not published: the implementation is private.');
}

class VoteSubmission extends Submission {
  const VoteSubmission({required int configVersion, required this.optionId}) : super(configVersion);
  final String optionId;

  @override
  String get pathSegment => throw UnimplementedError('Not published: the implementation is private.');

  @override
  Json toJson() => throw UnimplementedError('Not published: the implementation is private.');
}

class ShoutOutSubmission extends Submission {
  const ShoutOutSubmission({required int configVersion, required this.message, this.customFieldValue}) : super(configVersion);
  final String message;
  final String? customFieldValue;

  @override
  String get pathSegment => throw UnimplementedError('Not published: the implementation is private.');

  @override
  Json toJson() => throw UnimplementedError('Not published: the implementation is private.');
}

/// `submitBid`. [bidTermsAcknowledged] must be `true`: the participant was
/// shown, before paying, that they are charged now, that being outbid lowers
/// their place. A body without it can
/// not be built.
class BidSubmission extends Submission {
  BidSubmission({required int configVersion, required this.amount, required bool bidTermsAcknowledged, this.customFieldValue})
      : super(configVersion) {
    throw UnimplementedError('Not published: the implementation is private.');
  }

  final Money amount;
  final String? customFieldValue;

  @override
  String get pathSegment => throw UnimplementedError('Not published: the implementation is private.');

  @override
  Json toJson() => throw UnimplementedError('Not published: the implementation is private.');
}

/// `submitTip`: an amount the participant chooses, validated by the server
/// against the configured minimum and maximum.
class TipSubmission extends Submission {
  const TipSubmission({required int configVersion, required this.amount, this.message}) : super(configVersion);

  final Money amount;
  final String? message;

  @override
  String get pathSegment => throw UnimplementedError('Not published: the implementation is private.');

  @override
  Json toJson() => throw UnimplementedError('Not published: the implementation is private.');
}
