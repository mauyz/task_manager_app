import 'package:flutter/material.dart';

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
      ),
      onChanged: onChanged,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Ce champ est obligatoire";
        }
        return null;
      },
    );
  }
}
