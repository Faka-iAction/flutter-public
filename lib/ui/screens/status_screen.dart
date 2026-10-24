import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

import '../../api/faka_api.dart';
import '../../api/ids.dart';
import '../../app_scope.dart';
import '../payment_flow.dart';
import '../ref_icons.dart';
import '../theme.dart';
import '../wording.dart';
import '../widgets.dart';
import 'action_screen.dart';
import 'creator_area_screens.dart' show FlashOnce;
import 'discover_screen.dart' show referralCode;
import 'not_found.dart';

/// The status of one submission (web: `/a/{id}`), read with `getAction` as the
/// member or as this device's guest.
///
/// For a paid Action it is also where the payer comes back to from the
/// provider's page. Coming back proves nothing: while a payment is open the
/// page says "confirming payment" and asks `getPayment` at a modest interval,
/// up to a cap, and shows only what the server says. It asks again when the
/// app comes back to the foreground, and when the person asks.
///
/// A Bid shows its total and place, refreshed with `getBidPosition`, and can
/// be raised after the same acknowledgement as the first bid. Cash shows that
/// it waits for the creator.
class StatusScreen extends StatefulWidget {
  const StatusScreen({super.key, required this.actionId});

  final String actionId;

  /// How often an open payment is checked, and how many times before the page
  /// stops by itself (about a minute). "Check again" starts over.
  static const pollInterval = Duration(seconds: 3);
  static const maxPolls = 20;

  @override
  State<StatusScreen> createState() => throw UnimplementedError('Not published: the implementation is private.');
}

/// The guest's widget at the bottom (ui-spec 8.6, screenshot 15): keep your history,
/// Join or sign in, Share creator and Invite a friend. The API cannot attach a guest's
/// Actions to an account, so the line says what an account keeps: what is sent from now on.
class KeepHistoryOffer extends StatelessWidget {
  const KeepHistoryOffer({super.key, this.shareUrl});

  /// The creator's page, for Share creator; null leaves only Invite a friend.
  final String? shareUrl;

  @override
  Widget build(BuildContext context) => throw UnimplementedError('Not published: the implementation is private.');
}

/// The member's widget at the bottom (ui-spec 8.6, screenshots 21, 27): Share creator,
/// Invite a friend, and the referral code with Copy code. The API has no referral codes;
/// the code is made from the member's name and id (see referralCode).
class SpreadTheWord extends StatefulWidget {
  const SpreadTheWord({super.key, required this.shareUrl});

  final String shareUrl;

  @override
  State<SpreadTheWord> createState() => throw UnimplementedError('Not published: the implementation is private.');
}
