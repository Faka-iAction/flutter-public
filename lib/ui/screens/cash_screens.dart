import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../api/faka_api.dart';
import '../../api/ids.dart';
import '../../app_scope.dart';
import '../wording.dart';
import '../widgets.dart';
import 'creator_area_screens.dart' show FlashOnce;
import 'not_found.dart';

/// The cash-in-person wording the creator pages share (web
/// `creator/cash.html.twig`).
abstract final class CashWording {
  static const intro =
      'Cash that people say they paid you in person. Only you can confirm it, from this account. FAKA iAction does not collect, hold or refund cash, and charges no fee on it; it is not part of your pending balance or any payout.';

  /// The web's text limit for notes and reasons (the contract's maximum).
  static const textMax = 255;

  static String listState(CashReceipt r) => throw UnimplementedError('Not published: the implementation is private.');
}

String cashReceiptPath(String id) => throw UnimplementedError('Not published: the implementation is private.');

/// Cash in person (web: `/creator/cash`): what waits for the creator's
/// confirmation, then every cash record, most recent first.
class CashScreen extends StatefulWidget {
  const CashScreen({super.key});

  static const pageSize = 50;

  @override
  State<CashScreen> createState() => throw UnimplementedError('Not published: the implementation is private.');
}

/// One cash record (web: `/creator/cash/{id}`): confirm it (restating the
/// amount), say it was not received, or correct a confirmation. Each asks for
/// confirmation first. Only the owning creator can do any of this.
class CashReceiptScreen extends StatefulWidget {
  const CashReceiptScreen({super.key, required this.id});

  final String id;

  /// The contract has no "get one cash receipt": the record is found by
  /// paging `listOwnCashReceipts`, up to this many pages of 100.
  static const maxPages = 5;

  @override
  State<CashReceiptScreen> createState() => throw UnimplementedError('Not published: the implementation is private.');
}
