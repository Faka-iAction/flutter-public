import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../api/faka_api.dart';
import '../../app_scope.dart';
import '../../state/app_state.dart';
import '../theme.dart';
import '../widgets.dart';

/// Reads an email address or a phone number as the web does: spaces, dashes,
/// dots and brackets in a number are ignored; a number needs its country code.
/// Returns the identifier, or the message for the field.
Object parseIdentifier(String typed) {
    throw UnimplementedError('Not published: the implementation is private.');
  }

bool isEmail(String v) => throw UnimplementedError('Not published: the implementation is private.');

/// Sign in (web: `/sign-in`): a one-time code to an email address or phone
/// number, or an email address and password. Google and Apple are shown but
/// are not available yet, as on the web. Nothing here tells whether an
/// identifier is registered.
class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key, this.returnPath});

  /// Where to go after signing in: a validated in-app path.
  final String? returnPath;

  @override
  State<SignInScreen> createState() => throw UnimplementedError('Not published: the implementation is private.');
}

/// Enter your code (web: `/sign-in/code`). The same page whether or not the
/// identifier is registered.
class CodeScreen extends StatefulWidget {
  const CodeScreen({super.key});

  @override
  State<CodeScreen> createState() => throw UnimplementedError('Not published: the implementation is private.');
}
