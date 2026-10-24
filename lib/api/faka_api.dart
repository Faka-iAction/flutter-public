import 'json.dart';
import 'models/actions.dart';
import 'models/common.dart';
import 'models/creator_actions.dart';
import 'models/creators.dart';
import 'models/identity.dart';
import 'models/incoming.dart';
import 'models/money.dart';
import 'models/payments.dart';

export 'json.dart' show Json, encodeTime;
export 'models/actions.dart';
export 'models/common.dart';
export 'models/creator_actions.dart';
export 'models/creators.dart';
export 'models/identity.dart';
export 'models/incoming.dart';
export 'models/money.dart';
export 'models/payments.dart';
export 'problem.dart';

/// The FAKA iAction API as the app uses it: one method per contract operation
/// (`operationId` in `faka-v1.yaml`, named in each doc comment). Screens depend
/// on this interface only, so widget tests run against a fake.
///
/// Every method throws `ApiException` on failure. Methods that sign in store
/// the tokens they receive; [signOut] removes them.
abstract interface class FakaApi {
  // ----------------------------------------------------------------- Identity

  /// `registerMember`. Same answer whether or not the identifier is registered.
  Future<VerificationChallenge> registerMember({
    required SignInIdentifier identifier,
    required String displayName,
    String? country,
    String? locale,
  });

  /// `startSignIn`. Same answer whether or not the identifier is registered.
  Future<VerificationChallenge> startSignIn(SignInIdentifier identifier);

  /// `signIn` with `grantType: verification_code`. Stores the tokens.
  Future<SignInResult> signInWithCode({required String verificationId, required String code});

  /// `signIn` with `grantType: password` (email only). Stores the tokens.
  Future<SignInResult> signInWithPassword({required String email, required String password});

  /// `signOut`. Removes the stored tokens even when the server cannot be told.
  Future<void> signOut();

  /// Whether a member session (tokens) is stored on this device.
  Future<bool> hasMemberSession();

  /// Fires when the server ended the member's session.
  Stream<void> get sessionEnded;

  // ------------------------------------------------------------------ Members

  /// `getOwnMember`.
  Future<Member> getOwnMember();

  /// `updateOwnMember`, display name only in this slice.
  Future<Member> updateOwnDisplayName(String displayName);

  /// `listOwnIdentifiers`.
  Future<ApiPage<MemberIdentifier>> listOwnIdentifiers({String? cursor, int? limit});

  /// `getOwnCapabilities`.
  Future<MemberCapabilities> getOwnCapabilities();

  // ---------------------------------------------------------------- Discovery

  /// `searchCreators`. Filters combine with AND; null filters are omitted.
  Future<ApiPage<PublicCreatorSummary>> searchCreators({
    String? q,
    String? category,
    String? country,
    String? city,
    String? language,
    String? cursor,
    int? limit,
  });

  /// `getPublicCreatorByHandle`. An old handle returns the current profile
  /// with `redirectedFrom` set.
  Future<PublicCreatorProfile> getPublicCreatorByHandle(String handle);

  /// `resolveQr`.
  Future<QrResolution> resolveQr(String qrId);

  // ---------------------------------------------------------------- Following

  /// `listFollowedCreators`, most recently followed first.
  Future<ApiPage<FollowedCreator>> listFollowedCreators({String? cursor, int? limit});

  /// `followCreator`. Idempotent by design.
  Future<void> followCreator(String creatorId);

  /// `unfollowCreator`. Idempotent by design.
  Future<void> unfollowCreator(String creatorId);

  // ----------------------------------------------------------- Public Actions

  /// `listPublicCreatorActions`.
  Future<ApiPage<PublicCreatorAction>> listPublicCreatorActions(String handle, {String? type, String? cursor, int? limit});

  /// `getPublicCreatorAction`.
  Future<PublicCreatorAction> getPublicCreatorAction(String handle, String actionSlug);

  /// `listPublicActionOptions`.
  Future<ApiPage<PublicActionOption>> listPublicActionOptions(String creatorActionId, {String? q, String? cursor, int? limit});

  // ------------------------------------------------------------ Participation

  /// `submitRequest`, `submitVote` or `submitShoutOut`, by the type of
  /// [submission]. As the member when signed in, otherwise as the guest of
  /// this device (a guest session is created on first use). [idempotencyKey]
  /// is required by the contract; reuse it only to retry the same submission.
  Future<SubmissionResult> submit(String creatorActionId, Submission submission, {required String idempotencyKey});

