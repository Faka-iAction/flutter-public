/// Progressive navigation (architecture 4.4 and 25.4), the same rules as the
/// web's `MemberNavigation`. Pure functions, so the rules are tested alone.
library;

enum Experience { consumer, creator }

enum AppTab {
  // Consumer experience: at most four tabs.
  discover('Discover', '/'),
  activity('Activity', '/activity'),
  following('Following', '/following'),
  profile('Profile', '/me/profile'),
  // Creator experience: at most five tabs. New capabilities go under More,
  // never into a new tab.
  home('Home', '/creator'),
  actions('Actions', '/creator/actions'),
  creatorActivity('Activity', '/creator/activity'),
  more('More', '/creator/more'),
  creatorProfile('Profile', '/creator/profile');

  const AppTab(this.label, this.path);
  final String label;
  final String path;
}

class NavInputs {
  const NavInputs({
    this.signedIn = false,
    this.guestHasTakenPart = false,
    this.followingCount = 0,
    this.isCreator = false,
    this.experience = Experience.consumer,
    this.hasOwnActivity = false,
  });

  final bool signedIn;

  /// The member has taken part at least once (ui-spec 8.1: Discover becomes the search).
  final bool hasOwnActivity;

  /// A guest on this device has completed at least one Action.
  final bool guestHasTakenPart;

  /// How many creators the member follows. Only "0, 1 or 2 and more" matters.
  final int followingCount;

  /// The member holds the `CREATOR` capability.
  final bool isCreator;

  /// The experience the member chose. Ignored unless [isCreator].
  final Experience experience;
}

abstract final class NavRules {
  /// The Following tab appears from this many followed creators: it stays
  /// hidden until the member follows more than one.
  static const followingTabFrom = 2;

  static Experience effectiveExperience(NavInputs i) => throw UnimplementedError('Not published: the implementation is private.');

  /// The bottom tabs to show. Empty means no persistent navigation (a new
  /// guest).
  static List<AppTab> tabs(NavInputs i) {
    throw UnimplementedError('Not published: the implementation is private.');
  }

  /// Discover's layout (ui-spec 8.1): a member who follows someone or has
  /// taken part gets the search layout; guests and new members get the hub.
  static bool browseMode(NavInputs i) => throw UnimplementedError('Not published: the implementation is private.');

  /// The experience switch exists only once the member has the creator
  /// capability. It is shown on Discover and on the creator Home, not as a tab.
  static bool showExperienceSwitch(NavInputs i) => throw UnimplementedError('Not published: the implementation is private.');
}
