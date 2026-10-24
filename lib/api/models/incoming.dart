import '../json.dart';
import 'actions.dart';
import 'common.dart';

/// `IncomingParticipant`: member or guest, and a member's display name. Never
/// an identifier or a contact detail.
class IncomingParticipant {
  const IncomingParticipant({required this.kind, required this.displayName});

  factory IncomingParticipant.fromJson(Json j) => throw UnimplementedError('Not published: the implementation is private.');

  /// `MEMBER` or `GUEST`.
  final String kind;

  /// Null for a guest, and for a member with no display name.
  final String? displayName;

  bool get isMember => throw UnimplementedError('Not published: the implementation is private.');
}

/// `IncomingAction`: a participant Action as the creator who receives it sees
/// it.
class IncomingAction {
  const IncomingAction({
    required this.id,
    required this.type,
    required this.state,
    required this.creatorActionId,
    required this.creatorActionTitle,
    required this.participant,
    required this.selection,
    required this.note,
    required this.message,
    required this.customFieldValue,
    required this.amount,
    required this.paymentMethodKind,
    required this.paymentState,
    required this.cashReceiptState,
    required this.bid,
    required this.fulfilmentDeadlineAt,
    required this.submittedAt,
    required this.closeReason,
    required this.updatedAt,
  });

  factory IncomingAction.fromJson(Json j) {
    throw UnimplementedError('Not published: the implementation is private.');
  }

  final String id;
  final String type;
  final String state;
  final String creatorActionId;
  final String creatorActionTitle;
  final IncomingParticipant participant;
  final ActionSelection? selection;
  final String? note;
  final ActionMessage? message;
  final String? customFieldValue;
  final Money? amount;

  /// `FREE`, `ONLINE` or `CASH_IN_PERSON`.
  final String paymentMethodKind;
  final String? paymentState;
  final String? cashReceiptState;
  final BidStatus? bid;
  final DateTime? fulfilmentDeadlineAt;
  final DateTime? submittedAt;
  final String? closeReason;
  final DateTime updatedAt;

  /// Types the creator accepts, rejects and fulfils (a Vote and a Tip have no
  /// such step).
  static const withDecisions = {ActionTypes.request, ActionTypes.bid, ActionTypes.shoutOut};

  bool get canAccept => throw UnimplementedError('Not published: the implementation is private.');
  bool get canFulfil => throw UnimplementedError('Not published: the implementation is private.');
  bool get canReject => throw UnimplementedError('Not published: the implementation is private.');
}
