/// Plain-English wording, kept the same as the web's (`App\Twig\WebExtension`
/// and `App\Web\ActionPresentation` in api-symfony). Presentation only: every
/// value it words was decided by the server.
///
/// Times are shown in UTC and say so, as on the web: the app does not guess a
/// time zone for what the creator set.
library;

import '../api/faka_api.dart';

abstract final class Wording {
  static const _months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];

  /// `5 Oct 2026, 14:00 UTC`.
  static String dateTime(DateTime? t) {
    throw UnimplementedError('Not published: the implementation is private.');
  }

  /// A day group heading (ui-spec 5.3): `Today`, `Yesterday`, else `14 Oct 2026`. In UTC, like every time shown.
  static String day(DateTime t, {DateTime? now}) {
    throw UnimplementedError('Not published: the implementation is private.');
  }

  /// Compact rands (ui-spec 5.3 `rand()`): `R3 000`, whole rands, thin spaces between thousands.
  /// Another currency keeps its code: `USD 12`.
  static String rand(int amountMinor, {String currency = 'ZAR'}) {
    throw UnimplementedError('Not published: the implementation is private.');
  }

  /// `ZAR 1 250.00`. Two decimal places, as the web shows them.
  static String money(Money? m) {
    throw UnimplementedError('Not published: the implementation is private.');
  }

  /// 5400 becomes "1 hour 30 minutes".
  static String duration(int? seconds) {
    throw UnimplementedError('Not published: the implementation is private.');
  }

  static const _categories = {'dj': 'DJ', 'tiktok_creator': 'TikTok creator', 'youtuber': 'YouTuber'};

  /// The categories the app offers when someone becomes a creator. The
  /// contract has no list of categories (README, contract issue 6), so these
  /// are the ones the web names; the server refuses an unknown one.
  static Map<String, String> get knownCategories => throw UnimplementedError('Not published: the implementation is private.');

  /// A Creator Action's state, as the creator sees it (web
  /// `web_creator_action_state`).
  static String creatorActionState(String state) => throw UnimplementedError('Not published: the implementation is private.');

  /// The short state name for a chip (ui-spec 8.17): the words before the colon.
  static String creatorActionStateShort(String state) => throw UnimplementedError('Not published: the implementation is private.');

  /// A participant Action's state in the creator's queue (web
  /// `web_incoming_state`).
  static String incomingState(String state) => throw UnimplementedError('Not published: the implementation is private.');

  /// The participant states the queue filter offers, as the web lists them.
  static const incomingStates = [
    ActionStates.created,
    ActionStates.initiated,
    ActionStates.submitted,
    ActionStates.accepted,
    ActionStates.fulfilled,
    ActionStates.completed,
    ActionStates.rejected,
    ActionStates.cancelled,
    ActionStates.expired,
    ActionStates.failed,
  ];

  /// "1 thing" or "3 things"; [more] adds "+" when a count stopped at a page.
  static String count(int n, String one, String many, {bool more = false}) => throw UnimplementedError('Not published: the implementation is private.');

  /// The deadline rule of the creator's own Creator Action, in the words the
  /// participant sees (decision 24: a free one counts from submission).
  static String? ownDeadlineRule(CreatorAction a) {
    throw UnimplementedError('Not published: the implementation is private.');
  }

  static String category(String code) {
    throw UnimplementedError('Not published: the implementation is private.');
  }

  static const _countries = {'ZA': 'South Africa', 'ZW': 'Zimbabwe', 'NG': 'Nigeria', 'KE': 'Kenya', 'GH': 'Ghana', 'BW': 'Botswana', 'NA': 'Namibia'};

  /// The country name where the app knows it, otherwise the code.
  static String country(String code) => throw UnimplementedError('Not published: the implementation is private.');

  static String location(String? city, String country) => throw UnimplementedError('Not published: the implementation is private.');

  static String actionType(String type) => throw UnimplementedError('Not published: the implementation is private.');

  /// The fulfilment deadline rule in plain words. Null when there is none.
  static String? deadlineRule(PublicCreatorAction a) {
    throw UnimplementedError('Not published: the implementation is private.');
  }

  /// Label and detail for a participant Action's state (web
  /// `web_participant_state`).
  static ({String label, String detail}) participantState(ParticipantAction a) {
    throw UnimplementedError('Not published: the implementation is private.');
  }

  /// How the web names a currency in a form label: "in rand".
  static String currencyName(String code) => throw UnimplementedError('Not published: the implementation is private.');

  /// A typed amount ("50", "50.5", "50,00") in minor units of [currency], as
  /// the web reads it. Null when it is not an amount. Two decimal places,
  /// like every currency the platform offers today.
  static Money? parseAmount(String typed, String currency) {
    throw UnimplementedError('Not published: the implementation is private.');
  }

  /// [m] as it is typed in an amount field: "50" or "50.50".
  static String amountInput(Money m) {
    throw UnimplementedError('Not published: the implementation is private.');
  }

  /// A method code as text: the server's display name where the app has it,
  /// otherwise the code made readable (`CARD` becomes "Card").
  static String method(String code) {
    throw UnimplementedError('Not published: the implementation is private.');
  }

  /// A payment's state, for the payer.
  static String paymentState(String state) => throw UnimplementedError('Not published: the implementation is private.');

  /// Why a payment was refunded.
  static String refundReason(String reason) => throw UnimplementedError('Not published: the implementation is private.');

  /// A refund that is not finished yet, as the web says it.
  static String refundInProgress(RefundSummary r) => throw UnimplementedError('Not published: the implementation is private.');

  static String moderation(ActionMessage m) => throw UnimplementedError('Not published: the implementation is private.');

  static String selection(ActionSelection s) => throw UnimplementedError('Not published: the implementation is private.');
}

/// What a public Creator Action page offers, as the web decides it
/// (`ActionPresentation::availability`).
enum Availability {
  /// The form is shown.
  form,

  /// The Action needs a payment and the server offers no way to pay it now
  /// (no payment provider, and no cash), or the app does not know its type.
  paid,

  /// Published, not open yet.
  notOpenYet,
  paused,

  /// Active, but outside its window at the moment.
  closed,

  /// The creator does not allow guests and the person is not signed in.
  membersOnly,
}

abstract final class ActionPresentation {
  /// The types the app can send.
  static const appTypes = {ActionTypes.request, ActionTypes.vote, ActionTypes.shoutOut, ActionTypes.bid, ActionTypes.tip};

  /// The online methods the server generally accepts for [a].
  static List<PaymentMethodOption> onlineMethods(PublicCreatorAction a) => throw UnimplementedError('Not published: the implementation is private.');

  /// Whether cash in person is offered: only where the server lists it, and
  /// never for a Bid (decision 3), whatever the list says.
  static bool cashOffered(PublicCreatorAction a) => throw UnimplementedError('Not published: the implementation is private.');

  /// A paid Action can be paid when the server offers an online method, or
  /// cash.
  static bool payable(PublicCreatorAction a) => throw UnimplementedError('Not published: the implementation is private.');

  static Availability availability(PublicCreatorAction a, {required bool asMember}) {
    throw UnimplementedError('Not published: the implementation is private.');
  }

  /// The short state shown on a creator's list of Actions.
  static String listState(PublicCreatorAction a, {required bool asMember}) => throw UnimplementedError('Not published: the implementation is private.');
}
