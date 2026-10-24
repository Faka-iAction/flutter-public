import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../api/faka_api.dart';
import '../../app_scope.dart';
import '../ref_icons.dart';
import '../theme.dart';
import '../wording.dart';
import '../widgets.dart';
import 'status_screen.dart';

/// Activity (web: `/activity`). A member's Actions come from `listOwnActions`;
/// a guest's are read one by one with `getAction` from the ids kept on this
/// device, as the web keeps them in the browser.
class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  /// How many guest Actions are read per page.
  static const guestPageSize = 20;

  /// Items shown at a time (ui-spec 8.7).
  static const pageStep = 5;

  @override
  State<ActivityScreen> createState() => throw UnimplementedError('Not published: the implementation is private.');
}
