import 'package:flutter/material.dart';

import '../api/faka_api.dart';
import 'ref_icons.dart';
import 'theme.dart';

/// A heading announced as a heading by screen readers.
class Heading extends StatelessWidget {
  const Heading(this.text, {super.key, this.level = 1});

  final String text;

  /// 1 for the page title, 2 for a section, 3 below that.
  final int level;

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError('Not published: the implementation is private.');
  }
}

/// A scrollable page body with the standard side gutter, in one centred
/// column no wider than [FakaTheme.maxContentWidth] (ui-spec 3.3 and 3.5).
class PageBody extends StatelessWidget {
  const PageBody({super.key, required this.children, this.onRefresh});

  final List<Widget> children;
  final Future<void> Function()? onRefresh;

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError('Not published: the implementation is private.');
  }
}

/// A boxed message, announced politely when it appears: a tint box, or the
/// error background with an error border (ui-spec 3.4 Notice).
class Notice extends StatelessWidget {
  const Notice({super.key, required this.children, this.isError = false});

  final List<Widget> children;
  final bool isError;

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError('Not published: the implementation is private.');
  }
}

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) => throw UnimplementedError('Not published: the implementation is private.');
}

/// Wording for failures that are not specific to one screen.
String generalErrorMessage(Object error) {
    throw UnimplementedError('Not published: the implementation is private.');
  }

/// A failure, with a retry button and the reference support asks for.
class ErrorNotice extends StatelessWidget {
  const ErrorNotice({super.key, required this.error, this.message, this.onRetry});

  final Object error;
  final String? message;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError('Not published: the implementation is private.');
  }
}

/// A label and value pair, as on the web's `<dl>` (ui-spec 3.4 detail rows):
/// a muted label column of about 30%, the value, and a hairline below.
class DetailRow extends StatelessWidget {
  const DetailRow(this.label, this.value, {super.key, this.mono = false});

  final String label;
  final String value;

  /// A reference or code, in a monospace face (ui-spec 3.2 `.mono`).
  final bool mono;

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError('Not published: the implementation is private.');
  }
}

/// Gap.
const gap = SizedBox(height: 12);

/// Initials in a tint circle (ui-spec 3.4 Avatar): 44, 64 or 84 across.
class Avatar extends StatelessWidget {
  const Avatar(this.name, {super.key, this.size = 44});

  final String name;
  final double size;

  static String initials(String name) => throw UnimplementedError('Not published: the implementation is private.');

  @override
  Widget build(BuildContext context) => throw UnimplementedError('Not published: the implementation is private.');
}

/// The kinds of status chip (ui-spec 3.4 Chip).
enum ChipKind { primary, ok, warn, err, neu, draft }

/// A status pill with text: colour is never the only signal.
class StatusChip extends StatelessWidget {
  const StatusChip(this.text, {super.key, this.kind = ChipKind.primary});

  final String text;
  final ChipKind kind;

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError('Not published: the implementation is private.');
  }
}

/// A section label: small, uppercase, muted (ui-spec 3.2 `.sec`). Announced as a heading.
class SectionLabel extends StatelessWidget {
  const SectionLabel(this.text, {super.key, this.center = false, this.trailing});

  final String text;
  final bool center;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError('Not published: the implementation is private.');
  }
}

/// A card-coloured row (ui-spec 3.4 Tile): a bold title, a muted line, and a
/// chip or chevron on the right. The whole tile is the touch target.
class FakaTile extends StatelessWidget {
  const FakaTile({super.key, required this.title, this.subtitle, this.trailing, this.onTap});

  final String title;
  final String? subtitle;
  final Widget? trailing;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError('Not published: the implementation is private.');
  }
}

/// A group heading with its buttons on the right and a muted caption (ui-spec 8.21).
class GroupHeading extends StatelessWidget {
  const GroupHeading(this.text, {super.key, required this.caption, this.actions = const []});

  final String text;
  final String caption;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) => throw UnimplementedError('Not published: the implementation is private.');
}

/// "or" between two hairlines (ui-spec 8.1, 8.9).
class OrDivider extends StatelessWidget {
  const OrDivider({super.key, this.padding = const EdgeInsets.symmetric(vertical: 12, horizontal: 48)});

  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError('Not published: the implementation is private.');
  }
}

/// A card-coloured disclosure (ui-spec 3.4 Details): a 48px summary that
/// opens to its children.
class Disclosure extends StatelessWidget {
  const Disclosure({super.key, required this.title, required this.children, this.initiallyExpanded = false});

  final String title;
  final List<Widget> children;
  final bool initiallyExpanded;

  @override
  Widget build(BuildContext context) => throw UnimplementedError('Not published: the implementation is private.');
}

/// The 48px tint circle with a "+" at the right of a list head (ui-spec 3.4 `.lh`).
class PlusButton extends StatelessWidget {
  const PlusButton({super.key, required this.label, required this.onPressed});

  /// What it does, for screen readers and the tooltip, like "New Creator Action".
  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) => throw UnimplementedError('Not published: the implementation is private.');
}

/// An optional field behind a "+" (ui-spec 3.4 optField): the label row
/// "Label (optional)" with a + on the right; the field shows once toggled, and
/// starts open when it already has text or an error.
class OptionalField extends StatefulWidget {
  const OptionalField({super.key, required this.label, required this.startOpen, required this.field, this.toggleKey});

  final String label;
  final bool startOpen;
  final Widget field;
  final Key? toggleKey;

  @override
  State<OptionalField> createState() => throw UnimplementedError('Not published: the implementation is private.');
}

