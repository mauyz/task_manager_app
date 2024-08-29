import 'package:flutter/material.dart';

class FieldTitleWidget extends StatelessWidget {
  final String text;
  const FieldTitleWidget({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.titleMedium,
    );
  }
}
