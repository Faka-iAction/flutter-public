import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../api/faka_api.dart';
import '../../app_scope.dart';
import '../wording.dart';
import '../widgets.dart';
import 'not_found.dart';

/// The receipt of a confirmed online payment (`getPaymentReceipt`), as the
/// payer, member or guest, sees it. It names the creator paid and FAKA
/// iAction as the platform the payment was made through. It shows the payment's
/// state now, so a refund or a dispute appears on it. Cash paid in person
/// has no receipt here: its record is on the Action's status page.
class ReceiptScreen extends StatefulWidget {
  const ReceiptScreen({super.key, required this.paymentId});

  final String paymentId;

  @override
  State<ReceiptScreen> createState() => throw UnimplementedError('Not published: the implementation is private.');
}
