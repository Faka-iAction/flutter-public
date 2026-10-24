import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../config/app_config.dart';
import '../state/app_state.dart';
import '../ui/screens/account_pages.dart';
import '../ui/screens/action_screen.dart';
import '../ui/screens/activity_screen.dart';
import '../ui/screens/become_creator_screen.dart';
import '../ui/screens/cash_screens.dart';
import '../ui/screens/creator_action_form_screen.dart';
import '../ui/screens/creator_actions_screen.dart';
import '../ui/screens/playlists_screen.dart';
import '../ui/screens/queue_screen.dart';
import '../ui/screens/creator_area_screens.dart';
import '../ui/screens/creator_screen.dart';
import '../ui/screens/discover_screen.dart';
import '../ui/screens/earnings_screen.dart';
import '../ui/screens/following_screen.dart';
import '../ui/screens/learn_screen.dart';
import '../ui/screens/search_screen.dart';
import '../ui/screens/profile_screen.dart';
import '../ui/screens/qr_screen.dart';
import '../ui/screens/receipt_screen.dart';
import '../ui/screens/sign_in_screen.dart';
import '../ui/screens/status_screen.dart';
import 'app_shell.dart';
import 'deep_links.dart';
import 'nav_rules.dart';

/// Where a location must go instead, or null to stay. Pure, so it is tested
/// without a widget tree.
String? redirectFor(Uri uri, {required AppState state, required AppConfig config}) {
    throw UnimplementedError('Not published: the implementation is private.');
  }

GoRouter buildRouter({required AppState state, required AppConfig config, String initialLocation = '/'}) {
    throw UnimplementedError('Not published: the implementation is private.');
  }

/// The canonical web path of a creator page, in the app.
String creatorPath(String handle) => throw UnimplementedError('Not published: the implementation is private.');
String actionPath(String handle, String slug) => throw UnimplementedError('Not published: the implementation is private.');
String statusPath(String actionId) => throw UnimplementedError('Not published: the implementation is private.');

/// Opens a page on top of the current one, so Back returns.
void openPage(BuildContext context, String location) => throw UnimplementedError('Not published: the implementation is private.');
