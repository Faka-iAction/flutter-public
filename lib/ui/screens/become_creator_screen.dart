import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../api/faka_api.dart';
import '../../api/ids.dart';
import '../../app_scope.dart';
import '../../navigation/nav_rules.dart';
import '../wording.dart';
import '../widgets.dart';

/// Become a creator (web: `/me/become-creator`; architecture 39, short
/// onboarding): handle, creator name, kind of creator and country, then
/// straight to the creator Home.
class BecomeCreatorScreen extends StatefulWidget {
  const BecomeCreatorScreen({super.key});

  static const handleMin = 3;
  static const handleMax = 30;
  static const nameMax = 80;
  static final _handle = RegExp(r'^[a-z0-9_]+$');

  /// The handle as the web reads it: lower case, without the "@" people type.
  static String normaliseHandle(String typed) {
    throw UnimplementedError('Not published: the implementation is private.');
  }

  static bool validHandle(String h) => throw UnimplementedError('Not published: the implementation is private.');

  @override
  State<BecomeCreatorScreen> createState() => throw UnimplementedError('Not published: the implementation is private.');
}
