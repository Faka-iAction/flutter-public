import 'faka_api.dart';
import 'transport.dart';
import '../storage/guest_store.dart';

/// [FakaApi] over HTTP, written from `faka-v1.yaml`. Paths are relative to the
/// configured base URL, which carries `/api/v1`.
class HttpFakaApi implements FakaApi {
  HttpFakaApi(this._t, this._guest);

  final ApiTransport _t;
  final GuestStore _guest;

  // ----------------------------------------------------------------- Identity

  @override
  Future<VerificationChallenge> registerMember({
    required SignInIdentifier identifier,
    required String displayName,
    String? country,
    String? locale,
  }) async {
    throw UnimplementedError('Not published: the implementation is private.');
  }

  @override
  Future<VerificationChallenge> startSignIn(SignInIdentifier identifier) async {
    throw UnimplementedError('Not published: the implementation is private.');
  }

  @override
  Future<SignInResult> signInWithCode({required String verificationId, required String code}) async {
    throw UnimplementedError('Not published: the implementation is private.');
  }

  @override
  Future<SignInResult> signInWithPassword({required String email, required String password}) async {
    throw UnimplementedError('Not published: the implementation is private.');
  }

  @override
  Future<void> signOut() async {
    throw UnimplementedError('Not published: the implementation is private.');
  }

  @override
  Future<bool> hasMemberSession() => throw UnimplementedError('Not published: the implementation is private.');

  @override
  Stream<void> get sessionEnded => throw UnimplementedError('Not published: the implementation is private.');

  // ------------------------------------------------------------------ Members

  @override
  Future<Member> getOwnMember() async => throw UnimplementedError('Not published: the implementation is private.');

  @override
  Future<Member> updateOwnDisplayName(String displayName) async => throw UnimplementedError('Not published: the implementation is private.');

  @override
  Future<ApiPage<MemberIdentifier>> listOwnIdentifiers({String? cursor, int? limit}) async => throw UnimplementedError('Not published: the implementation is private.');

  @override
  Future<MemberCapabilities> getOwnCapabilities() async => throw UnimplementedError('Not published: the implementation is private.');

  // ---------------------------------------------------------------- Discovery

  @override
  Future<ApiPage<PublicCreatorSummary>> searchCreators({
    String? q,
    String? category,
    String? country,
    String? city,
    String? language,
    String? cursor,
    int? limit,
  }) async => throw UnimplementedError('Not published: the implementation is private.');

  @override
  Future<PublicCreatorProfile> getPublicCreatorByHandle(String handle) async => throw UnimplementedError('Not published: the implementation is private.');

  @override
  Future<QrResolution> resolveQr(String qrId) async => throw UnimplementedError('Not published: the implementation is private.');

  // ---------------------------------------------------------------- Following

  @override
  Future<ApiPage<FollowedCreator>> listFollowedCreators({String? cursor, int? limit}) async => throw UnimplementedError('Not published: the implementation is private.');

  @override
  Future<void> followCreator(String creatorId) => throw UnimplementedError('Not published: the implementation is private.');

  @override
  Future<void> unfollowCreator(String creatorId) => throw UnimplementedError('Not published: the implementation is private.');

  // ----------------------------------------------------------- Public Actions

  @override
  Future<ApiPage<PublicCreatorAction>> listPublicCreatorActions(String handle, {String? type, String? cursor, int? limit}) async => throw UnimplementedError('Not published: the implementation is private.');

  @override
  Future<PublicCreatorAction> getPublicCreatorAction(String handle, String actionSlug) async => throw UnimplementedError('Not published: the implementation is private.');

  @override
  Future<ApiPage<PublicActionOption>> listPublicActionOptions(String creatorActionId, {String? q, String? cursor, int? limit}) async => throw UnimplementedError('Not published: the implementation is private.');

  // ------------------------------------------------------------ Participation

