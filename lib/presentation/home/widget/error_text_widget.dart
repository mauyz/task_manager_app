import 'package:flutter/material.dart';

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
