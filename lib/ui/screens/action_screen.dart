import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../api/faka_api.dart';
import '../../api/ids.dart';
import '../../app_scope.dart';
import '../../navigation/router.dart';
import '../payment_flow.dart';
import '../theme.dart';
import '../wording.dart';
import '../widgets.dart';
import 'not_found.dart';

/// Public Creator Action page (web: `/@handle/slug`), with the form for a
/// guest or a member: Request, Vote and Shout-out, free or paid, a Tip and a
/// Bid.
///
/// A paid one is submitted first, then paid the way the participant chose:
/// online, on the provider's hosted page opened in a browser tab, or cash to
/// the creator in person where the server offers it (never for a Bid). The
/// status page then shows "confirming payment" until `getPayment` says what
/// happened; coming back from the provider's page proves nothing.
class ActionScreen extends StatefulWidget {
  const ActionScreen({super.key, required this.handle, required this.slug});

  final String handle;
  final String slug;

  static const noteMaxLength = 500;
  static const customFieldDefaultMax = 500;
  static const messageDefaultMax = 2000;

  /// The wording the web shows before a bid is paid (`_participation_form`).
  static const bidRule = 'Before you pay: you are charged now. Being outbid lowers your place.';
  static const bidRefunds =
      'You get your money back in full, automatically, if the creator declines your bid, turns this off, or does not fulfil it by the deadline. You can raise your bid later from its status page.';
  static const bidAcknowledgement = 'I understand that I am charged now, and that being outbid lowers my place.';
  static const bidAcknowledgementMissing = 'Tick the box to show you understand that you are charged now and that being outbid lowers your place.';
  static const cashTerms =
      'Cash is paid directly to the creator. FAKA iAction does not collect it, hold it or refund it, and charges no fee on it. It counts once the creator confirms, from their own account, that they received it.';

  @override
  State<ActionScreen> createState() => throw UnimplementedError('Not published: the implementation is private.');
}
