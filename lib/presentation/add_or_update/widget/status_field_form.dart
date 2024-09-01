import 'package:flutter/material.dart';

/// A widget that displays a status selection button for a task.
class StatusFieldForm extends StatelessWidget {
  final bool selected;
  final String text;
  final Function() onSelect;
  const StatusFieldForm({
    super.key,
    required this.selected,
    required this.text,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      style: selected
          ? TextButton.styleFrom(
              iconColor: Theme.of(context).colorScheme.primary,
              foregroundColor: Theme.of(context).colorScheme.primary,
            )
          : TextButton.styleFrom(
              iconColor: Theme.of(context).colorScheme.onSecondaryContainer,
              foregroundColor: Theme.of(context).colorScheme.onSecondaryContainer,
            ),
      onPressed: onSelect,
      label: Text(text),
      icon: Icon(
        selected
            ? Icons.check_box_rounded
            : Icons.check_box_outline_blank_rounded,
      ),
    );
  }
}
