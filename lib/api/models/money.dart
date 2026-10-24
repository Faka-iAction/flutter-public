import '../json.dart';
import 'common.dart';

/// `CurrencyBalance` (Creator Money): the figures for one currency. Read-only: there is no
/// wallet, and nothing here may be called "available" or "withdrawable".
class CurrencyBalance {
  const CurrencyBalance({
    required this.currency,
    required this.collected,
    required this.notYetEligible,
    required this.held,
    required this.eligible,
    required this.processing,
    required this.paidOut,
    required this.owed,
  });

  factory CurrencyBalance.fromJson(Json j) => throw UnimplementedError('Not published: the implementation is private.');

  final String currency;
  final Money collected;
  final Money notYetEligible;
  final Money held;
  final Money eligible;
  final Money processing;
  final Money paidOut;
  final Money owed;

  /// Received and not yet paid out (ui-spec 8.15 "Pending").
  int get pendingMinor => throw UnimplementedError('Not published: the implementation is private.');
}

/// `PendingBalance` (getOwnPendingBalance).
class PendingBalance {
  const PendingBalance({required this.asOf, required this.balances});

  factory PendingBalance.fromJson(Json j) => throw UnimplementedError('Not published: the implementation is private.');

  final DateTime asOf;
  final List<CurrencyBalance> balances;
}

/// `LedgerEntry` (listOwnLedgerEntries): signed from the creator's point of view.
class LedgerEntry {
  const LedgerEntry({required this.id, required this.entryType, required this.amount, required this.occurredAt, required this.actionId, required this.cashMemo});

  factory LedgerEntry.fromJson(Json j) => throw UnimplementedError('Not published: the implementation is private.');

  static const actionPayment = 'ACTION_PAYMENT';

  final String id;
  final String entryType;
  final Money amount;
  final DateTime occurredAt;
  final String? actionId;
  final bool cashMemo;
}
