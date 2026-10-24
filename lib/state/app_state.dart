import 'dart:async';

import 'package:flutter/foundation.dart';

import '../api/faka_api.dart';
import '../navigation/nav_rules.dart';
import '../storage/key_value_store.dart';

/// What the app knows about the person using it: signed in or not, their
/// member record and capabilities, how many creators they follow (for the
/// Following tab), whether they took part as a guest, and the experience they
/// chose. Screens read it; only the methods here change it.
class AppState extends ChangeNotifier {
  AppState({required this.api, required KeyValueStore store}) : _store = store {
    _sub = api.sessionEnded.listen((_) => _clearMember());
  }

  static const _experienceKey = 'faka.experience';
  static const _onboardedKey = 'faka.onboarded';

  final FakaApi api;
  final KeyValueStore _store;
  StreamSubscription<void>? _sub;

  bool _loaded = false;
  bool _signedIn = false;
  Member? _member;
  bool _isCreator = false;
  int _followingCount = 0;
  bool _guestHasTakenPart = false;
  bool _hasOwnActivity = false;
  bool _onboarded = false;
  Experience _experience = Experience.consumer;

  bool get loaded => throw UnimplementedError('Not published: the implementation is private.');
  bool get signedIn => throw UnimplementedError('Not published: the implementation is private.');
  Member? get member => throw UnimplementedError('Not published: the implementation is private.');
  bool get isCreator => throw UnimplementedError('Not published: the implementation is private.');
  int get followingCount => throw UnimplementedError('Not published: the implementation is private.');
  bool get guestHasTakenPart => throw UnimplementedError('Not published: the implementation is private.');
  bool get hasOwnActivity => throw UnimplementedError('Not published: the implementation is private.');

  /// The onboarding slides were seen to the end or skipped (they show on first run only).
  bool get onboarded => throw UnimplementedError('Not published: the implementation is private.');

  NavInputs get navInputs => throw UnimplementedError('Not published: the implementation is private.');

  Experience get experience => throw UnimplementedError('Not published: the implementation is private.');

  /// Reads what is stored on the device and, when a member session exists,
  /// refreshes the member from the API. Offline, the stored session is kept.
  Future<void> load() async {
    throw UnimplementedError('Not published: the implementation is private.');
  }

  /// Pending one-time-code challenge between the sign-in and code screens.
  /// Kept in memory only, like the web keeps it in the session, never in a URL.
  PendingCode? pendingCode;

  /// Reloads the member record, capabilities and follow count.
  Future<void> refreshMember() async {
    throw UnimplementedError('Not published: the implementation is private.');
  }

  /// After `signIn` succeeded (the tokens are already stored).
  Future<void> signedInAs(Member member) async {
    throw UnimplementedError('Not published: the implementation is private.');
  }

  Future<void> signOut() async {
    throw UnimplementedError('Not published: the implementation is private.');
  }

  void memberUpdated(Member member) {
    throw UnimplementedError('Not published: the implementation is private.');
  }

  /// A guest's Action went through: Discover and Activity appear.
  void guestTookPart() {
    throw UnimplementedError('Not published: the implementation is private.');
  }

  /// Creator Home is in focus mode (ui-spec 7.6): the tabs are hidden while it is.
  bool get focusMode => throw UnimplementedError('Not published: the implementation is private.');
  bool _focusMode = false;

  set focusMode(bool on) {
    throw UnimplementedError('Not published: the implementation is private.');
  }

  /// The person finished or skipped the onboarding slides.
  Future<void> finishOnboarding() async {
    throw UnimplementedError('Not published: the implementation is private.');
  }

  /// A member's Action went through: Discover becomes the search (ui-spec 8.1).
  void memberTookPart() {
    throw UnimplementedError('Not published: the implementation is private.');
  }

  /// Re-counts follows after a follow or unfollow.
  Future<void> followsChanged() async {
    throw UnimplementedError('Not published: the implementation is private.');
  }

  /// A one-time message for the next page, like the web's flash messages.
  String? _flash;

  void flash(String message) => throw UnimplementedError('Not published: the implementation is private.');

  /// Returns the pending message once, then forgets it.
  String? takeFlash() {
    throw UnimplementedError('Not published: the implementation is private.');
  }

  /// After `becomeCreator` succeeded: the member holds the creator capability
  /// and goes straight to the creator experience (architecture 39).
  Future<void> becameCreator() async {
    throw UnimplementedError('Not published: the implementation is private.');
  }

  Future<void> switchExperience(Experience to) async {
    throw UnimplementedError('Not published: the implementation is private.');
  }

  @override
  void dispose() {
    throw UnimplementedError('Not published: the implementation is private.');
  }
}

/// A code was sent to [identifier]; the code screen completes it.
class PendingCode {
  const PendingCode({required this.verificationId, required this.identifier, required this.returnPath, required this.resendAfter});

  final String verificationId;

  /// As the person typed it, to show "We sent a one-time code to ...".
  final String identifier;
  final String? returnPath;
  final int resendAfter;
}
