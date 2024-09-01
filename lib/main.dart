import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager_app/app/app.dart';

void main() {
  // The entry point of the Flutter application.
  // This sets up the application with Riverpod's ProviderScope,
  // which makes providers accessible throughout the widget tree.
  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}
