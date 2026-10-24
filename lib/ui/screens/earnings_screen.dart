import 'package:flutter/material.dart';

import '../../api/faka_api.dart';
import '../../app_scope.dart';
import '../theme.dart';
import '../wording.dart';
import '../widgets.dart';

/// Earnings (ui-spec 8.15, screenshots 37, 38): Settled and Pending, the total, and the
/// payments under All | Pending | Settled.
///
/// The figures come from getOwnPendingBalance: Settled is `paidOut`; Pending is what was
/// received and not yet paid out (not yet eligible, held, eligible and processing). The
/// ledger has no per-payment "settled" flag, so payments are shown as settled oldest first,
/// up to the share of what was collected that has been paid out.
class EarningsScreen extends StatefulWidget {
  const EarningsScreen({super.key});

  @override
  State<EarningsScreen> createState() => throw UnimplementedError('Not published: the implementation is private.');
}