  /// `getAction`, as the member or as this device's guest.
  Future<ParticipantAction> getAction(String actionId);

  /// `listOwnActions` (members only), most recent first.
  Future<ApiPage<ParticipantAction>> listOwnActions({String? type, String? state, String? cursor, int? limit});

  /// The ids of the Actions this device made as a guest, newest first. Not an
  /// API operation: a guest can only read Actions back by id.
  Future<List<String>> guestActionIds();

  /// `listPublicVoteTally` (alpha.2, public). Before voting closes, and for a
  /// disabled Vote, it throws `409 VOTE_TALLY_NOT_AVAILABLE`.
  Future<ApiPage<VoteTallyEntry>> listPublicVoteTally(String creatorActionId, {String? cursor, int? limit});

  // ----------------------------------------------------------------- Payments
  //
  // All of these act on an Action this member or this device's guest already
  // made, so none of them creates a guest session. The operations that
  // require an `Idempotency-Key` take it from the caller: a new key for each
  // new intended payment, the same key only to retry that same one. The
  // transport retries them by itself with the key unchanged.

  /// `listActionPaymentMethods`: what is due and the methods usable now.
  Future<ActionPaymentMethods> listActionPaymentMethods(String actionId);

  /// `createPayment` with an `ONLINE` [method] code the server offered. The
  /// server computes the amount.
  Future<Payment> createPayment(String actionId, {required String method, required String idempotencyKey});

  /// `getPayment`: the only source of truth for whether a payment succeeded.
  Future<Payment> getPayment(String paymentId);

  /// `getPaymentReceipt`. `409 RECEIPT_NOT_AVAILABLE` for a payment that was
  /// never confirmed.
  Future<PaymentReceipt> getPaymentReceipt(String paymentId);

  /// `raiseBid`: a further payment for [increase] only, never cash.
  /// [bidTermsAcknowledged] must be true (the same acknowledgement as the
  /// first bid); the call refuses to send without it.
  Future<Payment> raiseBid(String actionId, {required Money increase, required String method, required bool bidTermsAcknowledged, required String idempotencyKey});

  /// `getBidPosition`. Refreshed, never cached: ranks move.
  Future<BidPosition> getBidPosition(String actionId);

  /// `reportCashPayment`: the participant pays the creator in person. Nothing
  /// is confirmed by it. [cashTermsAcknowledged] must be true (the participant
  /// was told FAKA iAction does not collect cash); the call refuses to send
  /// without it.
  Future<CashReceipt> reportCashPayment(String actionId, {required bool cashTermsAcknowledged, required String idempotencyKey});

  // ------------------------------------------------------- Cash (the creator)

  /// `listOwnCashReceipts`, most recently reported first. [pending] keeps
  /// only those still waiting for the creator's decision.
  Future<ApiPage<CashReceipt>> listOwnCashReceipts({bool? pending, String? state, String? creatorActionId, String? cursor, int? limit});

  /// `confirmCashReceipt`: the creator restates [amount], which must equal
  /// the reported amount.
  Future<CashReceipt> confirmCashReceipt(String cashReceiptId, {required Money amount, String? note, required String idempotencyKey});

  /// `voidCashReceipt`: the cash was not received. Idempotent by state, so it
  /// takes no key.
  Future<CashReceipt> voidCashReceipt(String cashReceiptId, {String? note});

  /// `correctCashReceipt`: a compensating record for a confirmed receipt.
  /// [amount] is what was actually received (zero or more).
  Future<CashReceipt> correctCashReceipt(String cashReceiptId, {required Money amount, required String reason, required String idempotencyKey});

  // ---------------------------------------------------------- Creator profile

  /// `becomeCreator`. [idempotencyKey] is optional in the contract; sending
  /// one makes a retry after a lost response return the first `201`.
  Future<CreatorProfile> becomeCreator({
    required String handle,
    required String displayName,
    required String category,
    required String country,
    String? idempotencyKey,
  });

  /// `getOwnCreatorProfile`.
  /// `updateOwnCreatorProfile`: a partial update; only the fields in [changes] change.
  /// `links` replace the creator's links as a whole.
  Future<CreatorProfile> updateOwnCreatorProfile(Map<String, Object?> changes);

  /// `getOwnPendingBalance` (Creator Money): read-only figures per currency.
  Future<PendingBalance> getOwnPendingBalance();

  /// `listOwnLedgerEntries`, most recent first.
  Future<ApiPage<LedgerEntry>> listOwnLedgerEntries({String? entryType, bool? cashMemo, String? cursor, int? limit});

