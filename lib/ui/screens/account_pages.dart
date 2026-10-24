import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../api/faka_api.dart';
import '../../app_scope.dart';
import '../../navigation/nav_rules.dart';
import '../ref_icons.dart';
import '../theme.dart';
import '../wording.dart';
import '../widgets.dart';

/// The legal documents (ui-spec 8.12): id => title.
const legalDocuments = {'terms': 'Terms and conditions', 'disclaimer': 'Disclaimer', 'privacy': 'Privacy policy'};

/// A list row with a chevron (ui-spec `lrow`): bold title, optional muted line, hairline below.
class LinkRow extends StatelessWidget {
  const LinkRow({super.key, required this.title, required this.onTap, this.subtitle, this.last = false});

  final String title;
  final String? subtitle;
  final VoidCallback onTap;
  final bool last;

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError('Not published: the implementation is private.');
  }
}

/// The account links at the bottom of Profile (ui-spec 8.10 `profileLinks`): Settlement
/// settings (creators), Support, Learn more; Legal; Sign out, Deactivate, Delete.
class ProfileLinks extends StatelessWidget {
  const ProfileLinks({super.key});

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError('Not published: the implementation is private.');
  }
}

/// Inbox (ui-spec 8.11, screenshot 30): what changed on what the member sent, newest first.
/// There is no notifications API, so it is made from the member's own Actions: every one
/// that is no longer waiting.
class InboxScreen extends StatefulWidget {
  const InboxScreen({super.key});

  @override
  State<InboxScreen> createState() => throw UnimplementedError('Not published: the implementation is private.');
}
/// Support (ui-spec 8.12, screenshot 55).
class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context) => throw UnimplementedError('Not published: the implementation is private.');
}

/// A legal document (ui-spec 8.12, screenshot 54): a placeholder until the final text.
class LegalScreen extends StatelessWidget {
  const LegalScreen({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError('Not published: the implementation is private.');
  }
}

/// How an identifier shows on Profile (ui-spec 8.10): the first letter of an address and its
/// domain, or a number's country code and last three digits.
String maskIdentifier(String type, String? value, {String? provider}) {
    throw UnimplementedError('Not published: the implementation is private.');
  }
