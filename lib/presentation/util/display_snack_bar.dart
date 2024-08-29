import 'package:flutter/material.dart';

void displaySnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).clearSnackBars();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        textAlign: TextAlign.center,
      ),
      padding: const EdgeInsets.all(8.0),
      duration: const Duration(seconds: 2),
    ),
  );
}
