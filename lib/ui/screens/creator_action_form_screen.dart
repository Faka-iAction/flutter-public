import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../api/faka_api.dart';
import '../../api/ids.dart';
import '../../app_scope.dart';
import '../creator_action_form.dart';
import '../wording.dart';
import '../widgets.dart';
import 'creator_actions_screen.dart';
import 'not_found.dart';

/// Create a Creator Action of one kind (web: `/creator/actions/new/{kind}`), or
/// edit one (web: `/creator/actions/{id}/edit`).
///
/// Editing a live Creator Action says, before anything is saved, that a change
/// to how it works makes a new version for new participants only (decision
/// 19). A paid configuration says it is managed on the web.
class CreatorActionFormScreen extends StatefulWidget {
  const CreatorActionFormScreen.create({super.key, required String this.kind}) : id = null;
  const CreatorActionFormScreen.edit({super.key, required String this.id}) : kind = null;

  final String? kind;
  final String? id;

  @override
  State<CreatorActionFormScreen> createState() => throw UnimplementedError('Not published: the implementation is private.');
}
