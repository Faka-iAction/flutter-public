/// The Creator Action form, as the web's `App\Web\CreatorActionForm` has it:
/// which fields a type shows, reading them into a request body, and wording
/// the server's field codes. Shape only: every business rule is the server's.
///
/// The app sets up free Requests, Votes and Shout-outs. Paid configurations
/// (Bid, Tip, a paid Request or Shout-out) are managed on the web for now,
/// because the payment operations are not in the app yet; their basics (title,
/// description, times) can still be edited here.
///
/// Times are entered and shown in UTC, as on the web. The fulfilment period is
/// entered in minutes.
library;

import '../api/faka_api.dart';

abstract final class ActionFormRules {
  static const titleMax = 120;
  static const slugMax = 60;
  static const descriptionMax = 2000;
  static const messageMax = 2000;
  static const customLabelMax = 120;
  static const customMax = 500;
  static const optionLabelMax = 200;
  static const playlistNameMax = 120;
  static const itemTextMax = 200;
  static const rejectReasonMax = 255;

  static final slugPattern = RegExp(r'^[a-z0-9]+(-[a-z0-9]+)*$');

  /// `/creator/actions/new/{kind}` to the type.
  static const kinds = {
    'request': ActionTypes.request,
    'vote': ActionTypes.vote,
    'shout-out': ActionTypes.shoutOut,
    'bid': ActionTypes.bid,
    'tip': ActionTypes.tip,
  };

  /// The types the app can set up: the free ones.
  static const appTypes = {ActionTypes.request, ActionTypes.vote, ActionTypes.shoutOut};

  /// The configuration fields the app shows per type, in display order.
  static const configFields = {
    ActionTypes.request: [
      'optionsSource', 'playlistId', 'fulfilmentDeadlineRule', 'fulfilmentPeriodMinutes', 'approvalRequired', //
      'guestParticipationAllowed', 'quantityLimit', 'duplicateSelectionsAllowed', 'customFieldEnabled', 'customFieldLabel',
      'customFieldMaxLength',
    ],
    ActionTypes.vote: ['votesPerParticipant', 'guestParticipationAllowed', 'quantityLimit'],
    ActionTypes.shoutOut: [
      'messageMaxLength', 'fulfilmentDeadlineRule', 'fulfilmentPeriodMinutes', 'approvalRequired', 'guestParticipationAllowed', //
      'quantityLimit', 'customFieldEnabled', 'customFieldLabel', 'customFieldMaxLength',
    ],
  };

  static const labels = {
    'title': 'Title',
    'slug': 'Link name',
    'description': 'Description',
    'startsAt': 'Opens at',
    'endsAt': 'Closes at',
    'fulfilmentDeadlineRule': 'Deadline',
    'fulfilmentPeriodMinutes': 'Minutes to fulfil',
    'approvalRequired': 'Approval',
    'guestParticipationAllowed': 'Guests',
    'quantityLimit': 'Most in total',
    'duplicateSelectionsAllowed': 'Same choice twice',
    'votesPerParticipant': 'Votes per person',
    'optionsSource': 'Choices',
    'playlistId': 'Playlist',
    'messageMaxLength': 'Longest message',
    'customFieldEnabled': 'Extra question',
    'customFieldLabel': 'Extra question',
    'customFieldMaxLength': 'Longest answer',
    'price': 'Price',
    'paymentRequirement': 'Free or paid',
  };

  /// Whether the app may change how this Creator Action works (its config).
  static bool configEditable(String type, CreatorActionConfig? config) => throw UnimplementedError('Not published: the implementation is private.');

  /// The form field a server field error belongs to, or null.
  static String? fieldOf(String type, String apiField) {
    throw UnimplementedError('Not published: the implementation is private.');
  }

  /// A server field code in plain words (web `CreatorActionForm::message`).
  static String message(String apiField, String code) {
    throw UnimplementedError('Not published: the implementation is private.');
  }

  /// "Still needed: ..." for a refused publish (web `problems`).
  static String problems(ApiException e) {
    throw UnimplementedError('Not published: the implementation is private.');
  }

  /// `2026-10-31 20:00` (UTC), as the form shows a time.
  static String formatTime(DateTime? t) {
    throw UnimplementedError('Not published: the implementation is private.');
  }

  /// A typed UTC time, or null when it cannot be read.
  static DateTime? parseTime(String text) {
    throw UnimplementedError('Not published: the implementation is private.');
  }
}

/// What the form holds, as text and switches.
class ActionFormValues {
  ActionFormValues({
    required this.type,
    this.title = '',
    this.slug = '',
    this.description = '',
    this.startsAt = '',
    this.endsAt = '',
    this.deadlineRule = '',
    this.periodMinutes = '',
    this.approvalRequired = true,
    this.guestsAllowed = true,
    this.quantityLimit = '',
    this.duplicatesAllowed = true,
    this.optionsSource = 'ACTION_OPTIONS',
    this.playlistId,
    this.votesPerParticipant = '1',
    this.messageMaxLength = '280',
    this.customEnabled = false,
    this.customLabel = '',
    this.customMax = '',
  });

  /// The starting values of a new Creator Action: the server's defaults.
  factory ActionFormValues.defaults(String type) => throw UnimplementedError('Not published: the implementation is private.');

  factory ActionFormValues.of(CreatorAction a) {
    throw UnimplementedError('Not published: the implementation is private.');
  }

  final String type;
  String title;
  String slug;
  String description;
  String startsAt;
  String endsAt;

  /// '' (none), `FIXED_PERIOD_AFTER_PAYMENT` or `AT_ACTION_END`.
  String deadlineRule;
  String periodMinutes;
  bool approvalRequired;
  bool guestsAllowed;
  String quantityLimit;
  bool duplicatesAllowed;
  String optionsSource;
  String? playlistId;
  String votesPerParticipant;
  String messageMaxLength;
  bool customEnabled;
  String customLabel;
  String customMax;
}

/// The form, read: field errors, or what to send.
class ActionFormResult {
  const ActionFormResult({
    required this.errors,
    required this.title,
    required this.slug,
    required this.description,
    required this.startsAt,
    required this.endsAt,
    required this.config,
  });

  final Map<String, String> errors;
  final String title;
  final String slug;
  final String? description;
  final DateTime? startsAt;
  final DateTime? endsAt;

  /// A `CreatorActionConfigInput` with every field the type shows; empty
  /// when the configuration is not edited in the app.
  final Json config;

  bool get ok => throw UnimplementedError('Not published: the implementation is private.');

  /// An `UpdateCreatorActionRequest` with only what differs from [current]:
  /// an unchanged end time that has passed is not sent again, and an
  /// unchanged configuration makes no new version.
  Json changesFrom(CreatorAction current) {
    throw UnimplementedError('Not published: the implementation is private.');
  }
}

/// Reads [v]. [creating] adds the slug; [withConfig] is false for a paid
/// Creator Action, whose configuration is managed on the web.
ActionFormResult readActionForm(ActionFormValues v, {required bool creating, required bool withConfig}) {
    throw UnimplementedError('Not published: the implementation is private.');
  }
