import 'package:flutter/material.dart';

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
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        hintText: "Entrer la description",
      ),
      onChanged: onChanged,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "La description est obligatoire";
        }
        return null;
      },
    );
  }
}
