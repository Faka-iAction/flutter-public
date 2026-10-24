import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../api/faka_api.dart';
import '../../app_scope.dart';
import '../../navigation/deep_links.dart';
import '../widgets.dart';
import 'not_found.dart';

/// `/q/{id}` (architecture 9): resolves the short opaque identifier with
/// `resolveQr` and replaces itself with the canonical page. A code that does
/// not lead anywhere shows the neutral page and never goes anywhere else; a
/// destination is accepted only as an in-app canonical path.
class QrScreen extends StatefulWidget {
  const QrScreen({super.key, required this.qrId});

  final String qrId;

  @override
  State<QrScreen> createState() => throw UnimplementedError('Not published: the implementation is private.');
}
