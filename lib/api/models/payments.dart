import '../json.dart';
import 'actions.dart';
import 'common.dart';

/// Values of `PaymentState` (CONVENTIONS 13.1). The state of an online payment
/// is never the state of its Action, and only `getPayment` says whether a
/// payment succeeded: a return from the provider's page proves nothing.
abstract final class PaymentStates {
  static const created = 'CREATED';
  static const pending = 'PENDING';
  static const confirmed = 'CONFIRMED';
  static const failed = 'FAILED';
  static const expired = 'EXPIRED';
  static const refunded = 'REFUNDED';
  static const disputed = 'DISPUTED';
  static const reversed = 'REVERSED';

  /// The outcome is not known yet: the client keeps asking, and starts no
  /// other payment.
  static const open = {created, pending};

  /// States that were confirmed at some point, and so have a receipt.
  static const everConfirmed = {confirmed, refunded, disputed, reversed};

  /// Never confirmed: nothing was taken.
  static const notTaken = {failed, expired};

  static const all = {created, pending, confirmed, failed, expired, refunded, disputed, reversed};

  /// Outcome unknown. An unknown state counts as open too, so the client
  /// keeps asking rather than guessing (the contract adds values compatibly).
  static bool isOpen(String state) => throw UnimplementedError('Not published: the implementation is private.');
}

/// `PaymentMethodOption.kind`, and the one method code the contract fixes.
abstract final class PaymentMethodKinds {
  static const online = 'ONLINE';
  static const cashInPerson = 'CASH_IN_PERSON';

  /// The code of cash in person. Online codes are decided by the server and
  /// sent back unchanged.
  static const cashCode = 'CASH_IN_PERSON';
}

/// Values of `CashReceiptState`. Exactly two: cash is never a payment state.
abstract final class CashReceiptStates {
  static const pending = 'CASH_REPORTED_PENDING_CREATOR_CONFIRMATION';
  static const confirmed = 'CASH_CONFIRMED_BY_CREATOR';
}

/// `CheckoutInstruction`. Only `REDIRECT` exists: open [url]. A client treats
/// any other type as "open the Action's web page".
class CheckoutInstruction {
  const CheckoutInstruction({required this.type, required this.url});

  factory CheckoutInstruction.fromJson(Json j) => throw UnimplementedError('Not published: the implementation is private.');

  static const redirect = 'REDIRECT';

  final String type;
  final String url;

  /// The provider's page, when it is a redirect to an `https` address (the
  /// contract's pattern). Anything else is never opened.
  Uri? get redirectUrl {
    throw UnimplementedError('Not published: the implementation is private.');
  }
}

/// `Payment`: an online payment as the payer sees it. No fee and no provider
/// reference.
class Payment {
  const Payment({
    required this.id,
    required this.actionId,
    required this.purpose,
    required this.amount,
    required this.method,
    required this.state,
    required this.checkout,
    required this.expiresAt,
    required this.confirmedAt,
    required this.failureCode,
    required this.refund,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Payment.fromJson(Json j) {
    throw UnimplementedError('Not published: the implementation is private.');
  }

  final String id;
  final String actionId;

  /// `INITIAL` or `BID_RAISE`.
  final String purpose;

  /// For a raise, the increase only.
  final Money amount;
  final String method;
  final String state;

  /// Present while the payment is open.
  final CheckoutInstruction? checkout;
  final DateTime expiresAt;
  final DateTime? confirmedAt;
  final String? failureCode;
  final RefundSummary? refund;
  final DateTime createdAt;
  final DateTime updatedAt;

  /// Outcome unknown (see [PaymentStates.isOpen]).
  bool get isOpen => throw UnimplementedError('Not published: the implementation is private.');
}

/// `PaymentReceipt`: names the creator paid and FAKA iAction as
/// the platform the payment was made through.
class PaymentReceipt {
  const PaymentReceipt({
    required this.paymentId,
    required this.issuedAt,
    required this.merchantHandle,
    required this.merchantName,
    required this.platformName,
    required this.actionId,
    required this.actionType,
    required this.actionTitle,
    required this.amount,
    required this.method,
    required this.paymentState,
    required this.refund,
  });

  factory PaymentReceipt.fromJson(Json j) {
    throw UnimplementedError('Not published: the implementation is private.');
  }

  final String paymentId;
  final DateTime issuedAt;
  final String merchantHandle;
  final String merchantName;
  final String platformName;
  final String actionId;
  final String actionType;
  final String actionTitle;
  final Money amount;
  final String method;
  final String paymentState;
  final RefundSummary? refund;
}

/// `ActionPaymentMethods`: the amount due and the methods usable now, decided
/// by the server.
class ActionPaymentMethods {
  const ActionPaymentMethods({required this.actionId, required this.amountDue, required this.methods});

  factory ActionPaymentMethods.fromJson(Json j) => throw UnimplementedError('Not published: the implementation is private.');

  final String actionId;
  final Money? amountDue;
  final List<PaymentMethodOption> methods;
}

/// `BidPosition`. Rank is information, not a promise.
class BidPosition {
  const BidPosition({required this.actionId, required this.rank, required this.rankedBidCount, required this.total, required this.asOf});

  factory BidPosition.fromJson(Json j) => throw UnimplementedError('Not published: the implementation is private.');

  final String actionId;
  final int? rank;
  final int rankedBidCount;
  final Money total;
  final DateTime asOf;
}

/// `CashReceipt`: the creator's attestation of cash paid in person. Not a
/// payment, never part of a balance.
class CashReceipt {
  const CashReceipt({
    required this.id,
    required this.actionId,
    required this.actionType,
    required this.creatorActionTitle,
    required this.amount,
    required this.state,
    required this.platformFee,
    required this.processingFee,
    required this.reportedAt,
    required this.confirmedAt,
    required this.note,
    required this.voidedAt,
    required this.correctsCashReceiptId,
    required this.correctionReason,
  });

  factory CashReceipt.fromJson(Json j) => throw UnimplementedError('Not published: the implementation is private.');

  final String id;
  final String actionId;
  final String actionType;
  final String creatorActionTitle;

  /// On a correction, the amount now attested, which may be zero.
  final Money amount;
  final String state;
  final Money platformFee;
  final Money processingFee;
  final DateTime reportedAt;
  final DateTime? confirmedAt;
  final String? note;

  /// Set when it was declined or timed out; the state does not change.
  final DateTime? voidedAt;
  final String? correctsCashReceiptId;
  final String? correctionReason;

  bool get isCorrection => throw UnimplementedError('Not published: the implementation is private.');
  bool get isVoided => throw UnimplementedError('Not published: the implementation is private.');
  bool get isConfirmed => throw UnimplementedError('Not published: the implementation is private.');

  /// Still waiting for the creator's decision.
  bool get isPending => throw UnimplementedError('Not published: the implementation is private.');
}
