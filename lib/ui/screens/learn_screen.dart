import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../app_scope.dart';
import '../theme.dart';
import '../widgets.dart';

/// How it works (ui-spec 8.2, screenshots 04 and 05): Participate | Creator
/// tabs, four numbered steps, a note and a call to action.
class LearnScreen extends StatefulWidget {
  const LearnScreen({super.key});

  /// The reference's `LEARN` copy (ui-spec Appendix B). The Participate note
  /// leaves out "Paying with bids and tips is not available yet": the app takes
  /// payments.
  static const participate = [
    ('Find a creator', 'Scan the QR code at an event, on a stream or on a poster. Or search by name or handle.'),
    ('Pick something to take part in', 'Open one of their Creator Actions: a Request for a song or item, a Vote, or a Shout-out with a short message.'),
    ('Send it', 'Most need no account. Some are for members only, and joining takes a minute with a one-time code.'),
    ('Follow what happens', 'Activity shows each one as Submitted, Accepted, Fulfilled or Rejected. Vote results appear when voting closes.'),
  ];
  static const participateNote =
      'If a creator sets a deadline and does not fulfil your request in time, it expires. Follow creators to find them again fast.';

  static const creator = [
    ('Become a creator', 'From your Profile choose Become a creator. Pick a handle, a name, your kind of creator and your country.'),
    (
      'Create a Creator Action',
      'Choose a Request, Vote or Shout-out. Add a title and choices or a playlist, set when it opens and closes, and decide if guests can take part. It saves as a draft.'
    ),
    ('Publish and share', 'Publish when you are ready, then share your page link. You can pause, resume or turn it off for good.'),
    (
      'Answer what people send',
      'Activity lists everything sent, oldest first. Accept, mark as fulfilled, or reject with a reason. Vote results stay private until voting closes.'
    ),
  ];
  static const creatorNote = 'A playlist lets one list serve many Requests. Bids and tips are set up on the FAKA iAction website for now.';

  @override
  State<LearnScreen> createState() => throw UnimplementedError('Not published: the implementation is private.');
}