  @override
  Future<SubmissionResult> submit(String creatorActionId, Submission submission, {required String idempotencyKey}) async {
    throw UnimplementedError('Not published: the implementation is private.');
  }

  @override
  Future<ParticipantAction> getAction(String actionId) async => throw UnimplementedError('Not published: the implementation is private.');

  @override
  Future<ApiPage<ParticipantAction>> listOwnActions({String? type, String? state, String? cursor, int? limit}) async => throw UnimplementedError('Not published: the implementation is private.');

  @override
  Future<List<String>> guestActionIds() => throw UnimplementedError('Not published: the implementation is private.');

  @override
  Future<ApiPage<VoteTallyEntry>> listPublicVoteTally(String creatorActionId, {String? cursor, int? limit}) async => throw UnimplementedError('Not published: the implementation is private.');

  @override
  Future<ActionPaymentMethods> listActionPaymentMethods(String actionId) async => throw UnimplementedError('Not published: the implementation is private.');

  @override
  Future<Payment> createPayment(String actionId, {required String method, required String idempotencyKey}) async => throw UnimplementedError('Not published: the implementation is private.');

  @override
  Future<Payment> getPayment(String paymentId) async => throw UnimplementedError('Not published: the implementation is private.');

  @override
  Future<PaymentReceipt> getPaymentReceipt(String paymentId) async => throw UnimplementedError('Not published: the implementation is private.');

  @override
  Future<Payment> raiseBid(String actionId,
      {required Money increase, required String method, required bool bidTermsAcknowledged, required String idempotencyKey}) async {
    throw UnimplementedError('Not published: the implementation is private.');
  }

  @override
  Future<BidPosition> getBidPosition(String actionId) async => throw UnimplementedError('Not published: the implementation is private.');

  @override
  Future<CashReceipt> reportCashPayment(String actionId, {required bool cashTermsAcknowledged, required String idempotencyKey}) async {
    throw UnimplementedError('Not published: the implementation is private.');
  }

  @override
  Future<ApiPage<CashReceipt>> listOwnCashReceipts({bool? pending, String? state, String? creatorActionId, String? cursor, int? limit}) async => throw UnimplementedError('Not published: the implementation is private.');

  @override
  Future<CashReceipt> confirmCashReceipt(String cashReceiptId, {required Money amount, String? note, required String idempotencyKey}) async => throw UnimplementedError('Not published: the implementation is private.');

  @override
  Future<CashReceipt> voidCashReceipt(String cashReceiptId, {String? note}) async => throw UnimplementedError('Not published: the implementation is private.');

  @override
  Future<CashReceipt> correctCashReceipt(String cashReceiptId, {required Money amount, required String reason, required String idempotencyKey}) async => throw UnimplementedError('Not published: the implementation is private.');

  // ---------------------------------------------------------- Creator profile

  @override
  Future<CreatorProfile> becomeCreator({
    required String handle,
    required String displayName,
    required String category,
    required String country,
    String? idempotencyKey,
  }) async => throw UnimplementedError('Not published: the implementation is private.');

  @override
  Future<CreatorProfile> updateOwnCreatorProfile(Map<String, Object?> changes) async => throw UnimplementedError('Not published: the implementation is private.');

  @override
  Future<PendingBalance> getOwnPendingBalance() async => throw UnimplementedError('Not published: the implementation is private.');

  @override
  Future<ApiPage<LedgerEntry>> listOwnLedgerEntries({String? entryType, bool? cashMemo, String? cursor, int? limit}) async => throw UnimplementedError('Not published: the implementation is private.');

  @override
  Future<CreatorProfile> getOwnCreatorProfile() async => throw UnimplementedError('Not published: the implementation is private.');

  @override
  Future<ApiPage<CreatorAction>> listOwnCreatorActions({String? state, String? type, String? cursor, int? limit}) async => throw UnimplementedError('Not published: the implementation is private.');

  @override
  Future<CreatorAction> getOwnCreatorAction(String creatorActionId) async => throw UnimplementedError('Not published: the implementation is private.');

