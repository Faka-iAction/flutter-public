import 'package:flutter/material.dart';

import '../widgets.dart';

/// The web's neutral "not found" page. [gone] is for a code withdrawn for good.
class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({super.key, this.gone = false});

  final bool gone;

  @override
  Widget build(BuildContext context) => throw UnimplementedError('Not published: the implementation is private.');
}