/// An add row (ui-spec `addRow`): one or two inline fields and a square brand "+" button.
class AddRow extends StatelessWidget {
  const AddRow({super.key, required this.fields, required this.onAdd, required this.label, required this.buttonKey, this.error});

  /// (key, hint, controller, maxLength) for each field.
  final List<(Key, String, TextEditingController, int)> fields;
  final VoidCallback? onAdd;

  /// What the button does, for screen readers: "Add choice", "Make the playlist".
  final String label;
  final Key buttonKey;
  final String? error;

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError('Not published: the implementation is private.');
  }
}

/// A centred empty state (ui-spec 3.4 `.nolist`): a 64px tint circle with an
/// icon, a message, and an optional call to action.
class EmptyState extends StatelessWidget {
  const EmptyState({super.key, required this.icon, required this.message, this.action, this.messageKey, this.title});

  /// An [IconData] or one of the reference's [RefIcons].
  final Object icon;
  final String? title;
  final String message;
  final Widget? action;
  final Key? messageKey;

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError('Not published: the implementation is private.');
  }
}

/// A page with a top bar (with Back when there is somewhere to go back to).
class FakaPage extends StatelessWidget {
  const FakaPage({super.key, required this.title, this.children = const [], this.onRefresh, this.actions = const [], this.body});

  /// The short title in the top bar. The page's own heading is in [children].
  final String title;
  final List<Widget> children;
  final Future<void> Function()? onRefresh;

  /// The top bar's right-side control (ui-spec 4.1): Join, a QR or info icon, a pill.
  final List<Widget> actions;

  /// A body to use instead of the scrolling column of [children].
  final Widget? body;

  @override
  Widget build(BuildContext context) => throw UnimplementedError('Not published: the implementation is private.');
}

/// The bar's "Join" text link for guests (ui-spec 4.1).
class JoinButton extends StatelessWidget {
  const JoinButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) => throw UnimplementedError('Not published: the implementation is private.');
}

/// The mode strip (ui-spec 8.23 `.modebar`): a tint box, the mode on the left,
/// the switch on the right.
class ModeStrip extends StatelessWidget {
  const ModeStrip({super.key, required this.label, required this.button, required this.onPressed});

  final String label;
  final String button;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) => throw UnimplementedError('Not published: the implementation is private.');
}

/// A filter chip (ui-spec 3.4 `.fchip`): a 40px pill; pressed = filled primary.
class FilterPill extends StatelessWidget {
  const FilterPill({super.key, required this.label, required this.selected, required this.onPressed});

  final String label;
  final bool selected;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError('Not published: the implementation is private.');
  }
}

/// Segmented tabs (ui-spec 3.4 `.ltabs`): a card-coloured track; the chosen
/// tab is surface-coloured with primary text.
class SegmentedTabs extends StatelessWidget {
  const SegmentedTabs({super.key, required this.labels, required this.selected, required this.onSelected});

  final List<String> labels;
  final int selected;
  final ValueChanged<int> onSelected;

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError('Not published: the implementation is private.');
  }
}

/// A creator row (ui-spec 8.3 `.crow`): avatar, bold name, "@handle · Kind ·
/// City" on one line, a chevron; a hairline below unless it is the last.
class CreatorRow extends StatelessWidget {
  const CreatorRow({super.key, required this.name, required this.line, required this.onTap, this.last = false, this.trailing});

  final String name;
  final String line;
  final VoidCallback onTap;
  final bool last;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError('Not published: the implementation is private.');
  }
}

/// A dialog in the reference's shape (ui-spec 9): a 22px-radius card,
/// bottom-aligned on a phone, heading then content then a right-aligned row
/// of buttons.
Future<T?> showFakaDialog<T>(BuildContext context, {required WidgetBuilder builder}) => throw UnimplementedError('Not published: the implementation is private.');

/// A field's label above its control (ui-spec 3.4 Field: 600 14px), with
/// "(optional)" in muted text. The control carries the label for screen readers.
class FieldLabel extends StatelessWidget {
  const FieldLabel(this.text, {super.key, this.optional = false, this.forKey});

  final String text;
  final bool optional;

  /// The key of the field it labels, for reading the code; not used at run time.
  final String? forKey;

  @override
  Widget build(BuildContext context) => throw UnimplementedError('Not published: the implementation is private.');
}

/// The heading of a dialog (ui-spec 9: an h2).
class DialogHeading extends StatelessWidget {
  const DialogHeading(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) => throw UnimplementedError('Not published: the implementation is private.');
}

/// A form field with its label above, its error announced, and the label
/// used as the semantic label.
class LabelledField extends StatelessWidget {
  const LabelledField({
    super.key,
    required this.label,
    required this.controller,
    this.hint,
    this.error,
    this.keyboardType,
    this.obscure = false,
    this.maxLength,
    this.maxLines = 1,
    this.autofillHints,
    this.fieldKey,
    this.onSubmitted,
    this.optional = false,
    this.labelHidden = false,
  });

  final String label;

  /// The label is shown by something else (an optional field's row): screen readers still get it.
  final bool labelHidden;
  final TextEditingController controller;
  final String? hint;
  final String? error;
  final TextInputType? keyboardType;
  final bool obscure;
  final int? maxLength;
  final int maxLines;
  final Iterable<String>? autofillHints;
  final Key? fieldKey;
  final ValueChanged<String>? onSubmitted;
  final bool optional;

  @override
  Widget build(BuildContext context) => throw UnimplementedError('Not published: the implementation is private.');
}

/// Votes per option, as the web's results table.
class TallyTable extends StatelessWidget {
  const TallyTable({super.key, required this.rows});

  final List<VoteTallyEntry> rows;

  @override
  Widget build(BuildContext context) => throw UnimplementedError('Not published: the implementation is private.');
}