  @override
  Future<CreatorAction> createCreatorAction({
    required String type,
    required String slug,
    required String title,
    String? description,
    DateTime? startsAt,
    DateTime? endsAt,
    Json config = const {},
    String? idempotencyKey,
  }) async => throw UnimplementedError('Not published: the implementation is private.');

  @override
  Future<CreatorAction> updateOwnCreatorAction(String creatorActionId, Json changes) async => throw UnimplementedError('Not published: the implementation is private.');

  @override
  Future<CreatorAction> publishCreatorAction(String creatorActionId) => throw UnimplementedError('Not published: the implementation is private.');

  @override
  Future<CreatorAction> pauseCreatorAction(String creatorActionId) => throw UnimplementedError('Not published: the implementation is private.');

  @override
  Future<CreatorAction> resumeCreatorAction(String creatorActionId) => throw UnimplementedError('Not published: the implementation is private.');

  @override
  Future<CreatorAction> disableCreatorAction(String creatorActionId) => throw UnimplementedError('Not published: the implementation is private.');

  @override
  Future<ApiPage<VoteTallyEntry>> listOwnVoteTally(String creatorActionId, {String? cursor, int? limit}) async => throw UnimplementedError('Not published: the implementation is private.');

  @override
  Future<ApiPage<ActionOption>> listCreatorActionOptions(String creatorActionId, {String? cursor, int? limit}) async => throw UnimplementedError('Not published: the implementation is private.');

  @override
  Future<ActionOption> addCreatorActionOption(String creatorActionId, {required String label, int? position}) async => throw UnimplementedError('Not published: the implementation is private.');

  @override
  Future<ActionOption> updateCreatorActionOption(String creatorActionId, String optionId, {String? label, int? position, bool? available}) async => throw UnimplementedError('Not published: the implementation is private.');

  @override
  Future<void> removeCreatorActionOption(String creatorActionId, String optionId) => throw UnimplementedError('Not published: the implementation is private.');

  @override
  Future<ApiPage<Playlist>> listOwnPlaylists({String? status, String? cursor, int? limit}) async => throw UnimplementedError('Not published: the implementation is private.');

  @override
  Future<Playlist> createPlaylist(String name) async => throw UnimplementedError('Not published: the implementation is private.');

  @override
  Future<Playlist> updatePlaylist(String playlistId, {String? name, String? status}) async => throw UnimplementedError('Not published: the implementation is private.');

  @override
  Future<ApiPage<PlaylistItem>> listPlaylistItems(String playlistId, {String? cursor, int? limit}) async => throw UnimplementedError('Not published: the implementation is private.');

  @override
  Future<PlaylistItem> addPlaylistItem(String playlistId, {required String title, String? artist}) async => throw UnimplementedError('Not published: the implementation is private.');

  @override
  Future<PlaylistItem> updatePlaylistItem(String playlistId, String itemId,
          {required String title, required String? artist, required bool available, int? position}) async => throw UnimplementedError('Not published: the implementation is private.');

  @override
  Future<void> removePlaylistItem(String playlistId, String itemId) => throw UnimplementedError('Not published: the implementation is private.');

  @override
  Future<ApiPage<IncomingAction>> listIncomingActions({String? creatorActionId, String? type, String? state, String? cursor, int? limit}) async => throw UnimplementedError('Not published: the implementation is private.');

  @override
  Future<IncomingAction> getIncomingAction(String actionId) async => throw UnimplementedError('Not published: the implementation is private.');

  @override
  Future<IncomingAction> acceptAction(String actionId) async => throw UnimplementedError('Not published: the implementation is private.');

  @override
  Future<IncomingAction> rejectAction(String actionId, {String? reason}) async => throw UnimplementedError('Not published: the implementation is private.');

  @override
  Future<IncomingAction> fulfilAction(String actionId) async => throw UnimplementedError('Not published: the implementation is private.');
}