  Future<CreatorProfile> getOwnCreatorProfile();

  // ---------------------------------------------------------- Creator Actions

  /// `listOwnCreatorActions`, most recently updated first.
  Future<ApiPage<CreatorAction>> listOwnCreatorActions({String? state, String? type, String? cursor, int? limit});

  /// `getOwnCreatorAction`.
  Future<CreatorAction> getOwnCreatorAction(String creatorActionId);

  /// `createCreatorAction`, in `DRAFT`. [config] is a
  /// `CreatorActionConfigInput`: only the fields to set.
  Future<CreatorAction> createCreatorAction({
    required String type,
    required String slug,
    required String title,
    String? description,
    DateTime? startsAt,
    DateTime? endsAt,
    Json config = const {},
    String? idempotencyKey,
  });

  /// `updateOwnCreatorAction`. [changes] is an `UpdateCreatorActionRequest`:
  /// only the fields that change (a `null` value clears a field that allows
  /// it). A change inside `config` creates a new configuration version.
  Future<CreatorAction> updateOwnCreatorAction(String creatorActionId, Json changes);

  /// `publishCreatorAction`.
  Future<CreatorAction> publishCreatorAction(String creatorActionId);

  /// `pauseCreatorAction`.
  Future<CreatorAction> pauseCreatorAction(String creatorActionId);

  /// `resumeCreatorAction`.
  Future<CreatorAction> resumeCreatorAction(String creatorActionId);

  /// `disableCreatorAction`. Cancels every unfulfilled participant Action on
  /// it; the caller confirms with the creator first.
  Future<CreatorAction> disableCreatorAction(String creatorActionId);

  /// `listOwnVoteTally` (alpha.2): the owner may read it at any time.
  Future<ApiPage<VoteTallyEntry>> listOwnVoteTally(String creatorActionId, {String? cursor, int? limit});

  /// `listCreatorActionOptions`, in display order.
  Future<ApiPage<ActionOption>> listCreatorActionOptions(String creatorActionId, {String? cursor, int? limit});

  /// `addCreatorActionOption`. Without [position] it goes last.
  Future<ActionOption> addCreatorActionOption(String creatorActionId, {required String label, int? position});

  /// `updateCreatorActionOption`. Null arguments are left unchanged.
  Future<ActionOption> updateCreatorActionOption(String creatorActionId, String optionId, {String? label, int? position, bool? available});

  /// `removeCreatorActionOption`. A chosen option gives `409 OPTION_IN_USE`.
  Future<void> removeCreatorActionOption(String creatorActionId, String optionId);

  // ---------------------------------------------------------------- Playlists

  /// `listOwnPlaylists`.
  Future<ApiPage<Playlist>> listOwnPlaylists({String? status, String? cursor, int? limit});

  /// `createPlaylist`.
  Future<Playlist> createPlaylist(String name);

  /// `updatePlaylist`. Null arguments are left unchanged.
  Future<Playlist> updatePlaylist(String playlistId, {String? name, String? status});

  /// `listPlaylistItems`, in display order.
  Future<ApiPage<PlaylistItem>> listPlaylistItems(String playlistId, {String? cursor, int? limit});

  /// `addPlaylistItem`.
  Future<PlaylistItem> addPlaylistItem(String playlistId, {required String title, String? artist});

  /// `updatePlaylistItem`. [artist] is always sent (null clears it).
  Future<PlaylistItem> updatePlaylistItem(String playlistId, String itemId,
      {required String title, required String? artist, required bool available, int? position});

  /// `removePlaylistItem`. A chosen item gives `409 OPTION_IN_USE`.
  Future<void> removePlaylistItem(String playlistId, String itemId);

  // ------------------------------------------------------------ Creator queue

  /// `listIncomingActions`, oldest first. Without [state], only Actions that
  /// count (`SUBMITTED` and later).
  Future<ApiPage<IncomingAction>> listIncomingActions({
    String? creatorActionId,
    String? type,
    String? state,
    String? cursor,
    int? limit,
  });

  /// `getIncomingAction`.
  Future<IncomingAction> getIncomingAction(String actionId);

  /// `acceptAction`.
  Future<IncomingAction> acceptAction(String actionId);

  /// `rejectAction`, with an optional [reason] the participant may see.
  Future<IncomingAction> rejectAction(String actionId, {String? reason});

  /// `fulfilAction`.
  Future<IncomingAction> fulfilAction(String actionId);
}
