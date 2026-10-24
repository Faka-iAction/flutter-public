/// Inbound links (architecture 9; reuse plan 5.2).
///
/// The app opens the same canonical paths as the web, so every app link has a
/// working web route: `/@handle`, `/@handle/slug`, `/q/{id}` and `/a/{id}`,
/// plus the consumer tabs. An absolute link is accepted only from an
/// allowlisted host (the configured web origin), enforced here as well as in
/// the platform's app-link configuration. Anything else opens Discover; the
/// app never navigates to a location it did not validate.
library;

abstract final class DeepLinks {
  static final _handle = RegExp(r'^[A-Za-z0-9_]{1,64}$');
  static final _slug = RegExp(r'^[A-Za-z0-9_-]{1,60}$');
  static final _id = RegExp(r'^[A-Za-z0-9_-]{1,64}$');

  static const _fixed = {
    '/',
    '/@',
    '/search',
    '/learn',
    '/activity',
    '/following',
    '/me/profile',
    '/me/inbox',
    '/me/support',
    '/me/legal/terms',
    '/me/legal/disclaimer',
    '/me/legal/privacy',
    '/sign-in',
    '/sign-in/code',
    '/creator',
    '/creator/actions',
    '/creator/activity',
    '/creator/more',
    '/creator/earnings',
    '/creator/profile',
    '/creator/profile/edit',
    '/creator/actions/new',
    '/creator/playlists',
    '/creator/cash',
    '/me/become-creator',
  };

  /// The kinds of Creator Action in `/creator/actions/new/{kind}`, as on the web.
  static const actionKinds = {'request', 'vote', 'shout-out', 'bid', 'tip'};

  static const _creatorActionStates = {'DRAFT', 'PUBLISHED', 'ACTIVE', 'PAUSED', 'EXPIRED', 'DISABLED'};
  static const _participantStates = {
    'CREATED', 'INITIATED', 'SUBMITTED', 'ACCEPTED', 'FULFILLED', 'COMPLETED', 'REJECTED', 'CANCELLED', 'EXPIRED', 'FAILED', //
  };

  /// The in-app location for [uri], or null when it is not a supported link.
  /// [hosts] is the allowlist for absolute links.
  static String? locationFor(Uri uri, Set<String> hosts) {
    throw UnimplementedError('Not published: the implementation is private.');
  }

  /// A return path after sign-in: only an in-app location this class accepts.
  static String? safeReturnPath(String? value) {
    throw UnimplementedError('Not published: the implementation is private.');
  }

  static final _qrCode = RegExp(r'^[A-Za-z0-9_-]{1,64}$');

  /// A code typed or pasted on Discover, as the web reads it: the code printed
  /// under the QR, or the whole `/q/{code}` link. Null when it cannot be a code.
  static String? qrCodeFromTyped(String typed) {
    throw UnimplementedError('Not published: the implementation is private.');
  }
}
