import 'package:flutter/material.dart';

/// A form field for entering a title of a task.
///
/// This widget is a [TextFormField] that includes a hint text and validation to ensure
/// that the title is not empty.
class TitleFieldForm extends StatelessWidget {
  final String? initialValue;
  final Function(String value) onChanged;
  const TitleFieldForm({
    super.key,
    this.initialValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        hintText: "Entrer le titre",
      ),
      onChanged: onChanged,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Le titre est obligatoire";
        }
        return null;
      },
    );
  }
}
