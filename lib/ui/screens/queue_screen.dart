import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../api/faka_api.dart';
import '../../app_scope.dart';
import '../../navigation/nav_rules.dart';
import '../creator_action_form.dart';
import '../ref_icons.dart';
import '../theme.dart';
import '../wording.dart';
import '../widgets.dart';
import 'creator_actions_screen.dart';

/// The creator's queue, the Activity tab (web: `/creator/activity`): what
/// participants sent, oldest first, with accept, reject (with an optional
/// reason) and mark fulfilled. Decisions are not forced into any order
/// (decision 2). A decision that lost a race (answered on another device, or
/// its deadline passed) is shown as a plain message, and the queue reloads.
class QueueScreen extends StatefulWidget {
  const QueueScreen({super.key, this.state, this.creatorActionId});

  final String? state;
  final String? creatorActionId;

  static const pageSize = 20;

  @override
  State<QueueScreen> createState() => throw UnimplementedError('Not published: the implementation is private.');
}

/// Asks for an optional reason before rejecting.
class RejectDialog extends StatefulWidget {
  const RejectDialog({super.key, required this.item});

  final IncomingAction item;

  @override
  State<RejectDialog> createState() => throw UnimplementedError('Not published: the implementation is private.');
}
