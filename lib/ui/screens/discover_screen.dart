import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

import '../../api/faka_api.dart';
import '../../app_scope.dart';
import '../../navigation/deep_links.dart';
import '../../navigation/nav_rules.dart';
import '../ref_icons.dart';
import '../theme.dart';
import '../widgets.dart';
import 'search_screen.dart';

/// Discover (ui-spec 8.1, screenshots 01, 19, 23, 57). Guests and new members
/// get the hub: two centred ways to a creator. A member who follows someone or
/// has taken part gets the search layout under the "Discover" title.
class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError('Not published: the implementation is private.');
  }
}

/// The scan dialog (ui-spec 9.1, screenshots 02 and 03): the camera when the
/// app has one, and the code printed under the QR code.
Future<void> showScanDialog(BuildContext context) async {
    throw UnimplementedError('Not published: the implementation is private.');
  }

/// The invite dialog (ui-spec 9.3): the joining link with the member's
/// referral code, and the code itself.
Future<void> showInviteDialog(BuildContext context) => throw UnimplementedError('Not published: the implementation is private.');

/// The member's referral code. The API has no referral codes yet, so it is
/// made from the member's name and id, as the reference does (ui-spec 5.3).
String referralCode(Member? m) {
    throw UnimplementedError('Not published: the implementation is private.');
  }
