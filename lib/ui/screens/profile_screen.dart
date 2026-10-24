import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../api/faka_api.dart';
import '../../app_scope.dart';
import '../ref_icons.dart';
import '../theme.dart';
import '../widgets.dart';
import 'account_pages.dart';

/// Your profile (web: `/me/profile`): your name, how you sign in, becoming a
/// creator, and signing out.
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  static const displayNameMax = 80;

  @override
  State<ProfileScreen> createState() => throw UnimplementedError('Not published: the implementation is private.');
}
