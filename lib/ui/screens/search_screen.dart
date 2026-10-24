import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../api/faka_api.dart';
import '../../app_scope.dart';
import '../../navigation/nav_rules.dart';
import '../ref_icons.dart';
import '../theme.dart';
import '../wording.dart';
import '../widgets.dart';
import 'discover_screen.dart';

/// Search (ui-spec 8.3, screenshots 06, 07, 08, 23, 24): a live search bar
/// with a filter button, Type and Actions filter chips, All | Following for a
/// member who follows someone, and creator rows six at a time.
///
/// The API filters by one category and has no filter by kind of Creator
/// Action, so several types are searched one by one and merged, and the
/// Actions filter reads each listed creator's public Creator Actions.
class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key, this.title = 'Search'});

  /// "Search", or "Discover" when it is a returning member's Discover (8.1B).
  final String title;

  static const pageStep = 6;
  static const searchMaxLength = 100;
  static const debounce = Duration(milliseconds: 250);

  /// Type chips (ui-spec 8.3), as category codes.
  static const types = [('dj', 'DJ'), ('youtuber', 'YouTuber'), ('tiktok_creator', 'TikTok creator')];

  /// Actions chips (ui-spec 8.3).
  static const kinds = [
    (ActionTypes.request, 'Request'),
    (ActionTypes.shoutOut, 'Shout-out'),
    (ActionTypes.vote, 'Vote'),
    (ActionTypes.bid, 'Bid'),
  ];

  @override
  State<SearchScreen> createState() => throw UnimplementedError('Not published: the implementation is private.');
}
