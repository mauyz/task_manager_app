import 'package:flutter/material.dart';

/// A widget that displays an error message in red text.
class ErrorTextWidget extends StatelessWidget {
  final String text;
  const ErrorTextWidget({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: Colors.red,
          ),
    );
  }
}
