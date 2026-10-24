import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

import '../../api/faka_api.dart';
import '../../app_scope.dart';
import 'package:url_launcher/url_launcher.dart';

import '../ref_icons.dart';
import '../theme.dart';
import '../wording.dart';
import '../widgets.dart';
import 'not_found.dart';

/// Public creator page (web: `/@handle`).
class CreatorScreen extends StatefulWidget {
  const CreatorScreen({super.key, required this.handle});

  final String handle;

  /// Creator Actions shown at a time (ui-spec 8.4).
  static const pageStep = 5;

  /// The app checks at most this many pages of follows to answer "do I follow
  /// this creator?": the contract has no direct way to ask (contract issue).
  static const followPagesChecked = 5;

  @override
  State<CreatorScreen> createState() => throw UnimplementedError('Not published: the implementation is private.');
}

/// The report dialog (ui-spec 9.8): a reason and optional details. The API has no
/// report operation, so "Send report" opens the web's report page with them filled in,
/// where the report is filed. The four reasons map to the moderation categories.
Future<void> showReportDialog(BuildContext context, {required String kind, required String subjectId, required String name}) => throw UnimplementedError('Not published: the implementation is private.');

/// The Follow / Following pill in the bar (ui-spec 4.1 `.fol`): brand fill to follow,
/// tint when following. A guest's tap goes to sign in.
class FollowPill extends StatelessWidget {
  const FollowPill({super.key, required this.following, required this.name, required this.signedIn, required this.onPressed});

  final bool following;
  final String name;
  final bool signedIn;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError('Not published: the implementation is private.');
  }
}

/// Share a creator (architecture 6.2): the link, with a copy button. Native
/// sharing is a later device addition.
class ShareBlock extends StatefulWidget {
  const ShareBlock({super.key, required this.name, required this.url});

  final String name;
  final String url;

  @override
  State<ShareBlock> createState() => throw UnimplementedError('Not published: the implementation is private.');
}
