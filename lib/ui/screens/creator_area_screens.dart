import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

import '../../api/faka_api.dart';
import '../../app_scope.dart';
import '../../navigation/nav_rules.dart';
import '../../state/app_state.dart';
import '../ref_icons.dart';
import '../theme.dart';
import 'account_pages.dart';
import 'queue_screen.dart' show RejectDialog;
import '../wording.dart';
import '../widgets.dart';

/// Shows the pending flash message once, at the top of a creator page.
mixin FlashOnce<T extends StatefulWidget> on State<T> {
  String? flashMessage;
  bool _flashTaken = false;

  void takeFlash() {
    throw UnimplementedError('Not published: the implementation is private.');
  }
}

/// How many items wait for the creator's answer: submitted or accepted, of a
/// type with an acceptance step (as the web counts them). The contract has no
/// count, so one page of each state is read and "+" is added when there are
/// more (README, contract issues).
Future<({int count, bool more})> countWaiting(FakaApi api, {int pageSize = 100}) async {
    throw UnimplementedError('Not published: the implementation is private.');
  }

/// Creator Home (ui-spec 8.14, screenshots 33 to 36 and 59): the Creator mode pill in the
/// bar; the header with Copy link; Earnings; Items to action with their answer buttons,
/// Filter, Group and Focus; Actions Open Now. A creator with nothing yet gets one call to
/// action. With more than four items waiting, Home switches to focus mode (ui-spec 7.6).
class CreatorHomeScreen extends StatefulWidget {
  const CreatorHomeScreen({super.key});

  /// Open Creator Actions listed on Home; the Actions tab has the rest.
  static const openShown = 20;

  /// More waiting items than this switches Home to focus mode (ui-spec 7.6).
  static const focusFrom = 4;

  @override
  State<CreatorHomeScreen> createState() => throw UnimplementedError('Not published: the implementation is private.');
}

/// A link with a copy button.
class CopyLink extends StatefulWidget {
  const CopyLink({super.key, required this.label, required this.url, required this.keyName, this.shown});

  final String label;
  final String url;

  /// What the row shows instead of the whole address, like `/@handle/slug`.
  final String? shown;
  final String keyName;

  @override
  State<CopyLink> createState() => throw UnimplementedError('Not published: the implementation is private.');
}

/// More (ui-spec 8.20, screenshots 46, 47): the search icon in the bar opens "Search More";
/// one tile per page that exists.
class CreatorMoreScreen extends StatefulWidget {
  const CreatorMoreScreen({super.key});

  @override
  State<CreatorMoreScreen> createState() => throw UnimplementedError('Not published: the implementation is private.');
}

/// The creator's Profile (ui-spec 8.21, screenshot 50): the bell for the Inbox; Public
/// Profile with Edit and Preview; Private Profile with Edit; then the account links.
class CreatorProfileScreen extends StatefulWidget {
  const CreatorProfileScreen({super.key});

  @override
  State<CreatorProfileScreen> createState() => throw UnimplementedError('Not published: the implementation is private.');
}

/// Edit public profile (ui-spec 8.21, screenshot 51): name, the handle (read only), kind,
/// city and country, bio, up to three links; Cancel and Save (updateOwnCreatorProfile).
class EditPublicProfileScreen extends StatefulWidget {
  const EditPublicProfileScreen({super.key});

  @override
  State<EditPublicProfileScreen> createState() => throw UnimplementedError('Not published: the implementation is private.');
}
