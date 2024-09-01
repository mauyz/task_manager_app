import 'package:flutter/material.dart';

/// A customizable submit button.
class SubmitButton extends StatelessWidget {
  final String text;
  final Function()? onSubmit;
  const SubmitButton({
    super.key,
    required this.text,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onSubmit,
      child: Text(text),
    );
  }
}
