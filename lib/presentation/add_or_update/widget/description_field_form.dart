import 'package:flutter/material.dart';
import 'package:task_manager_app/generated/l10n.dart' show S;

/// A widget that displays a text form field for entering a task's description.
///
/// The [DescriptionFieldForm] widget is designed to collect a description
/// from the user. It supports multiple lines of input and validates that
/// the description is not empty.
class DescriptionFieldForm extends StatelessWidget {
  final String? initialValue;
  final Function(String value) onChanged;
  const DescriptionFieldForm({
    super.key,
    this.initialValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      minLines: 10,
      maxLines: 100,
      textAlignVertical: TextAlignVertical.top,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: S.of(context).enterTheDescription,
      ),
      onChanged: onChanged,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return S.of(context).descRequired;
        }
        return null;
      },
    );
  }
}
