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
import 'creator_area_screens.dart';
import 'not_found.dart';

/// The location of one of the creator's Creator Actions.
String ownActionPath(String id) => throw UnimplementedError('Not published: the implementation is private.');

/// Wording shown on a paid Creator Action while paying is not in the app.
const paidManagedOnWeb =
    'This is paid. Paying, and how a paid Creator Action works, are managed on the FAKA iAction website for now.';

/// Creator Actions (web: `/creator/actions`): every state, most recently
/// updated first, with a state filter.
class CreatorActionsScreen extends StatefulWidget {
  const CreatorActionsScreen({super.key, this.state});

  /// The state filter from the location, or null for all.
  final String? state;

  /// Shown at a time (ui-spec 8.17).
  static const pageSize = 6;

  @override
  State<CreatorActionsScreen> createState() => throw UnimplementedError('Not published: the implementation is private.');
}

/// The chip for a Creator Action's state (ui-spec 6.2 CSTATE).
ChipKind creatorActionChip(String state) => throw UnimplementedError('Not published: the implementation is private.');

/// Step one of creating: choose the kind (web: `/creator/actions/new`).
class NewCreatorActionScreen extends StatelessWidget {
  const NewCreatorActionScreen({super.key});

  static const _explanations = {
    ActionTypes.request: 'People ask you for something from your list, like a song.',
    ActionTypes.vote: 'People vote for one of your options. Results show when voting closes.',
    ActionTypes.shoutOut: 'People send you a short message to read out or show.',
    ActionTypes.bid: 'People bid for a place in your queue. Needs paying, which is set up on the FAKA iAction website for now.',
    ActionTypes.tip: 'People send you a tip. Needs paying, which is set up on the FAKA iAction website for now.',
  };

  @override
  Widget build(BuildContext context) => throw UnimplementedError('Not published: the implementation is private.');
}

/// Counts what disabling would cancel: the open, unfulfilled participant
/// Actions on it (`CREATED`, `INITIATED`, `SUBMITTED`, `ACCEPTED`, as the web
/// counts them). The contract has no count, so one page of each state is read.
Future<({int count, bool more})> countOpenOn(FakaApi api, String creatorActionId, {int pageSize = 100}) async {
    throw UnimplementedError('Not published: the implementation is private.');
  }

/// What disabling will do, in the web's words.
String disableConsequence(({int count, bool more}) open) {
    throw UnimplementedError('Not published: the implementation is private.');
  }

/// One of the creator's Creator Actions (web: `/creator/actions/{id}`): its
/// state and how to change it, how it works, its choices, and for a Vote the
/// votes so far.
class CreatorActionScreen extends StatefulWidget {
  const CreatorActionScreen({super.key, required this.id});

  final String id;

  static const optionsShown = 100;

  @override
  State<CreatorActionScreen> createState() => throw UnimplementedError('Not published: the implementation is private.');
}
