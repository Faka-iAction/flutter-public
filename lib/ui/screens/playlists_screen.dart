import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../api/faka_api.dart';
import '../../app_scope.dart';
import '../creator_action_form.dart';
import '../ref_icons.dart';
import '../theme.dart';
import '../widgets.dart';

/// Playlists (web: `/creator/playlists`): a Request can take its choices from
/// one, so one list serves many Requests.
class PlaylistsScreen extends StatefulWidget {
  const PlaylistsScreen({super.key});

  @override
  State<PlaylistsScreen> createState() => throw UnimplementedError('Not published: the implementation is private.');
}

/// One playlist (web: `/creator/playlists/{id}`): its name and status, and
/// its items.
class PlaylistScreen extends StatefulWidget {
  const PlaylistScreen({super.key, required this.id});

  final String id;

  static const itemsShown = 100;

  @override
  State<PlaylistScreen> createState() => throw UnimplementedError('Not published: the implementation is private.');
}
